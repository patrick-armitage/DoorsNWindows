slidersStart = ->

  # FlexSlider
  $(".image-slider").flexslider
    animation: "fade"
    slideshowSpeed: 4000
    animationSpeed: 1200
    pausePlay: true
    controlNav: true
    keyboardNav: true
    directionNav: true
    pauseOnHover: true
    pauseOnAction: true

  #  Slider
  $("#slides").slides
    effect: "fade"
    autoWidth: true
    autoHeight: true
    paginationClass: "paging"
    start: 1

  $(".feature-tab").unbind "click"
  $(".feature-tab").click ->
    show_feature $(this).attr("id"), this
    return

  show_feature = (feature, from) ->
    $(".feature-tab").removeClass "current"
    $("#" + feature).addClass "current"
    $(".slide-content").hide()
    $("#" + feature + "-content").fadeIn "slow"
    return

  $("a[href$=\"#0\"]").trigger "click"
  return

$(document).on "page:change", slidersStart
