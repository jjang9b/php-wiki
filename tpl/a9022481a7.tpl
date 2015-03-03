<!DOCTYPE html>
<html>
<head>
</head>
<body>
<span style="color: #993300;"><strong>[기본] rsa 키 공유<br /><br /><br /></strong><span style="color: #333333;"><strong>ssh-keygen -t rsa</strong>&nbsp;를 통해 생성된 id_rsa, id_rsa.pub 키는 <br /><br />해당 git서버에 public key로 등록을 먼저 해주어야 하며,&nbsp;<br /><br /><span style="color: #993300;">ssh로 접속하는 특정 서버에 종속적이지 않기 때문에</span><br /><br />생성하여 <span style="color: #993300;">여러 서버별 공유하여 해당 ssh 서버 인증이 가능</span>하다.<br /><br />git서버자체가 다른 경우는 <strong>knwon_hosts</strong>&nbsp;<strong></strong>에 등록하여 사용 가능한걸로 보임.</span></span>
</body>
</html>