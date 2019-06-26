<!-- 模仿天猫整站ssm 教程 为how2j.cn 版权所有-->
<!-- 本教程仅用于学习使用，切勿用于非法用途，由此引起一切后果与本站无关-->
<!-- 供购买者学习，请勿私自传播，否则自行承担相关法律责任-->

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