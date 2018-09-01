jQuery(document).ready(function($){"use strict";$('a[data-rel]').each(function(){$(this).attr('rel',$(this).data('rel'));$(".pretty-gallery a[rel^='prettyPhoto']").prettyPhoto();});if($('#push, #close').length){$('#push, #close').on('click',function(){var $navigacia=$('body, #cp-slide-menu'),val=$navigacia.css('right')==='300px'?'0px':'300px';$navigacia.animate({right:val},500)});}
if($('#search-push').length){$('#search-push').on('click',function(){var $navigacia=$('#cp-slide-search');var $val=($navigacia.width());if($val=='0'){$val='100%';$('#cp-slide-search form input[type="text"]').css({padding:'0 30px',});}else{$val='0';$('#cp-slide-search form input[type="text"]').css({padding:'0',transition:'all ease-in-out 0.8s',});}
$navigacia.animate({width:$val},600)});}
if($('#cp_banner-slider').length){$('#cp_banner-slider').owlCarousel({loop:true,dots:true,nav:false,navText:'',items:1,autoplay:true,smartSpeed:1000,});}
if($('#cp-testimonial-slider').length){$('#cp-testimonial-slider').owlCarousel({loop:true,dots:true,nav:false,navText:'',items:1,autoplay:false,smartSpeed:1500,});}
if($('#cp-test-slider2').length){$('#cp-test-slider2').owlCarousel({loop:true,dots:false,nav:false,navText:'',items:2,smartSpeed:500,margin:30,responsiveClass:true,responsive:{0:{items:1,},768:{items:2,},1199:{items:2,}}});}
if($('#cp-inner-map').length){var mapOptions={zoom:11,center:new google.maps.LatLng(40.6700,-73.9400),styles:[{"featureType":"all","elementType":"labels.text.fill","stylers":[{"saturation":36},{"color":"#000000"},{"lightness":30}]},{"featureType":"all","elementType":"labels.text.stroke","stylers":[{"visibility":"on"},{"color":"#000000"},{"lightness":16}]},{"featureType":"all","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#000000"},{"lightness":90}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#000000"},{"lightness":17},{"weight":1.2}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":21}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#000000"},{"lightness":17}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#000000"},{"lightness":29},{"weight":0.2}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":18}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":90}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":19}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":20}]}]};var mapElement=document.getElementById('cp-inner-map');var map=new google.maps.Map(mapElement,mapOptions);var marker=new google.maps.Marker({position:new google.maps.LatLng(40.6700,-73.9400),map:map,title:'Snazzy!'});}});