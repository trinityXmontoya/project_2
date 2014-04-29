# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('#bid-notifications').hide();
$('#nav-bids').on("click", function(){
  $('#bid-notifications').show();
});

$('#auction-notifications').hide();
$('#nav-auctions').on("click", function(){
  $('#auction-notifications').show();
});

$('#message-notifications').hide();
$('#nav-messages').on("click", function(){
  $('#message-notifications').show();
});
