var common = {
    configs: {
        pageSize: 10,
        pageIndex: 1
    },
    notify: function (feeownTitle, feeownMess, feeownStyle) {
        //STYLE:   smokey, gray, osx, simple
        //OPTION: autoHide_bool, autoHideDelay_int_ms, classes_array, prepend_bool
        var title = feeownTitle;
        var message = feeownMess;
        var opts = {};
        opts.classes = [feeownStyle]; //style
        opts.prepend = false;
        opts.autoHide = true;
        opts.autoHideDelay = 6000;
        var container = '#freeow-tr';
        opts.classes.push("slide");
        opts.hideStyle = {
            opacity: 0,
            left: "400px"
        };
        opts.showStyle = {
            opacity: 1.5,
            left: 0
        };
        $(container).freeow(title, message, opts);
    },
    confirm: function (message, okCallback) {
        bootbox.confirm({
            message: message,
            buttons: {
                confirm: {
                    label: 'Yes',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'No',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                if (result === true) {
                    okCallback();
                }
            }
        });
    },
    dateFormatJson: function (dateTime) {
        if (dateTime === null || dateTime === "")
            return "";
        var newDate = new Date(parseInt(datetime.substr(6)));
        var month = newDate.getMonth() + 1;
        var day = newDate.getDate();
        var year = newDate.getFullYear();

        if (month < 10)
            month = "0" + month;
        if (day < 10)
            day = "0" + day;

        return year + "." + month + "." + day;
    },
    dateTimeFormatJson: function (dateTime) {
        if (dateTime === null || dateTime === "")
            return "";
        var newDate = new Date(parseInt(dateTime.substr(6)));
        var month = newDate.getMonth() + 1;
        var day = newDate.getDate();
        var year = newDate.getFullYear();
        var hh = newDate.getHours();
        var mm = newDate.getMinutes();
        var ss = newDate.getSeconds();

        if (month < 10)
            month = "0" + month;
        if (day < 10)
            day = "0" + day;
        if (hh < 10)
            hh = "0" + hh;
        if (mm < 10)
            mm = "0" + mm;
        if (ss < 10)
            ss = "0" + ss;

        return year + "." + month + "." + day + " " + hh + ":" + mm + ":" + ss;
    },
    isValidDate: function (source, dateDefault) {
        if (dateDefault === undefined || dateDefault === null)
            dateDefault = new Date();
        var comp = source.split('.');
        if (comp.length !== 3)
            return dateDefault;
        var y = parseInt(comp[0], 10);
        var m = parseInt(comp[1], 10);
        var d = parseInt(comp[2], 10);
        var date = new Date(y, m - 1, d);
        if (date.getFullYear() === y && date.getMonth() + 1 === m && date.getDate() === d) {
            return date;
        } else {
            return dateDefault;
        }
    },
    startLoading: function () {
        if ($(".lds-ripple").length > 0)
            $(".lds-ripple").removeClass("hide");
    },
    stopLoading: function () {
        if ($(".lds-ripple").length > 0)
            $(".lds-ripple").addClass("hide");
    },
    getLanguage: function (hasKo, hasVi) {
        var $h4 = $("<h4>");

        $h4.append($("<span>").addClass("flag-icon").addClass("flag-icon-us").css({ "margin": "1px" }));
        if (hasKo) $h4.append($("<span>").addClass("flag-icon").addClass("flag-icon-kr").css({ "margin": "1px" }));
        if (hasVi) $h4.append($("<span>").addClass("flag-icon").addClass("flag-icon-vn").css({ "margin": "1px" }));

        return $("<div>").append($h4).html();
    },
    getStatusData: function (control, type, selectedValue) {
        var url = "/admin/common/GetStatus";
        switch (type) {
            case "status":
                url = "/admin/common/GetStatus";
                break;
            case "publish_status":
                url = "/admin/common/GetPublishStatus";
                break;
            default:
        }
        if (selectedValue === undefined || selectedValue === null)
            selectedValue = "";
        $.ajax({
            type: "GET",
            url: url,
            data: "",
            dataType: "json",
            success: function (response) {
                $.each(response, function (index, item) {
                    control.append($("<option>", { value: item.Value, text: item.Name, selected: item.Value === selectedValue }));
                });
                control.trigger("change");
            },
            error: function (status) {
                common.notify("Hyosung Motor", 'Has an error in progress', 'gray error');
            }
        });
    },
    getFoot: function (foot, compareValue) {
        if (foot === compareValue)
            return "...";
        else
            return "<a href='" + foot + "' target='_blank'> " + compareValue + "</a>";
    },
    getStatus: function (status) {
        if (status === 1)
            return "<span class='badge' style='background-color: #4caf50'>Active</span>";
        else
            return "<span class='badge' style='background-color: #f44336'>Block</span>";
    },
    getPublishStatus: function (status) {
        switch (status) {
            case 0:
                return "Draft";
            case 1:
                return "Pending Review";
            case 2:
                return "Published";
        }
    },
    formatNumber: function (number, precision) {
        if (!isFinite(number)) {
            return number.toString();
        }
        var a = number.toFixed(precision).split(".");
        a[0] = a[0].replace(/\d(?=(\d{3})+$)/g, "$&,");
        return a.join(".");
    },
    unflattern: function (arr) {
        var map = {};
        var roots = [];
        for (var i = 0; i < arr.length; i++) {
            var node = arr[i];
            node.children = [];
            map[node.id] = i; //use map to lookup the parents
            if (node.parentId !== null) {
                arr[map[node.parentId]].children.push(node);
            } else {
                roots.push(node);
            }
        }
        return roots;
    },
    setTableHeight: function ($table) {
        $table.css({ "height": $FOOTER.position().top - $table.offset().top - 29 });
    },
    createCookie: function (name, value, days) {
        var expireDate = "; expires=" + (new Date()).toGMTString();
        document.cookie = name + "=" + value + expireDate + "; path=/";
        if (days) {
            var date = new Date();
            date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
            var expires = "; expires=" + date.toGMTString();
        }
        else expires = "";
        document.cookie = name + "=" + value + expires + "; path=/";
    },
    readCookie: function (name) {
        var nameEQ = name + "=";
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) === ' ') c = c.substring(1, c.length);
            if (c.indexOf(nameEQ) === 0)
                return c.substring(nameEQ.length, c.length);
        }
        return "";
    },
    checkIsNullOrEmpty: function ($element, mess) {
        if ($element.val() === "") {
            Swal.fire({ title: 'Ooop!', text: mess, type: 'error' });
            $element.focus();
            return false;
        }
        return true;
    },
    validateEmail: function (email) {
        var emailReg = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
        return emailReg.test(email);
    },
    validatePhoneNumber: function (phoneNumber) {
        var emailReg = new RegExp(/^[0-9-+]+$/);
        return emailReg.test(phoneNumber);
    }
};

$(document).ajaxSend(function (e, xhr, options) {
    if (options.type.toUpperCase() === "POST" || options.type.toUpperCase() === "PUT") {
        var token = $("form").find("input[name='__RequestVerificationToken']").val();
        xhr.setRequestHeader("RequestVerificationToken", token);
    }
});