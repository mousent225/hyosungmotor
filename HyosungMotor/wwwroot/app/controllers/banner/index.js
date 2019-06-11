var bannerController = function () {
    var EntKor = { Id: 0, MasterId: 0, Headding: "", SubHeading: "", Description: "" },
        EntVie = { Id: 0, MasterId: 0, Headding: "", SubHeading: "", Description: "" };
    var Ent = { Id: 0, Heading: "", SubHeading: "", Description: "", Status: 1, PublishStatus: 0, BannerKo: EntKor, BannerVi: EntVie };

    var fileIputInitial = $("#fileInputImage");

    this.initialize = function () {
        loadData();
        registerEvent();
        common.setTableHeight($(".table-responsive"));
    };
    function registerEvent() {
        common.getStatusData($("#cbStatus"), "status", 1);
        common.getStatusData($("#cbPublish"), "publish_status", 0);
        $("#ddlShowPage").on('change', function () {
            common.configs.pageSize = $(this).val();
            common.configs.pageIndex = 1;
            loadData(true);
        });
        $('#txtCreateDateRange').datepicker({ todayHighlight: true, format: _dateFormat });

        $("#txtKeyword").on("keypress", function (e) {
            if (e.which === 13) {
                loadData(true);
            }
        });
        $("#btnGo").on("click", function () {
            loadData(true);
        });
        $("#btnCreate").on("click", function () {
            Ent = { Id: 0, Heading: "", SubHeading: "", Description: "", Status: 1, PublishStatus: 0, BannerKo: EntKor, BannerVi: EntVie };
            resetFormDetail(Ent);
            
            $("#mdDetail").modal("show");
        });
        $('#btnModalSave').on('click', function (e) {
            e.preventDefault();
            if (!getValueFormDetail())
                return;
            $.ajax({
                type: "POST",
                url: "/Admin/Banner/SaveEntity",
                data: JSON.stringify({ model: Ent }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    common.startLoading();
                },
                success: function (response) {
                    $("#mdDetail").modal("hide");
                    loadData();
                    console.log(response);
                    common.notify("Hyosung Motor", 'Save successful', 'gray success');
                },
                error: function () {
                    common.notify("Hyosung Motor", 'Has an error in progress', 'gray error');
                    common.stopLoading();
                }
            });
            return false;

        });
        $("body").on("click", ".btn-edit", function (e) {
            e.preventDefault();
            var that = $(this).data("id");
            $.ajax({
                type: "GET",
                url: "/Admin/Banner/GetById",
                data: { id: that },
                dataType: "json",
                beforeSend: function () {
                    common.startLoading();
                },
                success: function (response) {
                    var data = response;
                    resetFormDetail(data);
                    $('#mdDetail').modal('show');
                    common.stopLoading();

                },
                error: function (status) {
                    console.log(status);
                    common.notify("Hyosung Motor", 'Có lỗi xảy ra', 'gray error');
                    common.stopLoading();
                }
            });
        });
        $('body').on('click', '.btn-delete', function (e) {
            e.preventDefault();
            var that = $(this).data('id');
            common.confirm('Are you sure to delete?', function () {
                $.ajax({
                    type: "POST",
                    url: "/Admin/Banner/Delete",
                    data: JSON.stringify( { id: that }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    beforeSend: function () {
                        common.startLoading();
                    },
                    success: function (response) {
                        common.notify("Hyosung Motor", 'Delete successful', 'gray success');
                        common.stopLoading();
                        loadData();
                    },
                    error: function (status) {
                        common.notify("Hyosung Motor", 'Has an error in delete progress', 'error');
                        common.stopLoading();
                    }
                });
            });
        });
        $("#btnImage").on("click", function (e) {
            e.preventDefault();
            $("#fileInputImage").trigger("click");
        });
        $("#fileInputImage").on('change', function () {
            var fileUpload = $(this).get(0);
            var files = fileUpload.files;
            var data = new FormData();
            for (var i = 0; i < files.length; i++) {
                data.append(files[i].name, files[i]);
            }
            $.ajax({
                type: "POST",
                url: "/Admin/Upload/UploadImage",
                contentType: false,
                processData: false,
                data: data,
                success: function (res) {
                    //clearFileInput($("#fileImage"));
                    $("#txtImageUrl").val(res.FileName);
                    $("#txtImageUrl").trigger("change");
                },
                error: function () {
                    tedu.notify("Hyosung Motor", 'There was error uploading files!', 'gray error');
                }
            });
        });
    }
    //-----------------------------------------------------------Begin: form add_edit model
    function resetFormDetail(ent) {
        $("#hdfId").val(ent.Id);
        $("#txtHeading").val(ent.Heading);
        $("#txtSubHeading").val(ent.SubHeading);
        $("#txtDesc").val(ent.Description);
        $("#cbStatus").val(ent.Status);
        $("#cbPublish").val(ent.PublishStatus);
        $("#txtImageUrl").val(ent.Image);

        $("#txtHeadingKor").val(ent.BannerKo.Heading);
        $("#txtSubHeadingKor").val(ent.BannerKo.SubHeading);
        $("#txtDescKor").val(ent.BannerKo.Description);
        $("#hdfKorId").val(ent.BannerKo.Id);

        $("#txtHeadingVie").val(ent.BannerVi.Heading);
        $("#txtSubHeadingVie").val(ent.BannerVi.SubHeading);
        $("#txtDescVie").val(ent.BannerVi.Description);
        $("#hdfVieId").val(ent.BannerVi.Id);
        $("#txtImageUrl").val(ent.Image);

        $("[name='detail-value']").trigger("change");
    }
    function getValueFormDetail() {
        Ent.Id = $("#hdfId").val();
        if (!common.checkIsNullOrEmpty($("#txtHeading"), "Please input into field: Heading"))
            return false;
        Ent.Heading = $("#txtHeading").val().trim();
        Ent.SubHeading = $("#txtSubHeading").val().trim();
        if (!common.checkIsNullOrEmpty($("#txtSubHeading"), "Please input into field: Sub Heading"))
            return false;
        Ent.Description = $("#txtDesc").val().trim();
        if (!common.checkIsNullOrEmpty($("#txtDesc"), "Please input into field: Description"))
            return false;
        Ent.Status = $("#cbStatus").val();
        Ent.PublishStatus = $("#cbPublish").val();
        Ent.Image = $("#txtImageUrl").val();

        EntKor.MasterId = $("#hdfId").val();
        EntKor.Id = $("#hdfKorId").val();
        EntKor.Heading = $("#txtHeadingKor").val().trim();
        EntKor.SubHeading = $("#txtSubHeadingKor").val().trim();
        EntKor.Description = $("#txtDescKor").val().trim();
        Ent.BannerKo = EntKor;

        EntVie.MasterId = $("#hdfId").val();
        EntVie.Id = $("#hdfVieId").val();
        EntVie.Heading = $("#txtHeadingVie").val().trim();
        EntVie.SubHeading = $("#txtSubHeadingVie").val().trim();
        EntVie.Description = $("#txtDescVie").val().trim();
        Ent.BannerVi = EntVie;
        return true;
    }
    //-----------------------------------------------------------End: form add_edit model

    //-----------------------------------------------------------Begin: gen data for grid view
    function loadData(isPageChange) {
        var dateRange = $("#txtCreateDateRange").find("input");
        //var fromDate = common.isValidDate($(dateRange[0]).val(), _minDate).toISOString();
        //var toDate = common.isValidDate($(dateRange[1]).val(), _maxDate).toISOString();
        var template = $("#table-template").html();
        var render = "";
        $.ajax({
            type: "GET",
            data: {
                //fromDate: fromDate, toDate: toDate,
                keyword: $("#txtKeyword").val(),
                page: common.configs.pageIndex,
                pageSize: common.configs.pageSize
            },
            url: "/admin/banner/GetAllPaging",
            dataType: "json",
            success: function (response) {
                if (response.Results.length === 0) {
                    $("#tbl-content").html("");
                    $("#tbl-content").append($("<tr>").append($("<td>").attr("colspan", 8).html("There is no data to display!!").addClass("text-center")));
                }
                $.each(response.Results, function (i, item) {
                    render += Mustache.render(template, {
                        Sequence: i + 1,
                        Id: item.Id,
                        Heading: item.Heading,
                        SubHeading: item.SubHeading,
                        Description: item.Description,
                        UserCreated: common.UserCreated,
                        CreatedDate: common.dateTimeFormatJson(item.DateCreated),
                        Status: common.getStatus(item.Status),
                        PublishStatus: common.getPublishStatus(item.PublishStatus),
                        Language: common.getLanguage(item.HasKo, item.HasVi),
                        UserCreate: item.UserCreated
                    });
                    if (render !== "") {
                        $("#tbl-content").html(render);
                        $("#lblTotalRecord").html(response.RowCount);
                    }
                });
                wrapPaging(response.RowCount, function () {
                    loadData();
                }, isPageChange);

            },
            error: function (status) {
                console.log(status);
                common.notify("Motor Homepage Admin", "Cant loading data", "gray error");
            }
        });
    }
    function wrapPaging(recordCount, callBack, changePageSize) {
        var totalSize = Math.ceil(recordCount / common.configs.pageSize);
        //Unbind pagination if it existed or click change pagesize
        if ($("#paginationUl a").length === 0 || changePageSize === true) {
            $("#paginationUl").empty();
            $("#paginationUl").removeData("twbs-pagination");
            $("#paginationUl").unbind("page");
        }
        //Bind Pagination Event
        $("#paginationUl").twbsPagination({
            totalPages: totalSize,
            visiblePages: 7,
            onPageClick: function (e, p) {
                common.configs.pageIndex = p;
                setTimeout(callBack(), 200);
            }
        });
    }
    //-----------------------------------------------------------End: gen data for grid view

    //-----------------------------------------------------------Begin: image function
    function clearFileInput($ctrl) {
        $ctrl.replaceWith($ctrl.val('').clone(true));
    }
    //-----------------------------------------------------------End: image function

}