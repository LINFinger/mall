
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>

<script type="text/javascript">
	$(function() {
		var total = 3;
		var span_timer = document.getElementById("span_timer");
		span_timer.innerHTML = total;
		var timer = setInterval(function() {
			if (total <= 0) {
				location.href = "loginPage";
				clearInterval(timer);
				timer = 0;
			} else span_timer.innerHTML = --total;
		}, 1000);
	})();
</script>	

<div class="registerSuccessDiv">

	<img src="img/site/registerSuccess.png">
	恭喜注册成功，<span id="span_timer"></span>秒后跳转到登录界面。
</div>