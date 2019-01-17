$(document).ready(function () {
    NewsFeedJS.newPostAction();
    NewsFeedJS.loadUserPosts();
    $('.LikeButton').click(NewsFeedJS.LikeClick);
}) 

let NewsFeedJS = Object.create({
    newPostAction: function () {
        let postActions = $('#post-options');
        let currentAction = $('#post-options li.active');
        if (currentAction.length === 0) {
            postActions.find('li:first').addClass('active');
        }
        postActions.find('li').on('click', function (Event) { // Search for active element to change 
            Event.preventDefault();
            let selfButton = $(this);
            if (selfButton === currentAction) { return; }
            // else
            currentAction.removeClass('active');
            selfButton.addClass('active');
            currentAction = selfButton;
        })
    },
    loadUserPosts: function () {
        $.ajax({
            method: "GET",
            url: "/api/Post",
            success: function (response) {
                // Build and append HTML element into Newsfeed page
                if (response && response.length > 0) {
                    response.forEach((item) => {
                        //let str = JSON.stringify(item);
                        //alert(str);
                        let itemHtml = `<div class="post-content">
                        <div class="post-heading">
                            <div id="Avatar" style="float: left;">
                                <a href="#" alt="Avatar"><img class="Avatar-img" src="${item.ProfilePicture}" /></a>
                            </div>
                            <div class="UserName" style="float: left; max-width: 115px; margin-left: 8px;">
                                <div class="FullName" style="margin-top: 5px; width:300px;">
                                    <a href="#" style=" font-size:14px; color: #355dbd; font-weight:bold; ">${item.FullName}</a>
                                </div>
                                <div class="PostTime" style="margin-top: -2px;">
                                    <p style="font-family:12px; color: silver;">1 phút trước</p>
                                </div>

                            </div>
                        </div>
                        <div class="post-description" style="padding-top: 60px;">
                            <p>${item.PostContent}</p>
                            <div class="navbar navbar-expand-sm  LikeCommentInfo">
                                <ul class="navbar-nav">
                                    <li class="nav-item ButtonClick"><a href="#" class="LikeButton" style="background-image:url('../Contents/Icon/like-icon.png');"><span class="">Thích</span></a></li>
                                    <li class="nav-item ButtonClick" style="padding-left:20px;"><a href="#" style="background-image:url('../Contents/Icon/comment-icon.png');"><span class="">Bình luận</span></a></li>

                                </ul>
                            </div>
                        </div>
                        <div class="post-footer">
                            <div class="comment-list">`;

                        item.CommentList.forEach((itemComment) => {
                            let commenthtml =
                                `<div class="comment-box">
                                    <div id="Avatar" style="float: left; position:relative;">
                                        <a href="#"><img class="Avatar-img" src="${itemComment.ProfilePicture}" /></a>
                                    </div>
                                    <div class="comment-content">
                                        <a href="#" style=" font-size:14px; color: #355dbd; font-weight:bold;">${itemComment.FullName}</a>
                                        <p>${itemComment.CommentContent}</p>
                                    </div>
                                    <div class="comment-info">
                                        <a href="#" class="comment-like" style="color: #355dbd">Like</a><span style="padding-left: 10px; color: silver;">2h trước</span>
                                    </div>
                                </div>`;

                            itemHtml += commenthtml;
                        })

                        itemHtml += `</div>
                            <div class="my-comment">
                                <textarea class="my-comment-content" placeholder="Viết bình luận ..."></textarea>
                            </div>
                        </div>
                        </div>`;
                        $('.main-content').append(itemHtml);
                    })
                }      
            },
            fail: function () {
                alert("Fail")
            }
            
        })
    },
    LikeClick: function () {    // To change Like button when click on
        let LikeButton = $('.LikeButton');
         
        if (LikeButton.css('background-image') === 'url("../Contents/Icon/like-comment-icon.png")') {
            alert(LikeButton.css('background-image'));
            LikeButton.css('background-image', "url('../Contents/Icon/like-icon.png')");
            alert("success")
        }

        else {
            alert(LikeButton.css('background-image'));
            LikeButton.css('background-image', "url('../Contents/Icon/like-comment-icon.png')");
        }
           
            
    }
    
})


