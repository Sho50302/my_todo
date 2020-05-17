$(function(){
  $("#group_name_input").blur(function(){
    if ($(this).val() == ""){
      $("#group_name_error").html("グループ名は必須です。");
      $("#group_name_error").show();
    } else {
      $("#group_name_error").hide();
    }
  });
});