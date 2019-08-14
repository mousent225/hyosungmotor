var contactController = function () {
    var Ent = { Id: 0, Name: "", Address: "", AddressURL: "", Email: "", PhoneNumber: "", PublishStatus: 0, Seq: 0, Status: 1 };

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
            Ent = { Id: 0, Name: "", Address: "", AddressURL: "", Email: "", PhoneNumber: "", PublishStatus: 0, Seq: 0, Status: 1 };
            resetFormDetail(Ent);

            $("#mdDetail").modal("show");
        });
        $('#btnModalSave').on('click', function (e) {
            e.preventDefault();
            if (!getValueFormDetail())
                return;
            $.ajax({
                type: "POST",
                url: "/Admin/Contact/SaveEntity",
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
                url: "/Admin/Contact/GetById",
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
                    url: "/Admin/Contact/Delete",
                    data: JSON.stringify({ id: that }),
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
    }
    //-----------------------------------------------------------Begin: form add_edit model
    function resetFormDetail(ent) {
        $("#hdfId").val(ent.Id);
        $("#txtName").val(ent.Name);
        $("#txtAddress").val(ent.Address);
        $("#txtAddressUrl").val(ent.AddressURL);
        $("#txtEmail").val(ent.Email);
        $("#txtPhoneNumber").val(ent.PhoneNumber);
        $("#txtSeq").val(ent.Seq);
        $("#cbStatus").val(ent.Status);
        $("#cbPublish").val(ent.PublishStatus);

        $("[name='detail-value']").trigger("change");
    }
    function getValueFormDetail() {
        Ent.Id = $("#hdfId").val();
        if (!common.checkIsNullOrEmpty($("#txtHeading"), "Please input into field: Heading"))
            return false;
        Ent.Name = $("#txtName").val().trim();
        if (!common.checkIsNullOrEmpty($("#txtName"), "Please input into field: Name"))
            return false;
        Ent.Address = $("#txtAddress").val().trim();
        if (!common.checkIsNullOrEmpty($("#txtAddress"), "Please input into field: Address"))
            return false;
        Ent.AddressURL = $("#txtAddressUrl").val().trim();
        if (!common.checkIsNullOrEmpty($("#txtAddressUrl"), "Please input into field: Address URL"))
            return false;
        Ent.Email = $("#txtEmail").val().trim();
        if (!common.checkIsNullOrEmpty($("#txtEmail"), "Please input into field: Email"))
            return false;
        if (!common.validateEmail(Ent.Email)) {
            common.notify("Hyosung Motor", "Email is not correct format", "gray error");
            return false;
        }
        Ent.PhoneNumber = $("#txtPhoneNumber").val().trim();
        if (!common.checkIsNullOrEmpty($("#txtPhoneNumber"), "Please input into field: Phone Number"))
            return false;
        if (!common.validatePhoneNumber(Ent.PhoneNumber)) {
            common.notify("Hyosung Motor", "Phone number is not correct format", "gray error");
            return false;
        }
        Ent.Seq = $("#txtSeq").val().trim();
        Ent.Status = $("#cbStatus").val();
        Ent.PublishStatus = $("#cbPublish").val();

        return true;
    }
    //-----------------------------------------------------------End: form add_edit model

    //-----------------------------------------------------------Begin: gen data for grid view
    function loadData(isPageChange) {

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
            url: "/admin/Contact/GetAllPaging",
            dataType: "json",
            success: function (response) {
                if (response.Results.length === 0) {
                    $("#tbl-content").html("");
                    $("#tbl-content").append($("<tr>").append($("<td>").attr("colspan", 11).html("There is no data to display!!").addClass("text-center")));
                }
                $.each(response.Results, function (i, item) {
                    render += Mustache.render(template, {
                        Sequence: i + 1,
                        Id: item.Id,
                        Name: item.Name,
                        Address: item.Address,
                        AddressURL: item.AddressURL,
                        Email: item.Email,
                        PhoneNumber: item.PhoneNumber,
                        Seq: item.Seq,
                        CreatedDate: common.dateTimeFormatJson(item.DateCreated),
                        Status: common.getStatus(item.Status),
                        PublishStatus: common.getPublishStatus(item.PublishStatus),
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


}