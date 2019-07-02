
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@include file="../include/fore/header.jsp"%>
<%@include file="../include/fore/top.jsp"%>
<%@include file="../include/fore/simpleSearch.jsp"%>
<%@include file="../include/fore/account/receiverInformationPage.jsp"%>
<%@include file="../include/fore/footer.jsp"%>

<p>${user.getReceiverInfo().getAddress()}</p>
<p>${user.getReceiverInfo().getPhone()}</p>
<p>${user.getReceiverInfo().getReceiver()}</p>

