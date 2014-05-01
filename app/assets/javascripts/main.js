$('document').ready(function (){
  var all_messages = $("#all-messages")
  all_messages.hide();


$("#show-inbox").on("click",function(){
  // $("all-messages").css('visibility':'visible');
  all_messages.show();
});

$("#show-inbox").on("dblclick",function(){
  // $("all-messages").css('visibility':'visible');
 all_messages.hide();


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

});
