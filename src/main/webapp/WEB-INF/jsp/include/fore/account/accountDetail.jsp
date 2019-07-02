<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>

<script>

$(function(){
    $("input[name='sex'][value='"+'${user.getSex()}'+"']").prop("checked", "checked");
    <c:if test="${user.getPhone()==null}">
        $("#checkPhone").text("×");
    </c:if>
    <c:if test="${user.getEmail()==null}">
        $("#checkEmail").text("×");
    </c:if>
    
    $("form.alterAccountForm").submit(function(){
            if(0==$("#truename").val().length||0==$("#phone").val().length||0==$("#email").val().length||0==$("#address").val().length||0==$("#postal").val().length||null==$('input:radio[name="sex"]:checked').val()){
                $("span.errorMessage").html("请完整填写个人信息");
                $("div.alterErrorMessageDiv").show();
                return false;
            }
            return true;
        });

        $("form.alterAccountForm input").keyup(function(){
            $("div.alterErrorMessageDiv").hide();
        });
        
    })
    
</script>

<div class="accountDiv">
	<div class="accountDivMain">
		<label class="accountSpe col-sm-2">账号详情</label>
		<div class="userTab col-sm-10">
			<ul class="nav nav-pills">
				<li class="active"><a href="accountPage">账户信息</a></li>
				<li><a href="receiverInfo">收货地址</a></li>
			</ul>
		</div>
		<div class="accountDetail">
			<div class="accountContext">
				<div class="alterErrorMessageDiv">
					<div class="alert alert-danger" >
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
						<span class="errorMessage"></span>
					</div>
				</div>
				<div class="accountTips col-sm-offset-2 col-sm-10">
					亲爱的  <span id="spe">${user.getName()}</span>  ,完善您的基础信息，有助于好友找到你哦。
				</div>
				<form action="alterAccountInfo" role="form" class="alterAccountForm form-horizontal">
					<div class="form-group">
						<label for="truename" class="col-sm-2 control-label"><span class="redStar">*</span>真实姓名</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="truename" id="truename" placeholder="请输入真实姓名" value="${user.getTrueName()}">
						</div>
					</div>
					<div class="form-group">
						<label for="sex" class="col-sm-2 control-label"><span class="redStar">*</span>性别</label>
						<div class="col-sm-10">
							<label class="checkbox-inline">
      							<input type="radio" name="sex" id="sex1" value="男">男
    						</label>
   							<label class="checkbox-inline">
      							<input type="radio" name="sex" id="sex2" value="女">女
    						</label>
						</div>
					</div>
					<div class="form-group">
						<label for="phone" class="col-sm-2 control-label"><span class="redStar">*</span>绑定手机</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="phone" id="phone" placeholder="请输入电话号码" value="${user.getPhone()}">
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-sm-2 control-label"><span class="redStar">*</span>绑定邮箱</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="email" id="email" placeholder="请输入邮箱" value="${user.getEmail()}">
						</div>
					</div>
					<div class="form-group">
						<label for="address" class="col-sm-2 control-label"><span class="redStar">*</span>家庭住址</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="address" id="address" placeholder="请输入家庭住址" value="${user.getAddress()}">
						</div>
					</div>
					<div class="form-group">
						<label for="postal" class="col-sm-2 control-label"><span class="redStar">*</span>邮政编码</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="postal" id="postal" placeholder="请输入邮政编码" value="${user.getPostal()}">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-5 col-sm-2">
							<button type="submit" class="btn btn-default">更改基础信息</button>
						</div>
					</div>
				</form>
				<div class="secureInfo" >
					<div class="accountTips" id="secureInfo">
						您的安全服务：
					</div>
					<table class="table table-striped" style="word-break:break-all; word-wrap:break-all;">
   						<tbody>
      						<tr>
         						<td class="labels">修改密码</td>
         						<td class="sammary">安全性高的密码可以使账号更安全。建议您定期更换密码，且设置一个包含数字和字母，并长度超过6位以上的密码。</td>
         						<td><a href="passwordReset"><button type="button" class="btn btn-link">修改</button></a></td>
      						</tr>
      						<tr>
         						<td class="labels">绑定手机</td>
         						<td class="sammary">绑定手机后，您即可享受更加丰富的手机服务，了解资讯更方便。</td>
         						<td id="checkPhone" style="font-weight:bold;">√</td>
      						</tr>
      						<tr>
         						<td class="labels">绑定邮箱</td>
         						<td class="sammary">提升账号的安全性和信任级别，是您找回登录密码的方式之一。</td>
         						<td id="checkEmail" style="font-weight:bold;">√</td>
      						</tr>
   						</tbody>
   					</table>
				</div>
			</div>
		</div>
	</div>
</div>