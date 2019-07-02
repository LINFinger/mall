<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>

<script>
var deleteReceiverItem = false;
var deleteReceiverItemid = 0;

$(function(){
	window.onpageshow = function(event) {
        if (event.persisted || (window.performance && window.performance.navigation.type == 2)) {
            window.location.reload()
        }
    };
    
    //删除订单项函数，获取当前标签的oiid属性，也就是订单项id
	$("a.deleteReceiverItem").click(function(){
		deleteReceiverItem = false;
		var riid = $(this).attr("riid")
		deleteReceiverItemid = riid;
		//删除提示模态
		$("#deleteConfirmModal").modal('show');	   
	});
	//模态选择了是的话就删除订单项
	$("button.deleteConfirmButton").click(function(){
		deleteOrderItem = true;
		$("#deleteConfirmModal").modal('hide');
	});
	
	//模态框完全对用户隐藏时触发。也就是选择删除，完全隐藏后触发这个函数
	$('#deleteConfirmModal').on('hidden.bs.modal', function (e) {
		if(deleteReceiverItem){
			var page="foredeleteReceiverItem";
			$.post(
				    page,
				    {"riid":deleteReceiverItemid},
				    function(result){
						if("success"==result){
							$("tr.receiverItemTR[riid="+deleteReceiverItemid+"]").hide();
						}
						else{
							location.href="loginPage";
						}
				    }
				);
			
		}
	})	
    
    $("form.alterAccountForm").submit(function(){
            if(0==$("#address2").val().length||0==$("#phone").val().length||0==$("#receiver").val().length||0==$("#address1").val().length||0==$("#postal").val().length){
                $("span.errorMessage").html("请完整填写收货信息");
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
		<label class="accountSpe col-sm-2">收货信息</label>
		<div class="userTab col-sm-10">
			<ul class="nav nav-pills">
				<li><a href="accountPage">账户信息</a></li>
				<li class="active"><a href="receiverInformation">收货地址</a></li>
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
				<div class="receiverTips">
					编辑收货信息：
				</div>
				<form action="alterAccountInfo" role="form" class="alterAccountForm form-horizontal">
					<div class="form-group">
						<label for="truename" class="col-sm-2 control-label"><span class="redStar">*</span>地址信息</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="address1" id="address1" placeholder="请输入省/市/区" >
						</div>
					</div>
					<div class="form-group">
						<label for="phone" class="col-sm-2 control-label"><span class="redStar">*</span>详细地址</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="address2" id="address2" placeholder="请输入详细地址信息，如道路、门牌号、小区、楼栋号、单元等信息">
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-sm-2 control-label"><span class="redStar">*</span>收件人姓名</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="receiver" id="receiver" placeholder="长度不超过25字符">
						</div>
					</div>
					<div class="form-group">
						<label for="address" class="col-sm-2 control-label"><span class="redStar">*</span>手机号码</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="phone" id="phone" placeholder="请输入收件人手机号码">
						</div>
					</div>
					<div class="form-group">
						<label for="postal" class="col-sm-2 control-label"><span class="redStar">*</span>邮政编码</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="postal" id="postal" placeholder="请输入邮政编码">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-5 col-sm-7">
							<button type="submit" class="btn btn-default">保存</button>
						</div>
					</div>
				</form>
				
				<div class="receiverTips">
					已保存的收货信息：
				</div>
				<div class="receiverInformationTable">
				<table class="receiverInformationTable table table-bordered table-hover class">
					<colgroup>
						<col style="width: 70px;">
						<col>
						<col style="width: 200px;">
						<col style="width: 100px;">
						<col style="width: 140px;">
						<col style="width: 110px;">
<!-- 					<col style="width: 90px;"> -->	
					</colgroup>
					<thead class="receiverInformationThead">
						<tr>
							<th><div class="receiverInformationTh">收货人</div></th>
							<th><div class="receiverInformationTh">所在地区</div></th>
							<th><div class="receiverInformationTh">详细地址</div></th>
							<th><div class="receiverInformationTh">邮编</div></th>
							<th><div class="receiverInformationTh">电话/手机</div></th>
							<th class="operation"><div class="receiverInformationTh">操作</div></th>
<!--						<th></th>  -->
						</tr>
					</thead>
					<tbody>
							<tr riid="${oi.id}" class="receiverItemTR">
								<td>
									<div class="receiverInformationTd">name</div>
								</td>
								<td>
									<div class="receiverInformationTd">address1</div>
								</td>
								<td>
									<div class="receiverInformationTd">address2</div>
								</td>
								<td>
									<div class="receiverInformationTd">postal</div>
								</td>
								<td >
									<div class="receiverInformationTd">phone</div>
								</td>
								<td>
									<div class="receiverInformationTd"><a class="deleteReceiverItem" oiid="${oi.id}"  href="#nowhere">删除</a></div>
								</td>
							</tr>
					<!-- 循环订单项  -->
						<c:forEach items="${ris }" var="oi">
							<tr riid="${ri.id}" class="receiverItemTR">
								<td>
									<div class="receiverInformationTd">name</div>
								</td>
								<td>
									<div class="receiverInformationTd">address1</div>
								</td>
								<td>
									<div class="receiverInformationTd">address2</div>
								</td>
								<td>
									<div class="receiverInformationTd">postal</div>
								</td>
								<td >
									<div class="receiverInformationTd">phone</div>
								</td>
								<td>
									<div class="receiverInformationTd"><a class="deleteReceiverItem" riid="${ri.id}"  href="#nowhere">删除</a></div>
								</td>
							</tr>
						</c:forEach>				
					</tbody>
				</table>
				</div>
			</div>
		</div>
	</div>
</div>