<!DOCTYPE html>
<html>
<head>
</head>
<body>
<span style="color: #993300;"><strong>[모바일] Server 보안<br /><br /><br /></strong><span style="color: #333333;"><strong>1. 패킷 암호화</strong><br /><br /><strong>-&nbsp;</strong>https : <span style="color: #993300;">TLS</span> 사용<br />- MITM 공격 대비한<span style="color: #993300;"> SSL pinning</span> 사용 필요<br /><br />- <span style="color: #993300;">소켓</span> 기반 통신시 반드시 <span style="color: #993300;">패킷 암호화</span><br /><br />- <span style="color: #993300;">변조 탐지용 Hash 추가</span><br /><br /><br /><strong>2. 중복 패킷<br /><br /></strong>- Client / Server 통신시마다 패킷에 <span style="color: #993300;">token 을 포함시켜 중복 여부 체크</span> <br />&nbsp; : 부하 발생할 수 있으니 중요한 패킷 위주로 사용<br /><br />- <span style="color: #993300;">중요 데이터 체크는 항상 Server</span>에서!<br /><br />- Bot 체크&nbsp;<br />&nbsp; : 특정 로그를 통한 반복된 사용여부 체크&nbsp;<br />&nbsp; 모든 패턴을 찾아서 제한할 수 없으나 시스템상 제한 요소는 고려할 필요가 있음.<br /><br />- 스피드 핵<br />&nbsp; : 주기적 시간 동기화<br />&nbsp; : 비정상적인 시간 체크<br />&nbsp; : 서버에서만 시간 체크<br /><br /></span></span>
</body>
</html>