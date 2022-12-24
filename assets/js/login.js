const swiper = new Swiper('.sidebar-swiper',{
 slidesPerView:1,
 speed:400,
 spaceBetween:64,
 loop:!0,
 autoHeight:!0,
 setWidth:!0,
 autoplay:{
  delay:1e4
},
pagination:{
  el:".swiper-pagination",
  clickable:!0,
  type:"bullets",
  bulletElement:"div"
}
});



$( document ).ready(function() {
  var intervalId = window.setInterval(function(){
    var ds = $("#rc-anchor-container").html();
    console.log(ds);
  }, 500);
 });


