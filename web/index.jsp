<%--
  Created by IntelliJ IDEA.
  User: young
  Date: 2019-11-14
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@page pageEncoding="UTF-8"%>
<html lang="zh">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>聊天版</title>
    <link rel="stylesheet" type="text/css" href="./static/css/mdui.min.css">
    <script src="./static/js/mdui.min.js"></script>
    <script src="./static/js/replys.js"></script>
  </head>

  <body class="mdui-appbar-with-toolbar mdui-theme-primary-indigo mdui-theme-accent-pink mdui-loaded">
    <script>
        request();
        function buttonSubmit() {
            let xhttp = new XMLHttpRequest();
            let username=document.getElementById("username").value;
            let replyContent = document.getElementById("replyContent").value;
            xhttp.open("POST", "./reply?username="+username+"&replyContent="+replyContent,true);
            xhttp.send();
            // form.submit();
            // return false;
        }
    </script>
    <header class="mdui-appbar mdui-appbar-fixed">
      <div class="mdui-toolbar mdui-color-theme">
        <a href="" class="mdui-typo-headline mdui-hidden-xs">购买</a>
        <a href="" class="mdui-typo-title"></a>
        <div class="mdui-toolbar-spacer"></div>
      </div>
    </header>
    <br><br><br>
    <div class="mdui-container">
      <div class="mdui-card">
        <ul class="mdui-list" id="reply-list">

        </ul>
      </div>
    </div>
    <button class="mdui-fab mdui-fab-fixed mdui-color-theme-accent mdui-ripple" mdui-dialog="{target: '#replyDialog'}">
      <i class="mdui-icon material-icons">add</i>
    </button>
    <div class="mdui-dialog with-title" id="replyDialog" style="display: block; top: 50px; height: 301px;">
      <div class="mdui-container">
        <div class="mdui-textfield mdui-textfield-floating-label">
          <label class="mdui-textfield-label">用户名</label>
            <label for="username"></label><input class="mdui-textfield-input" name="username" type="text" id="username" required/>
          <div class="mdui-textfield-error">用户名不能为空</div>
        </div>
        <div class="mdui-textfield">
            <label for="replyContent"></label><textarea class="mdui-textfield-input" id="replyContent" rows="8" placeholder="回复文本"></textarea>
        </div>
        <div class="mdui-dialog-actions">
          <button class="mdui-btn mdui-ripple" mdui-dialog-close>取消</button>
          <button class="mdui-btn mdui-ripple" mdui-dialog-confirm onclick="buttonSubmit()">发送</button>
        </div>
      </div>
      <br>
      <br>
    </div>
    <form id="submitForm" method="POST" action="./reply" hidden></form>
  </body>
</html>