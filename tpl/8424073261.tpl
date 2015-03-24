<!DOCTYPE html>
<html>
<head>
</head>
<body>
<strong><span style="color: #993300;">1. 기초<br /><br /><span style="color: #333333;">Tip1 - 연결지향 프로토콜과 비연결 프로토콜의 차이점을 이해하라<br /><br /></span></span></strong><span style="color: #993300;"><span style="color: #333333;">비연결 프로토콜 <br /><br />- <span style="color: #993300;">각각의 패킷이 독립적이며, 신뢰성을 보장하지 않음</span><br />- 일대다, 다대일 통신<br />- 패킷 단위 : 데이터그램<br /><br />연결 프로토콜 <br /><br />- 프로토콜에 의해 <span style="color: #993300;">연속적인 패킷의 상태정보가 유지, 신뢰성을 보장</span>.<br />- 일대일 연결 통신<br />- 패킷 단위 : 세그먼트<br /><br />- <span style="color: #993300;">IP는 신뢰성없는 비연결 서비스를 제공</span>하며, 패킷을 받아 캡슐화하여 하드웨어 인터페이스로 전송.<br />패킷을 라우팅하는 기술이며 <span style="color: #993300;">모든 네트워크상에서 사용</span>할 수 있기 때문에,<br />TCP/IP 역시 동일한 기능이 가능하다.<br /><br />- 이런 신뢰성 없는 IP를 기반으로한 TCP가 신뢰성을 갖는 방법은<br /><span style="color: #993300;">체크섬을 통해 손상 여부</span>판별, <span style="color: #993300;">시퀀스 번호를 통해 순서</span> 체크.<br /><br /><br /><strong>Tip2 - 서브넷과 CIDR을 이해하라<br /><br /><br /></strong><br /><br /><br /><br /></span></span>
</body>
</html>