$(document).ready(function () {
    newsFeedJS.loadPost();
});

var newsFeedJS = Object.create({
    loadPost: function () {
        $.ajax({
            method: "GET",
            url: "/api/Post",
            success: function (response) {
                $('#Post-area').html('');
                var postList = response;
                //For each item in the list load it , add to db
                postList.forEach(function (item) {
                    //Add content
                    var htmlContent =
                        '<tr>' +
                        '<th scope="col">' + item.UserName + '</th>' +
                        '<th scope="col">' + item.PostContent + '</th>' +
                        '<th scope="col">' + item.LikeCount + '</th>' +
                        '<th scope="col">' + item.CreatedDate + '</th>' +
                        '<th scope="col">' + item.UserComment + '</th>' +
                        '<th scope="col">' + item.CommentContent + '</th>' +
                        '</tr>';

                    $('#Post-area').append(htmlContent);
                });  
            },
            fail: function (response) {

            }
        })
    }
});