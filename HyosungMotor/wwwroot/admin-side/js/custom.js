var CURRENT_URL = window.location.href.split('#')[0].split('?')[0],
    $BODY = $('body'),
    $MENU_TOGGLE = $('#menu_toggle'),
    $SIDEBAR_MENU = $('#menubar'),
    $SIDEBAR_FOOTER = $('.sidebar-footer'),
    $LEFT_COL = $('.left_col'),
    $RIGHT_COL = $('.right_col'),
    $NAV_MENU = $('.nav_menu'),
    $FOOTER = $('footer');

var setActiveMenu = function () {
    var pageTitle = "";
    var href = $(location).attr("pathname");
    $.each($("#main-menu").find("li"), function (index, item) {
        $(item).removeClass("active");
        if (href.indexOf($(item).attr("data-href")) !== -1) {
            pageTitle = $(item).attr("data-name");
            $(item).addClass("active");
            $(item).parent().parent().addClass("active");
        }
    });
    $("title").html(pageTitle === "" ? "Hyosung Admin" : pageTitle);
};

var setContentHeight = function () {
    // reset height
    $RIGHT_COL.css('min-height', $(window).height());

    var bodyHeight = $BODY.outerHeight(),
        footerHeight = $BODY.hasClass('footer_fixed') ? -10 : $FOOTER.height(),
        leftColHeight = $LEFT_COL.eq(1).height() + $SIDEBAR_FOOTER.height(),
        contentHeight = bodyHeight < leftColHeight ? leftColHeight : bodyHeight;

    // normalize content
    contentHeight -= $NAV_MENU.height() + footerHeight;

    $RIGHT_COL.css('min-height', contentHeight);
};

$(document).ready(function () {
    setActiveMenu();
});