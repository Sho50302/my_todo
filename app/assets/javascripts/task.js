$(function() {
  $("#start_date_select").datepicker({
    dateFormat: "yy/mm/dd"
  });
  $("#end_date_select").datepicker({
    dateFormat: "yy/mm/dd"
  });
});

$(function(){
  $("#task_title").blur(function(){
    if ($(this).val() == ""){
      $("#title_error").html("タイトルは必須です。");
      $("#title_error").show();
    } else {
      $("#title_error").hide();
    }
  });
});