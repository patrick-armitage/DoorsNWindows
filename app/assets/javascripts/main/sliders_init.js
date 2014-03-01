var slidersStart = function() {
  // FlexSlider
  $('.image-slider').flexslider({
    animation: "fade",
    slideshowSpeed: 4000,
    animationSpeed: 1200,
    pausePlay: true,
    controlNav: true,
    keyboardNav: true,
    directionNav: true,
    pauseOnHover: true,
    pauseOnAction: true
  });

  //  Slider
  $('#slides').slides({
    effect: 'fade',
    autoWidth: true,
    generatePagination: true,
    paginationClass: 'paging',
    start: 1
  });

  $(".feature-tab").unbind('click');
  $(".feature-tab").click(function() {
    show_feature($(this).attr("id"), this);
    console.log("click");
  });

  var show_feature = function(feature, from) {
    $(".feature-tab").removeClass("current");
    $("#" + feature).addClass("current");
    $(".slide-content").hide();
    $("#" + feature + "-content").fadeIn('slow');

    // if(from != 'link') {
    //   $("#" + feature + "-content").show();
    // }
    // else {
    //   $("#" + feature + "-content").fadeIn('slow');
    // }

    console.log("show_feature");
  };

  $('a[href$="#0"]').trigger('click');
};

$(document).on('page:change', slidersStart);

