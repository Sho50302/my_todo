$(function() {
  $(".modal_window").hide()
  $("#task").click(function() {
    $(".modal_window").show();
    $(".modal_box").show();
    $(".task_show").show();
  });
});

$(function() {
  $(".exit_btn").click(function() {
    $(".modal_window").hide();
    $(".modal_box").hide();
    $(".task_show").hide();
  });
});