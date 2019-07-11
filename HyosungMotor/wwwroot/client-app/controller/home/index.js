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
                        DataSheet1: item.DataSheet1,
                        DataSheet2: item.DataSheet2,
                        OutLine1: item.OutLine1,
                        OutLine2: item.OutLine2,

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
                        DataSheet1: item.DataSheet1,
                        DataSheet2: item.DataSheet2,
                        OutLine1: item.OutLine1,
                        OutLine2: item.OutLine2,

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
    //-----------------------------------------------------------End: gen data for News
};