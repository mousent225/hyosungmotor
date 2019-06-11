var loginController = function () {
    this.initialize = function () {
        registerEvents();
    };

    var registerEvents = function () {
        $("#frmLogin").validate({
            errorClass: "red",
            ignore: [],
            lang: "en",
            rules: [
                username = {
                    required: true
                },
                password = {
                    required: true
                }
            ]
        });

        $("#btnLogin").on("click", function (e) {
            if ($("#frmLogin").valid()) {
                e.preventDefault();
                var user = $("#txtUserName").val();
                var pass = $("#txtPassword").val();
                var remember = $("input[type='checkbox']").prop("checked");
                var token = $("[name='__RequestVerificationToken']").val();
                login(token, user, pass, remember);
            }
        });
    };

    var login = function (token, user, pass, remember) {
        $.ajax({
            type: "POST",
            data: {
                __RequestVerificationToken: token, LoginID: user, Password: pass, Remember: remember
            },
            dataType: "json",
            url: "/Admin/Anonymous/Login",
            success: function (res) {
                console.log(res);
                if (res.result === "OK") {
                    window.location.href = res.message;
                } else {
                    common.notify("Hyosung Motor", "PLease check your user name and password again!!!", "gray error");
                }
            }
        });
    };
};