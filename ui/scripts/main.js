$(document).ready(function () {
    newsfeedJS.newPostAction();

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

    $('.like-button').click(function () {
        $(this).toggleClass("no-like-icon like-icon");
    }),

    $('.cmt-button').click(function () {
        $(this).closest('.full-status').find('.my-comment>.content').focus();
    }),

    $('.my-comment>.content').focus(function () {
        $(this).toggleClass("cmt-before-focus cmt-after-focus");
        $(this).parent().find('.emoticons').toggleClass("emo-before-focus emo-after-focus");
        $(this).parent().find('.post-action').slideDown();
    }),

    $('.my-comment>.content').blur(function () {
        var cmt_content = $(this);
        $(this).parent().find('.post-action').slideUp(function () {
            cmt_content.toggleClass("cmt-before-focus cmt-after-focus");
            $(this).parent().find('.emoticons').toggleClass("emo-before-focus emo-after-focus");
        });
    }),

    $('.post-content').focus(function () {
        $('.post-footer').slideToggle();
    }),

    $('.post-content').blur(function () {
        $('.post-footer').slideToggle();
    })
});

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
            if (selfButton === currentAction) { return; }
            // else
            currentAction.removeClass('active');
            selfButton.addClass('active');
            currentAction = selfButton;
        })
    }
})

