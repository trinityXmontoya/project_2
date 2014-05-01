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
////= require jquery
//= require jquery_ujs
//= require turbolinks
//= require moment
//= require bootstrap-datetimepicker
//= require TimeCircles
//= require_tree .
//= require_self
//= require_main


$('document').ready(function (){
  var all_messages = $("#all-messages");
  all_messages.hide();

$('#show-inbox').click( function(){
    $('#all-messages').slideToggle();
});

$("#DateCountdown").TimeCircles({
    "animation": "ticks",
    "bg_width": 1,
    "fg_width": 0.1,
    "circle_bg_color": "#b0b3b5  ",
    "time": {
        "Days": {
            "text": "Days",
            "color": "#010f79  ",
            "show": true
        },
        "Hours": {
            "text": "Hours",
            "color": "#0159b2  ",
            "show": true
        },
        "Minutes": {
            "text": "Minutes",
            "color": "#bbe4ff  ",
            "show": true
        },
        "Seconds": {
            "text": "Seconds",
            "color": "#dbeaff  ",
            "show": true
        }
    }
});

//USERS Profile
$('#bid-notifications').hide();
$('#nav-bids').on("click", function(){
  $('#bid-notifications').show();

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
});
