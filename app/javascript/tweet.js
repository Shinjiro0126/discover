$(function(){
  $(".Dropdown").hide();
  $(".Header-right__user-btn").click(function() {
    $(".Dropdown").toggle(2000);
  });
});

$(function(){
  $(".search-form").hide();
  $(".Header-right__search-btn").on("click", function(){
    $(".Header-right__search-btn").hide(function(){
      $(".search-form").show(2000);
    });
    
  });
});

$(function(){
  $(".Flash-message").fadeOut(4000);
});


$(window).on("load resize", function(){
  let width = $(".Post-new__images__image").width();
  $(".Post-new__images__image").css({"height": width});
});

$(window).on("load resize", function(){
  let width = $(".Post-user__images__image").width();
  $(".Post-user__images__image").css({"height": width});
});

$(window).on("load resize", function(){
  let width = $(".Account-user__image").width();
  $(".Account-user__image").css({"height": width});
});