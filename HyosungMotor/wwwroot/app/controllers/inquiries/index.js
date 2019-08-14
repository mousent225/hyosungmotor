var inquiriesController = function () {
   
    this.initialize = function () {
        loadData();
        registerEvent();
    };
    function registerEvent() {
        $("#btnGo").on("click", function () {
            loadData(true);
        });
    }
    //-----------------------------------------------------------Begin: gen data for grid view
    function loadData(isPageChange) {

        var template = $("#table-template").html();
        var render = "";
        $.ajax({
            type: "GET",
            data: {
                //fromDate: fromDate, toDate: toDate,
                keyword: $("#txtKeyword").val().trim(),
                page: common.configs.pageIndex,
                pageSize: common.configs.pageSize
            },
            url: "/admin/inquiries/GetAllPaging",
            dataType: "json",
            success: function (response) {
                if (response.Results.length === 0) {
                    $("#tbl-content").html("");
                    $("#tbl-content").append($("<tr>").append($("<td>").attr("colspan", 6).html("There is no data to display!!").addClass("text-center")));
                }
                $.each(response.Results, function (i, item) {
                    console.log(item.Message);
                    render += Mustache.render(template, {
                        Sequence: i + 1,
                        Id: item.Id,
                        FullName: item.FullName,
                        PhoneNumber: item.PhoneNumber,
                        Email: item.Email,
                        Message: item.Message,
                        CreatedDate: common.dateTimeFormatJson(item.DateCreated)
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