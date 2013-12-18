bootstrap_alert = function(el, type, message, errors, nohide) {
  el.hide({ duration: 500 }).empty();
  var alert = $('<div class="alert alert-'+type+'"><a class="close" data-dismiss="alert">×</a><span>'+message+'</span></div>');
  alert.append(errors);
  el.append(alert).show({ duration: 500 });

  if(!nohide) {
    setTimeout(function() {
      el.hide({ duration: 500 });
    }, 2200);
  }
}

bootstrap_badge = function(content, badge_class) {
  var css_class = "badge " + badge_class.replace(' ', '-').toLowerCase();

  var badge = $('<span class="'+css_class+'">'+content+'</span>');
  return badge;
}