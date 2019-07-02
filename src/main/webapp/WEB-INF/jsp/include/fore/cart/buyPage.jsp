<!-- 购买页面 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	
<script>
$(function(){
    $("a.receiverInformationSelect").click(function(){
    	var riid=$(this).attr("riid");
    	$("input#address1").val($("#address1Information-"+riid).text());
    	$("input#address2").val($("#address2Information-"+riid).text());
    	$("input#receiver").val($("#receiverInformation-"+riid).text());
    	$("input#phone").val($("#phoneInformation-"+riid).text());
    	$("input#postal").val($("#postalInformation-"+riid).text());
    });
    
    $("form.submitOrderForm").submit(function(){
            if(0==$("#address1").val().length||0==$("#phone").val().length||0==$("#address2").val().length||0==$("#receiver").val().length||0==$("#postal").val().length){
                $("span.errorMessage").html("请完整填写收货信息");
                $("div.alterErrorMessageDiv").show();
                return false;
            }
            return true;
        });

        $("form.submitOrderForm input").keyup(function(){
            $("div.alterErrorMessageDiv").hide();
        });
        
    })
</script>

<div class="buyPageDiv">
  <form action="forecreateOrder" role="form" class="submitOrderForm form-horizontal" method="post">
  
	<div class="buyFlow">
		<img class="pull-left" src="img/site/simpleLogo.png">
		<img class="pull-right" src="img/site/buyflow.png">
		<div style="clear:both"></div>
	</div>
	<div class="address">
		<div class="addressTip">输入收货地址</div>
		
		<div class="alterErrorMessageDiv">
			<div class="alert alert-danger">
				<span class="errorMessage"></span>
			</div>
		</div>
		
		<div class="form-group">
			<label for="truename" class="col-sm-1 control-label"><span class="redStar">*</span>地址信息</label>
			<div class="col-sm-9">
				<input type="text" class="form-control" name="address1" id="address1" placeholder="请输入省/市/区" >
			</div>
		</div>
		<div class="form-group">
			<label for="phone" class="col-sm-1 control-label"><span class="redStar">*</span>详细地址</label>
			<div class="col-sm-9">
				<input type="text" class="form-control" name="address2" id="address2" placeholder="请输入详细地址信息，如道路、门牌号、小区、楼栋号、单元等信息">
			</div>
		</div>
		<div class="form-group">
			<label for="email" class="col-sm-1 control-label"><span class="redStar">*</span>收件人</label>
			<div class="col-sm-9">
				<input type="text" class="form-control" name="receiver" id="receiver" placeholder="长度不超过25字符">
			</div>
		</div>
		<div class="form-group">
			<label for="address" class="col-sm-1 control-label"><span class="redStar">*</span>手机号码</label>
			<div class="col-sm-9">
				<input type="text" class="form-control" name="phone" id="phone" placeholder="请输入收件人手机号码">
			</div>
		</div>
		<div class="form-group">
			<label for="postal" class="col-sm-1 control-label"><span class="redStar">*</span>邮政编码</label>
			<div class="col-sm-9">
				<input type="text" class="form-control" name="postal" id="postal" placeholder="请输入邮政编码">
			</div>
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
<!-- 			<col style="width: 90px;"> -->	
			</colgroup>
			<thead class="receiverInformationThead">
				<tr>
					<th><div class="receiverInformationTh">收货人</div></th>
					<th><div class="receiverInformationTh">所在地区</div></th>
					<th><div class="receiverInformationTh">详细地址</div></th>
					<th><div class="receiverInformationTh">邮编</div></th>
					<th><div class="receiverInformationTh">电话/手机</div></th>
					<th class="operation"><div class="receiverInformationTh">操作</div></th>
