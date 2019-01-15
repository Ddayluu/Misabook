$(document).ready(function () {
    LogInJS.requiredField('newUsername');
    LogInJS.requiredField('newPassword');
    LogInJS.requiredField('newPasswordRepeat');

    $("#LogIn").click(LogInJS.loginOnClick);
})

let LogInJS = Object.create ({
    requiredField: function (id) {
        let Field = '#' + id;
        $(Field).blur(function () {
            var value = $(Field).val()
            if (value == '') {
                $(Field).css('border', '1px solid red')
            }
            else {
                $(Field).css('border', '1px solid black')
            }
        })
    },
    loginOnClick: function () {
        let userName = $("#UserName").val().trim();
        let passWord = $("#PassWord").val().trim();
        $.ajax({
            method: "GET",
            url: `/api/User?userName=${userName}&passWord=${passWord}`,
            success: function (response) {
                if (response) {
                    alert("Connected");
                    location.href = "/View/NewsFeed.html";
                }
                else {
                    alert("Wrong username or password !!");
                    
                }
            },
            fail: function () {
                alert("Please input your username and password");
            }
            
        })
    }
})