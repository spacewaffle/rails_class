$(function(){
  var usAg = navigator.userAgent;
  if(usAg.indexOf("Windows") != -1) {
    $('body').addClass("windows");
    console.log('found windows!');
  }
});
