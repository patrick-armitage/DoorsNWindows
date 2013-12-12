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