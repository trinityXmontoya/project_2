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

});
