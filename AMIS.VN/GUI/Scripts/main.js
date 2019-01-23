$(document).ready(function () {
    newsfeedJS.newPostAction();
    newsfeedJS.loadUserPosts();

    $('.menu-button').click(function () {
        var menu = $('.profile-menu');

        if (menu.is(':visible') == false) {
            $('.menu-top-icon').show();
            menu.slideDown();

        } else {
            menu.slideUp(function () {
                $('.menu-top-icon').hide();
            });
        }
    }),

    $('.post-content').focus(function () {
        $('.post-footer').slideToggle();
    }),

    $('.post-content').blur(function () {
        $('.post-footer').slideToggle();
    })
})

$(document).on("click", '.like-button', function (event) {
    $(this).toggleClass("no-like-icon like-icon");
})

$(document).on("click", '.cmt-button', function (event) {
    var cmtContent = $(this).closest('.full-status').find('.my-comment>.content');
    if (cmtContent.hasClass("cmt-before-focus")) cmtContent.focus();
})

$(document).on("focus", '.my-comment>.content', function (event) {
    $(this).toggleClass("cmt-before-focus cmt-after-focus");
    $(this).parent().find('.emoticons').toggleClass("emo-before-focus emo-after-focus");
    $(this).parent().find('.post-action').slideDown();
})

$(document).on("blur", '.my-comment>.content', function (event) {
    var cmtContent = $(this);
    $(this).parent().find('.post-action').slideUp(function (event) {
        cmtContent.toggleClass("cmt-before-focus cmt-after-focus");
        $(this).parent().find('.emoticons').toggleClass("emo-before-focus emo-after-focus");
    });
})

$(document).on("click", '.my-comment>.post-action>.btn', function (event) {
    var userID = $('.profile-bar').attr("data-user-id");
    var postID = $(this).closest('.full-status').attr("data-post-id");

    var commentContent = $(this).closest('.my-comment').find('.content').val().trim();

    var comment = {
        CommentID: "",
        UserID: userID,
        PostID: postID,
        CommentContent: commentContent,
        CreatedDate: null,
        LikeCount: 0,
    }

    $.ajax({
        method: "POST",
        url: "/api/Comment",
        contentType: "application/json",
        dataType: "application/json",
        data: JSON.stringify(comment),

        success: function () {
            //newsfeedJS.loadUserPosts();
            alert(comment);
        },

        fail: function () {
            alert("fail");
        }
    })
})

let newsfeedJS = Object.create({
    newPostAction: function () {
        let postActions = $('.post-options');
        let currentAction = $('.post-options li.active');
        if (currentAction.length === 0) {
            postActions.find('li:first').addClass('active');
        }
        postActions.find('li').on('click', function (Event) { // Search for active element to change 
            Event.preventDefault();
            let selfButton = $(this);
            if (selfButton === currentAction) {
                return;
            }
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
                        let itemHtml = `<div class="full-status" data-post-id="${item.PostID}">
                                            <div class="status-heading">
                                                <div class="sts-avatar">
                                                    <a href="#"><img class="avatar-body" src="${item.ProfilePicture}" /></a>
                                                </div>
                                                <div class="sts-username">
                                                    <a href="#" class="bold-link">${item.FullName}<br></a>
                                                    <a href="#" class="grey-text">2 giờ trước</a>
                                                </div>
                                            </div>

                                            <div class="sts-description">
                                                <img src="../Contents/Images/new_1.png">
                                                <div class="content">
                                                    <a href="#" class="bold-link">Dunning–Kruger effect<br></a>
                                                    <p class="content-body">${item.PostContent}</p>
                                                </div>
                                            </div>

                                            <div class="navbar navbar-expand-sm like-comment-btn">
                                                <ul class="navbar-nav">
                                                    <li class="nav-item">
                                                        <button class="like-button no-like-icon">
                                                            Thích
                                                        </button>
                                                    </li>
                                                    <li class="nav-item" style="margin-left: 10px">
                                                        <button class="cmt-button" style="background-image:url('../Contents/Icons/comment-icon.png')">
                                                            Bình luận
                                                        </button>
                                                    </li>
                                                </ul>

                                                <ul class="nav nav-tabs">
                                                    <li><a href="#">${item.LikeCount} Thích</a></li>
                                                    <li><a href="#">${item.CommentCount} Bình luận</a></li>
                                                </ul>
                                            </div>

                                            <div class="sts-footer">
                                                <div class="comment-list">`;

                        item.CommentList.forEach((itemComment) => {
                            let commentHtml = `<div class="comment-box">
                                                    <div class="cmt-ava">
                                                        <a href="#"><img class="avatar-body" src="${itemComment.ProfilePicture}" /></a>
                                                    </div>
                                                    <div class="cmt-content">
                                                        <a href="#" class="bold-link">${itemComment.FullName}</a>
                                                        <div class="content"> ${itemComment.CommentContent}</div>
                                                        <div class="cmt-info">
                                                            <a href="#">Thích</a>
                                                            <a href="#" class="grey-text">1h trước</a>
                                                        </div>
                                                    </div>
                                                </div>`;
                            itemHtml += commentHtml;
                        })
                        itemHtml += `</div>
                                    <div class="my-comment">
                                        <textarea class="content cmt-before-focus" placeholder="Viết bình luận ..."></textarea>
                                        <button class="emoticons emo-before-focus">
                                            <img src="../Contents/Icons/emotionstick1.png">
                                        </button>
                                        <div class="post-action">
                                            <button class="btn btn-primary">Gửi</button>
                                        </div>
                                    </div>
                                </div>
                            </div>`;
                        $('.mid-panel').append(itemHtml);
                    })
                }
            },
            fail: function () {
                alert("fail");
            }
        })
    }
})