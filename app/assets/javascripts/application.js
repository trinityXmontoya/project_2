// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require_self

$('document').ready(function (){
  var all_messages = $("#all-messages")
  all_messages.hide();

//MESSAGES

$("#show-inbox").on("click",function(){
  // $("all-messages").css('visibility':'visible');
  all_messages.show();
});

$("#show-inbox").on("dblclick",function(){
  // $("all-messages").css('visibility':'visible');
 all_messages.hide();
});

//USERS Profile

// $('#bid-notifications').hide();
// $('#nav-bids').on("click", function(){
//   $('#bid-notifications').show();
// });

// $('#auction-notifications').hide();
// $('#nav-auctions').on("click", function(){
//   $('#auction-notifications').show();
// });


});
