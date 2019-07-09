var homeController = function () {
    this.initialize = function () {
        AOS.init();
        registerEvents();
        loadData();
    };

    var registerEvents = function () {
        $("#ddlShowPage").on('change', function () {
            common.configs.pageSize = $(this).val();
            common.configs.pageIndex = 1;

            loadData( true);
        });
        $("#btnStandardMotor").on("click", function () {
            $("#mdStandardMotor").modal("show");
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
};