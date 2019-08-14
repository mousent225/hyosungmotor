var homeController = function () {
    this.initialize = function () {
        AOS.init();
        registerEvents();
        loadData();
        loadDataFor60HzMotor();
        loadDataNews();

    };

    var registerEvents = function () {
        $('body').on('click', '.btnNewsTitle', function (e) {
            e.preventDefault();
            var that = $(this).data('id');
            $.ajax({
                type: "GET",
                url: "/Home/GetNewById",
                data: { id: that, langCode: common.readCookie("LangForMultiLanguage")  },
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    common.startLoading();
                },
                success: function (response) {
                    $("#txtNewsTitle").html(response.Title);
                    $("#txtNewsImage").attr({ "src": response.Image });
                    $("#txtNewsTitle").html(response.Title);
                    $("#txtNewsContent").html(response.Content);
                    $("#mdNews").modal("show");
                    $("#txtNewsPublishDate").html(common.dateTimeFormatJson(response.DateCreated));
                },
                error: function (status) {
                    common.notify("Hyosung Motor", 'Has an error in delete progress', 'error');
                    common.stopLoading();
                }
            });
        });
        $("#ddlShowPage").on('change', function () {
            common.configs.pageSize = $(this).val();
            common.configs.pageIndex = 1;

            loadData(true);
        });
        $("#ddlShowPage60Hz").on('change', function () {
            common.configs.pageSize = $(this).val();
            common.configs.pageIndex = 1;

            loadDataFor60HzMotor(true);
        });
        $("#btnStandardMotor").on("click", function () {
            $("#mdStandardMotor").modal("show");
        });
        $("#btn60HzMotor").on("click", function () {
            $("#md60HzMotor").modal("show");
        });
        $("#btnGearMotor").on("click", function () {
            $("#mdGearedMotor").modal("show");
        });
        $("#btnMvMotor").on("click", function () {
            $("#mdMvMotor").modal("show");
        });
        $(".efficiency").on("click", function (e) {
            e.preventDefault();
            $(".efficiency").parent().removeClass("active");
            $(this).parent().addClass("active");
            loadData();
        });
        $(".standardMvMotor").on("click", function (e) {
            e.preventDefault();

            $(".standardMvMotor").removeClass("btn-active");
            $(this).addClass("btn-active");

            $(".standardMvMotorContent").hide();
            var divTarget = $(this).data("target");
            $("#" + divTarget).show();

        });
        $(".setLang").on("click", function () {
            var lang = $(this).data("lang");
            common.createCookie("LangForMultiLanguage", lang);
            location.reload(true);
        });

        $("#btnInquiries").on("click", function (e) {
            e.preventDefault();
            var modelInquiries = { FullName: $("#contact__form__name").val().trim(), PhoneNumber: $("#contact__form__phonenumber").val().trim(), Email: $("#contact__form__email").val().trim(), Message: $("#contact__form__message").val().trim() };
            if (!common.checkIsNullOrEmpty($("#contact__form__name"), "Please input into field: Full Name"))
                return false;

            if (!common.checkIsNullOrEmpty($("#contact__form__phone"), "Please input into field: Phone Number"))
                return false;
            if (!common.validatePhoneNumber(modelInquiries.PhoneNumber)) {
                $("#contact__form__phone").focus();

                Swal.fire({ title: 'Ooop!', text: 'Phone number is not correct format!', type: 'error' });
                return false;
            }
            if (!common.checkIsNullOrEmpty($("#contact__form__email"), "Please input into field: Email")) 
                return false;
            
            if (!common.validateEmail(modelInquiries.Email)) {
                $("#contact__form__email").focus();
                Swal.fire({ title: 'Ooop!', text: 'Email is not correct format!', type: 'error' });
                return false;
            }
            //get data
            $.ajax({
                type: "POST",
                url: "/Home/SaveInquiries",
                data: JSON.stringify({ model: modelInquiries }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    common.startLoading();
                },
                success: function (response) {
                    $("#mdDetail").modal("hide");
                    Swal.fire({ title: 'Congratulations on your successful registration', text: 'Please check the mailbox for more information', type: 'success' });
                },
                error: function () {
                    common.notify("Hyosung Motor", 'Has an error in progress', 'gray error');
                    common.stopLoading();
                }
            });
        });
        $("body").on("click", ".modal-scrollable", function (e) {
            
            var $modal = $(this).find(".modal");
            if (e.target === $modal[0]) 
                $modal.modal("hide");
            return true;
        });
    };
    //-----------------------------------------------------------Begin: gen data for grid view 60HzMotor
    function loadDataFor60HzMotor(isPageChange) {

        var efficiency = 1;
        $.each($(".efficiency60Hz"), function (index, item) {
            if ($(item).parent().hasClass("active"))
                efficiency = $(item).data("id");
        });

        var template = $("#tmlTb60HzMotor").html();
        var render = "";
        $.ajax({
            type: "GET",
            data: {
                eff: efficiency,
                page: common.configs.pageIndex,
                pageSize: common.configs.pageSize
            },
            url: "/home/GetAllPagingFor60HzMotor",
            dataType: "json",
            success: function (response) {
                if (response.Results.length === 0) {
                    $("#tbody60HzMotor").html("");
                    $("#tbody60HzMotor").append($("<tr>").append($("<td>").attr("colspan", 8).html("There is no data to display!!").addClass("text-center")));
                }
                var currentPage = response.CurrentPage;

                $.each(response.Results, function (i, item) {
                    render += Mustache.render(template, {
                        Sequence: (response.CurrentPage - 1) * response.PageSize + i + 1,
                        Kw: item.Kw,
                        Rpm: item.Rpm,
                        Voltage: item.Voltage,
                        Hz: item.Hz,
                        Frame: item.Frame,
                        DataSheet1: common.getFoot(item.DataSheet1, "Foot"),
                        DataSheet2: common.getFoot(item.DataSheet2, "Flange"),
                        OutLine1: common.getFoot(item.OutLine1, "Foot"),
                        OutLine2: common.getFoot(item.OutLine2, "Flange"),

                        Efficiency: "IE" + (item.Efficiency + 1)
                    });
                    if (render !== "") {
                        $("#tbody60HzMotor").html(render);
                        $("#lblTotalRecord60Hz").html(response.RowCount);
                    }
                });
                wrapPagingFor60HzMotor(response.RowCount, function () {
                    loadDataFor60HzMotor();
                }, isPageChange);

            },
            error: function (status) {
                console.log(status);
                common.notify("Motor Homepage Admin", "Cant loading data", "gray error");
            }
        });
    }
    function wrapPagingFor60HzMotor(recordCount, callBack, changePageSize) {
        var totalSize = Math.ceil(recordCount / common.configs.pageSize);
        //Unbind pagination if it existed or click change pagesize
        if ($("#paginationUl60Hz a").length === 0 || changePageSize === true) {
            $("#paginationUl60Hz").empty();
            $("#paginationUl60Hz").removeData("twbs-pagination");
            $("#paginationUl60Hz").unbind("page");
        }
        //Bind Pagination Event
        $("#paginationUl60Hz").twbsPagination({
            totalPages: totalSize,
            visiblePages: 7,
            onPageClick: function (e, p) {
                common.configs.pageIndex = p;
                setTimeout(callBack(), 200);
            }
        });
    }
    //-----------------------------------------------------------End: gen data for grid view 60HzMotor
    //-----------------------------------------------------------Begin: gen data for grid view
    function loadData(isPageChange) {

        var efficiency = 1;
        $.each($(".efficiency"), function (index, item) {
            if ($(item).parent().hasClass("active"))
                efficiency = $(item).data("id");
        });

        var template = $("#tmlTbStandardMotor").html();
        var render = "";
        $.ajax({
            type: "GET",
            data: {
                eff: efficiency,
                page: common.configs.pageIndex,
                pageSize: common.configs.pageSize
            },
            url: "/home/GetAllPaging",
            dataType: "json",
            success: function (response) {
                if (response.Results.length === 0) {
                    $("#tbodyStandardMotor").html("");
                    $("#tbodyStandardMotor").append($("<tr>").append($("<td>").attr("colspan", 8).html("There is no data to display!!").addClass("text-center")));
                }
                var currentPage = response.CurrentPage;

                $.each(response.Results, function (i, item) {
                    render += Mustache.render(template, {
                        Sequence: (response.CurrentPage - 1) * response.PageSize + i + 1,
                        Kw: item.Kw,
                        Rpm: item.Rpm,
                        Voltage: item.Voltage,
                        Hz: item.Hz,
                        Frame: item.Frame,
                        DataSheet1: common.getFoot(item.DataSheet1, "Foot"),
                        DataSheet2: common.getFoot(item.DataSheet2, "Flange"),
                        OutLine1: common.getFoot(item.OutLine1, "Foot"),
                        OutLine2: common.getFoot(item.OutLine2, "Flange"),

                        Efficiency: "IE" + (item.Efficiency + 1)
                    });
                    if (render !== "") {
                        $("#tbodyStandardMotor").html(render);
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
    //-----------------------------------------------------------Begin: gen data for News
    function loadDataNews() {
        var template = $("#tmlContentNews").html();
        var render = "";
        $.ajax({
            type: "GET",
            contentType: "application/json; charset=utf-8",
            url: "/Home/GetNewsTop2",
            data: { langCode: common.readCookie("LangForMultiLanguage") },
            dataType: "json",
            success: function (response) {
                response = checkMaxLength(response);
                //response = checkMaxLengthDescription(response);
                $.each(response, function (i, item) {
                    render += Mustache.render(template, {
                        Id: item.Id,
                        Thumbnail: item.Thumbnail,
                        Title: item.Title,
                        DateCreated: common.dateTimeFormatJson(item.DateCreated),
                        Description: item.Description
                    });

                    if (render !== "") {
                        $("#divContentNews").html(render);
                    }
                });

            },
            error: function (status) {
                console.log(status);
                common.notify("Motor Homepage Admin", "Cant loading data", "gray error");
            }
        });
    }

    function checkMaxLength(array) {
        var space = "";
        var len = Math.abs(array[0].Title.length - array[1].Title.length);
        for (var i = 0; i < len; i++) {
            space += " &nbsp; ";
        }
        if (array[0].Title.length < array[1].Title.length)
            array[0].Title = array[0].Title + space;
        else 
            array[1].Title = array[1].Title + space;
        return array;
    }

    function checkMaxLengthDescription(array) {
        var space = "";
        var len = Math.abs(array[0].Description.length - array[1].Description.length);
        for (var i = 0; i < len; i++) {
            space += " &nbsp; ";
        }
        if (array[0].Description.length < array[1].Description.length)
            array[0].Description = array[0].Description + space;
        else
            array[1].Description = array[1].Description + space;
        console.log(array[0].Description.length);
        console.log(array[1].Description.length);
        return array;
    }
    //-----------------------------------------------------------End: gen data for News
};