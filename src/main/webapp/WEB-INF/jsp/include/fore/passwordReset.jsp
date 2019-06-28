<!-- 注册主界面 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>


<script>
    $(function(){
        var pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[^]{8,16}$/;
        //返回错误提示 "用户名不存在"
        <c:if test="${!empty msg}">
        $("span.errorMessage").html("${msg}");
        $("div.registerErrorMessageDiv").css("visibility","visible");
        </c:if>

        $(".passwordForm").submit(function(){
            if(0==$("#name").val().length){
                $("span.errorMessage").html("请输入用户名");
                $("div.registerErrorMessageDiv").css("visibility","visible");
                return false;
            }
            if(0==$("#password").val().length){
                $("span.errorMessage").html("请输入密码");
                $("div.registerErrorMessageDiv").css("visibility","visible");
                return false;
            }
            if(!pattern.test($("#password").val())){
                $("span.errorMessage").html("密码强度不够(大写字母，小写字母和数字，长度为8-18位)");
                $("div.registerErrorMessageDiv").css("visibility","visible");
                return false;
            }
            if(0==$("#repeatpassword").val().length){
                $("span.errorMessage").html("请输入重复密码");
                $("div.registerErrorMessageDiv").css("visibility","visible");
                return false;
            }
            if($("#password").val() !=$("#repeatpassword").val()){
                $("span.errorMessage").html("重复密码不一致");
                $("div.registerErrorMessageDiv").css("visibility","visible");
                return false;
            }

            return true;
        });
    })
</script>



<form method="post" action="passwordRegister" class="passwordForm">


    <div class="registerDiv">
        <div class="registerErrorMessageDiv">
            <div class="alert alert-danger" role="alert">
                <button type="button"  class="close" data-dismiss="alert" aria-label="Close"></button>
                <span class="errorMessage"></span>
            </div>
        </div>


        <table class="registerTable" align="center">
            <tr>
                <td  class="registerTip registerTableLeftTD">输入用户名</td>
                <td></td>
            </tr>
            <tr>
                <td class="registerTableLeftTD">用户名</td>
                <td  class="registerTableRightTD"><input id="name" name="name" placeholder="输入希望找回密码的用户名" > </td>
            </tr>
            <tr>
                <td  class="registerTip registerTableLeftTD">重置登陆密码</td>
                <td  class="registerTableRightTD">输入新的用户密码</td>
            </tr>
            <tr>
                <td class="registerTableLeftTD">登陆密码</td>
                <td class="registerTableRightTD"><input id="password" name="password" type="password"  placeholder="设置你的登陆密码" > </td>
            </tr>
            <tr>
                <td class="registerTableLeftTD">密码确认</td>
                <td class="registerTableRightTD"><input id="repeatpassword" type="password"   placeholder="请再次输入你的密码" > </td>
            </tr>

            <tr>
                <td colspan="2" class="registerButtonTD">
                    <a href="resetSuccess.jsp"><button>提   交</button></a>
                </td>
            </tr>
        </table>
    </div>
</form>