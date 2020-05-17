// パスワード表示、非表示切替
$(function(){
  $("#toggle_password").click(function(){
    $(this).toggleClass("fas fa-eye fas fa-eye-slash");
    let input = $(this).parent().prev("#user_password");
    if (input.attr("type") == "password"){
      input.attr("type", "text");
    } else {
      input.attr("type", "password");
    }
  });
});

// エラーメッセージ 
// ニックネーム
$(function(){
  $("input#user_nickname").blur(function(){
    if ($(this).val() == ""){
      $("#nickname_error").html("ニックネームは必須です。");
      $("#nickname_error").show();
    } else if ($(this).val().length > 20){
      $("#nickname_error").html("ニックネームは20字以内で入力してください。");
      $("#nickname_error").show();
    } else {
      $("#nickname_error").hide();
    }
  });

  $("input#user_nickname").keyup(function(){
    if ($(this).val().length > 20){
      $("#nickname_error").html("ニックネームは20字以内で入力してください。");
      $("#nickname_error").show();
    } else {
      $("#nickname_error").hide();
    }
  });

// メールアドレス
  $("input#user_email").blur(function(){
    if ($(this).val() == ""){
      $("#email_error").html("メールアドレスは必須です。");
      $("#email_error").show();
    } else if (!$(this).val().match(/^[A-Za-z0-9]{1}[A-Za-z0-9_.-]*@{1}[A-Za-z0-9_.-]{1,}\.[A-Za-z0-9]{1,}$/)){
      $("#email_error").html("＠とドメインを含めて入力してください。");
      $("#email_error").show();
    } else {
      $("#email_error").hide();
    }
  });

  $("input#user_email").keyup(function(){
    if (!$(this).val().match(/^[A-Za-z0-9]{1}[A-Za-z0-9_.-]*@{1}[A-Za-z0-9_.-]{1,}\.[A-Za-z0-9]{1,}$/)){
      $("#email_error").html("＠とドメインを含めて入力してください。");
      $("#email_error").show();
    } else {
      $("#email_error").hide();
    }
  });

// パスワード
  $("input#user_password").blur(function(){
    if ($(this).val() == ""){
      $("#password_error").html("パスワードは必須です。");
      $("#password_error").show();
    } else if (!$(this).val().match(/^(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}$/i)){
      $("#password_error").html("半角英数字を1文字以上含む7文字以上で入力してください。");
      $("#password_error").show();
    } else {
      $("#password_error").hide();
    }
  });

  $("input#user_password").keyup(function(){
    if (!$(this).val().match(/^(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}$/i)){
      $("#password_error").html("半角英数字を1文字以上含む7文字以上で入力してください。");
      $("#password_error").show();
    } else {
      $("#password_error").hide();
    }
  });

// パスワード確認
  $("input#user_password_confirmation").blur(function(){
    if ($(this).val() == ""){
      $("#password_confirmation_error").html("パスワードは必須です。");
      $("#password_confirmation_error").show();
    } else if (!$(this).val().match(/^(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}$/i)){
      $("#password_confirmation_error").html("半角英数字を1文字以上含む7文字以上で入力してください。");
      $("#password_confirmation_error").show();
    } else {
      $("#password_confirmation_error").hide();
    }
  });

  $("input#user_password_confirmation").keyup(function(){
    if (!$(this).val().match(/^(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}$/i)){
      $("#password_confirmation_error").html("半角英数字を1文字以上含む7文字以上で入力してください。");
      $("#password_confirmation_error").show();
    } else {
      $("#password_confirmation_error").hide();
    }
  });
});

// プロフィール画像(プレビュー)
$(function(){
  function readURL(input){
    if (input.files && input.files[0]){
      let reader = new FileReader();
      reader.onload = function(e){
        $(".user_image").attr("src", e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#file").change(function(){
    readURL(this);
  });
});

