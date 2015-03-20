if(document.implementation.hasFeature("http://www.w3.org/TR/SVG11/feature#BasicStructure", "1.1")){
// if(false){
var draw = SVG('drawing').fixSubPixelOffset().size(55, 78);

var hex = draw.polygon().ngon({
           radius: 23
         , edges:    6
         }).move(6, 35).fill({ opacity: 0 }).stroke({ color: 'rgb(99, 236, 167)', opacity: 0, width: 8 });
var rail = draw.rect(10, 40).rotate(-50).skew(-50, 0).fill({ color: '#ccc', opacity: 0 }).move(43, 32);

var cover = draw.polyline('7,26 26,14 45,26').fill('none').stroke({ color: 'rgb(99, 236, 167)', width: 8, opacity: 0 }).move(6, 35);

var rail2 = draw.rect(10, 40).rotate(50).skew(50, 0).fill({ color: '#ccc', opacity: 0 }).move(21, 2);

var cover2 = draw.polyline('7,25 26,14').fill('none').move(26, 70).rotate(180).stroke({ color: 'rgb(99, 236, 167)', width: 8, opacity: 0 });

var drop, raise;
drop = function() {
    setTimeout(function() {
      rail.animate(500, SVG.easing.swingFromTo).fill({ opacity: 0 }).move(43, 32);
      setTimeout(function(){
        rail2.animate(500, SVG.easing.swingFromTo).fill({ opacity: 0 }).move(21, 2);
      }, 100);
      setTimeout(function(){
        hex.animate(500, SVG.easing.swingFromTo).move(6, 25).stroke({ opacity: 0.3 }).after(raise);
        cover.animate(500, SVG.easing.swingFromTo).move(6, 25).stroke({ opacity: 0.3 }).after(raise);
        cover2.animate(500, SVG.easing.swingFromTo).move(26, 80).stroke({ opacity: 0 }).after(raise);
      }, 200);
    }, 4000);
  };
raise = function() {
  setTimeout(function() {
    rail.animate(1000, SVG.easing.swingFromTo).move(43, 21).fill({ opacity: 1 });
    setTimeout(function(){
      rail2.animate(1000, SVG.easing.swingFromTo).move(21, -10).fill({ opacity: 1 });
    }, 100);
    setTimeout(function(){
      hex.animate(1000, SVG.easing.swingFromTo).move(6, 15).stroke({ opacity: 1 }).after(drop);
      cover.animate(1000, SVG.easing.swingFromTo).move(6, 15).stroke({ opacity: 1 }).after(drop);
      cover2.animate(1000, SVG.easing.swingFromTo).move(26, 90).stroke({ opacity: 1 }).after(drop);
    }, 200);
  }, 200);
};
raise();
}
else{
  $('#drawing').append("<img src='assets/logo-short.png' alt='' />");
}