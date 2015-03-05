<!DOCTYPE html>
<html>
<head>
</head>
<body>
<span style="color: #993300;"><strong>[모바일] 결제 보안<br /><br /></strong><span style="color: #000000;">1.</span><span style="color: #333333;"><span style="color: #000000;">&nbsp;영수증 정보 등을 이용한 결제 정보 체크는 반드시 서버에서 한다.</span><br /><br /><span style="color: #000000;">2. DB를 통한 영수증 중복 사용 체크&nbsp;</span><br /><br /><span style="color: #000000;">3. AOS - 구글에서 제공하는 helper 클래스를 이용해 IAP 구현시</span> <span style="color: #993300;">Security.verifyPurchase 를 사용해선 안된다</span>.<br /><span style="color: #000000;">&nbsp; &nbsp; helper 클래스에서도 제거 필수.</span></span></span>
</body>
</html>