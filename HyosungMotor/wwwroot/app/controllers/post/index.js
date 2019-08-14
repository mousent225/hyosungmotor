//post
var postController = function () {

   var EntKor = { Id: 0, Title: "", Description: "", Content: "", ImageCaption: "" },
        EntVie = { Id: 0, Title: "", Description: "", Content: "", ImageCaption: "" };
    var Ent = { Id: 0, Title: "", Description: "", Content: "", ImageCaption: "", Status: 1, PublishStatus: 0, PostKo: EntKor, PostVi: EntVie };

    var fileIputInitial = $("#fileImage");
    var fileThumbnailInitial = $("#fileThumbnailImage");

    this.initialize = function () {
        loadData();
        registerEvent();
        common.setTableHeight($(".table-responsive"));
    }

    function registerEvent() {
        common.getStatusData($("#cbStatus"), "status", 1);
        common.getStatusData($("#cbPublish"), "publish_status", 0);
        $("#ddlShowPage").on('change', function () {
            common.configs.pageSize = $(this).val();
            common.configs.pageIndex = 1;
            loadData(true);
        });
        $("#txtKeyword").on("keypress", function (e) {
            if (e.which === 13) {
                loadData(true);
            }
        });
        $("#btnGo").on("click", function () {
            loadData(true);
        });


        $("#btnCreate").on("click", function () {
            EntKor = { Id: 0, Title: "", Description: "", Content: "", ImageCaption: "" },
            EntVie = { Id: 0, Title: "", Description: "", Content: "", ImageCaption: "" };
            Ent = { Id: 0, Title: "", Description: "", Content: "", ImageCaption: "", Status: 1, PublishStatus: 0, PostKo: EntKor, PostVi: EntVie };
            resetFormDetail(Ent);
            getEditor();
            $("#mdDetail").modal("show");
        });

        $("body").on("click", ".btn-edit", function (e) {
            e.preventDefault();
            getEditor();
            var that = $(this).data("id");

            $.ajax({
                type: "GET",
                url: "/Admin/Post/GetById",
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
                    url: "/Admin/Post/Delete",
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
        $("body").on("click", ".btn-focus", function (e) {
            e.preventDefault();
            var that = $(this).data("id");
            $.ajax({
                type: "GET",
                url: "/Admin/Post/GetById",
                data: { id: that },
                dataType: "json",
                beforeSend: function () {
                    common.startLoading();
                },
                success: function (response) {
                    var data = response;

                    $("#title").text(data.Title);
                    $("#description").text(data.Description);              
                    $("#myImg").attr('src', data.Image);
                //    $("#content").html(data.Content);
                    $('#modalDetail').modal('show');
                //    common.stopLoading();   
                },
                error: function (status) {
                    console.log(status);
                    common.notify("Hyosung Motor", 'Có lỗi xảy ra', 'gray error');
                    common.stopLoading();
                }
            });
        });

        $('#btnModalSave').on('click', function (e) {
            e.preventDefault();
            if (!getValueFormDetail())
                return;
            $.ajax({
                type: "POST",
                url: "/Admin/Post/SaveEntity",
                data: JSON.stringify({ model: Ent }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    common.startLoading();
                },
                success: function (response) {
                    $("#mdDetail").modal("hide");
                    loadData();
                    //console.log(response);
                    common.notify("Hyosung Motor", 'Save successful', 'gray success');
                },
                error: function () {
                    common.notify("Hyosung Motor", 'Has an error in progress', 'gray error');
                    common.stopLoading();
                }
            });
            return false;

        });
        $("#btnImage").on("click", function (e) {
            e.preventDefault();
            $("#fileImage").trigger("click");
        });

        $("#btnThumbnailImage").on("click", function (e) {
            e.preventDefault();
            $("#fileThumbnailImage").trigger("click");
        });

        $("#fileImage").on('change', function () {
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
                    $("#txtImageUrl").val(res.FileName);
                    $("#txtImageUrl").trigger("change");
                },
                error: function () {
                    common.notify("Hyosung Motor", 'There was error uploading files!', 'gray error');
                }
            });
        });

        $("#fileThumbnailImage").on('change', function () {
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
                    $("#txtThumbnailUrl").val(res.FileName);
                    $("#txtThumbnailUrl").trigger("change");
                },
                error: function () {
                    tedu.notify("Hyosung Motor", 'There was error uploading files!', 'gray error');
                }
            });
        });
    }
    function resetFormDetail(ent) {
        $("#hdfId").val(ent.Id);
        $("#txtTitle").val(ent.Title);
        $("#txtDescription").val(ent.Description);
        $("#txtCaption").val(ent.ImageCaption);
        $("#cbStatus").val(ent.Status);
        $("#cbPublish").val(ent.PublishStatus);
        $("#txtImageUrl").val(ent.Image);
        $("#txtThumbnailUrl").val(ent.Thumbnail);
        $("#txtContent").val(ent.Content);
        CKEDITOR.instances['txtContent'].setData(ent.Content);

        $("#txtTitleKor").val(ent.PostKo.Title);
        $("#txtDescriptionKor").val(ent.PostKo.Description);
        $("#txtCaptionKor").val(ent.PostKo.ImageCaption);
        $("#hdfKorId").val(ent.PostKo.Id);
        CKEDITOR.instances['txtContentKor'].setData(ent.PostKo.Content);

        $("#txtTitleVi").val(ent.PostVi.Title);
        $("#txtDescriptionVi").val(ent.PostVi.Description);
        $("#txtCaptionVi").val(ent.PostVi.ImageCaption);
        $("#hdfViId").val(ent.PostVi.Id);
        CKEDITOR.instances['txtContentVie'].setData(ent.PostVi.Content);

        $("[name='detail-value']").trigger("change");
    }

    function getValueFormDetail() {
        Ent.Id = $("#hdfId").val();
        if (!common.checkIsNullOrEmpty($("#txtTitle"), "Please input into field: Title"))
            return false;
        Ent.Title = $("#txtTitle").val().trim();
        Ent.Description = $("#txtDescription").val().trim();
        Ent.Content = CKEDITOR.instances['txtContent'].getData();
        Ent.ImageCaption = $("#txtCaption").val().trim();
        Ent.Status = $("#cbStatus").val();
        Ent.PublishStatus = $("#cbPublish").val();
        Ent.Image = $("#txtImageUrl").val();
        Ent.Thumbnail = $("#txtThumbnailUrl").val();

        EntKor.MasterId = $("#hdfId").val();
        EntKor.Id = $("#hdfKorId").val();
        EntKor.Title = $("#txtTitleKor").val().trim() === "" ? null : $("#txtTitleKor").val().trim();
        EntKor.Content = CKEDITOR.instances['txtContentKor'].getData() === "" ? null : CKEDITOR.instances['txtContentKor'].getData();
        EntKor.Description = $("#txtDescriptionKor").val().trim() === "" ? null : $("#txtDescriptionKor").val().trim();
        Ent.PostKo = EntKor;

        EntVie.MasterId = $("#hdfId").val();
        EntVie.Id = $("#hdfVieId").val();
        EntVie.Title = $("#txtTitleVie").val().trim() === "" ? null : $("#txtTitleVie").val().trim();
        EntVie.Content = CKEDITOR.instances['txtContentVie'].getData() === "" ? null : CKEDITOR.instances['txtContentVie'].getData();
        EntVie.Description = $("#txtDescriptionVie").val().trim() === "" ? null : $("#txtDescriptionVie").val().trim();
        Ent.PostVi = EntVie;
        return true;
    }
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
            url: "/admin/post/GetAllPaging",
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
                        Title: item.Title,
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
    //   filebrowserImageBrowseUrl: '/wwwroot/assets/ckfinder/ckfinder.html?type=Images',              
    //   filebrowserImageUploadUrl: '/ckfinder/connector?command=QuickUpload&type=Images&currentFolder=/cars/'
    //----------------- ckeditor - ckFinder -----------------
    function getEditor() {
        var editor = CKEDITOR.replace("txtContent", {
            filebrowserUploadUrl: '/uploader/upload.php',
            filebrowserBrowseUrl: '/wwwroot/assets/ckfinder/ckfinder.html',          
        });
        var editorKor = CKEDITOR.replace("txtContentKor", {
            filebrowserUploadUrl: '/uploader/upload.php',
            filebrowserBrowseUrl: '/wwwroot/assets/ckfinder/ckfinder.html',
        });
        var editorVi = CKEDITOR.replace("txtContentVie", {
            filebrowserUploadUrl: '/uploader/upload.php',
            filebrowserBrowseUrl: '/wwwroot/assets/ckfinder/ckfinder.html',
        });
        CKFinder.setupCKEditor(editor);
        CKFinder.setupCKEditor(editorKor);
        CKFinder.setupCKEditor(editorVi);
    }
    

    //-----------------------end-----------------------------
}