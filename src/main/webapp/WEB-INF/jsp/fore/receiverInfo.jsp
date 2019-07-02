<%--
  Created by IntelliJ IDEA.
  User: 59906
  Date: 2019/7/1
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>${user.getReceiverInfo().get(0).getAddress1()}</p>
<p>${user.getReceiverInfo().get(0).getAddress2()}</p>
<p>${user.getReceiverInfo().get(0).getPhone()}</p>
<p>${user.getReceiverInfo().get(0).getReceiver()}</p>
<p>${user.getReceiverInfo().get(0).getPostal()}</p>
<p>${user.getReceiverInfo().get(0).getId()}</p>
<p>${user.getReceiverInfo().get(1).getId()}</p>
<p>${user.getReceiverInfo().get(1).getAddress1()}</p>
<p>${user.getReceiverInfo().get(1).getAddress2()}</p>
<p>${user.getReceiverInfo().get(1).getPhone()}</p>
<p>${user.getReceiverInfo().get(1).getReceiver()}</p>
</body>
</html>
