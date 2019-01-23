$(document).ready(function () {
    $('#btnLogin').click(loginJS.btnLogin_OnClick)
})

var loginJS = Object.create({
    btnLogin_OnClick: function () {
        // Lấy thông tin Username:
        var userName = $('#txtUserName').val().trim();
        // Lấy thông tin mật khẩu:
        var pw = $('#txtPassword').val().trim();

        // Gọi API kiểm tra thông tin:
        $.ajax({
            method: "GET",
            url: "/api/User?userName=" + userName + "&password=" + pw,
            success: function (response) {
                if (response) {
                    location.href = "/Views/index.html"
                } else {
                    alert('Sai tên người dùng hoặc mật khẩu!');
                }
            },
            fail: function () {

            }
        })
    }
})