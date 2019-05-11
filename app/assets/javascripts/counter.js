$(function () {
  $(".input-text").on("keyup", function() {
    let countNum = String($(this).val().length);
    if (countNum >= 31) {
      $("#counter").css("color", "red");
      $("#counter").text("30文字以下で入力して下さい");
    } else {
      $("#counter").text(countNum + "文字");
    };
  });

  $(".input-text").on("keyup", function() {
    let countNum = String($(this).val().length);
    if (countNum >= 21) {
      $("#f_counter").css("color", "red");
      $("#f_counter").text("20文字以下で入力して下さい");
    } else {
      $("#f_counter").text(countNum + "文字");
    };
  });
});