<!--				<th></th>  -->
				</tr>
			</thead>
			<tbody>
					<!-- 循环订单项  -->
				<c:forEach items="${user.getReceiverInfo()}" var="ri">
					<tr riid="${ri.getId()}" class="receiverItemTR">
						<td>
							<div class="receiverInformationTd" id="receiverInformation-${ri.getId()}">${ri.getReceiver()}</div>
						</td>
						<td>
							<div class="receiverInformationTd" id="address1Information-${ri.getId()}">${ri.getAddress1()}</div>
						</td>
						<td>
							<div class="receiverInformationTd" id="address2Information-${ri.getId()}">${ri.getAddress2()}</div>
						</td>
						<td>
							<div class="receiverInformationTd" id="postalInformation-${ri.getId()}">${ri.getPostal()}</div>
						</td>
						<td >
							<div class="receiverInformationTd" id="phoneInformation-${ri.getId()}">${ri.getPhone()}</div>
						</td>
						<td>
							<div class="receiverInformationTd"><a class="receiverInformationSelect" riid="${ri.getId()}"  href="#nowhere">选择</a></div>
						</td>
					</tr>
				</c:forEach>				
			</tbody>
		</table>
		</div>
		
		
		
		
	
	</div>
	<div class="productList">
		<div class="productListTip">确认订单信息</div>
		
		
		<table class="productListTable">
			<thead>
				<tr>
					<th colspan="2" class="productListTableFirstColumn">
						<img class="tmallbuy" src="img/site/tmallbuy.png">
						<a class="marketLink" href="#nowhere">店铺：天猫店铺</a>
						<a class="wangwanglink" href="#nowhere"> <span class="wangwangGif"></span> </a>
					</th>
					<th>单价</th>
					<th>数量</th>
					<th>小计</th>
					<th>配送方式</th>
				</tr>
				<tr class="rowborder">
					<td  colspan="2" ></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</thead>
			<tbody class="productListTableTbody">
				<c:forEach items="${ois}" var="oi" varStatus="st" >
					<tr class="orderItemTR">
						<td class="orderItemFirstTD"><img class="orderItemImg" src="img/productSingle_middle/${oi.product.firstProductImage.id}.jpg"></td>
						<td class="orderItemProductInfo">
						<a  href="foreproduct?pid=${oi.product.id}" class="orderItemProductLink">
							${oi.product.name}
						</a>
						
						
							<img src="img/site/creditcard.png" title="支持信用卡支付">
							<img src="img/site/7day.png" title="消费者保障服务,承诺7天退货">
							<img src="img/site/promise.png" title="消费者保障服务,承诺如实描述">
						
						</td>
						<td>
						
						<span class="orderItemProductPrice">￥<fmt:formatNumber type="number" value="${oi.product.promotePrice}" minFractionDigits="2"/></span>
						</td>
						<td>
						<span class="orderItemProductNumber">${oi.number}</span>
						</td>
						<td><span class="orderItemUnitSum">
						￥<fmt:formatNumber type="number" value="${oi.number*oi.product.promotePrice}" minFractionDigits="2"/>
						</span></td>
						<c:if test="${st.count==1}">
						<td rowspan="5"  class="orderItemLastTD">
						<label class="orderItemDeliveryLabel">
							<input type="radio" value="" checked="checked">
							普通配送
						</label>
						
						<select class="orderItemDeliverySelect" class="form-control">
							<option>快递 免邮费</option>
						</select>

						</td>
						</c:if>
						
					</tr>
				</c:forEach>				
				
			</tbody>
			
		</table>
		<div class="orderItemSumDiv">
			<div class="pull-left">
				<span class="leaveMessageText">给卖家留言:</span>
				<span>
					<img class="leaveMessageImg" src="img/site/leaveMessage.png">
				</span>
				<span class="leaveMessageTextareaSpan">
					<textarea name="userMessage" class="leaveMessageTextarea"></textarea>
					<div>
						<span>还可以输入200个字符</span>
					</div>
				</span>
			</div>
			
			<span class="pull-right">店铺合计(含运费): ￥<fmt:formatNumber type="number" value="${total}" minFractionDigits="2"/></span>
		</div>
		

				
	
	</div>

	<div class="orderItemTotalSumDiv">
		<div class="pull-right"> 
			<span>实付款：</span>
			<span class="orderItemTotalSumSpan">￥<fmt:formatNumber type="number" value="${total}" minFractionDigits="2"/></span>
		</div>
	</div>
	
	<div class="submitOrderDiv">
			<button type="submit" class="submitOrderButton">提交订单</button>
	</div>
  </form>		
</div>