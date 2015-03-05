<!DOCTYPE html>
<html>
<head>
</head>
<body>
<span style="color: #993300;"><span style="color: #993300;"><strong>[쿠폰] common<br /><br /></strong><br /><span style="color: #000000;"><strong>정의<br /><br /></strong>-&nbsp;</span></span></span><span style="color: #333333;"><span style="color: #000000;">일반쿠폰 :</span> <span style="color: #993300;">PREFIX(4) + 쿠폰 난수(10) + <span>checksum </span>체크 방식(1) + <span>checksum </span>str(1)</span><br /><br /></span>- <span style="color: #993300;"><span style="color: #993300;"><span style="color: #993300;">프로모션 -&gt; 쿠폰 -&gt; 쿠폰 차수<span style="color: #000000;">&nbsp;로 단위 구분.<br /></span></span></span></span>
<ul>
<li><span style="color: #000000;"><strong> </strong><strong>프로모션 : </strong>쿠폰 발급 단위. 게임별로 여러 프로모션이 존재.</span></li>
<li><span style="color: #000000;"><strong> </strong><strong>이벤트 : </strong>쿠폰의 실제 발급 묶음 단위. 하나의 프로모션에 여러 이벤트가 존재.<br /> 기존의 매체별 단위로 생각할 수 있음.</span></li>
<li><span style="color: #000000;"><strong> </strong><strong>이벤트 쿠폰 : </strong>DB 스키마상의 단위이며, 하나의 이벤트에 이벤트 쿠폰 차수별 발급 가능.<br /> 추가 발급시 사용됨.</span></li>
</ul>
<span style="color: #000000;"><br />- 쿠폰 난수 타입<br /></span>
<ul>
<li><span style="color: #000000;"><strong>S : </strong>문자 쿠폰 (1개 쿠폰 N명 1회 사용)</span></li>
<li><span style="color: #000000;"><strong>U : </strong>일반 (1개 쿠폰 1명 1회 사용)</span></li>
<li><span style="color: #000000;"><strong>M : </strong>일반 (N개 쿠폰 1명 1회 사용)</span></li>
<li><span style="color: #000000;"><strong>C : </strong>반복 사용 (1개 쿠폰 1명 N회 사용)</span></li>
<li><span style="color: #000000;"><strong>D : </strong>반복 사용 (1개 쿠폰 1명 1일 1회 사용)</span></li>
</ul>
<br /><span style="color: #000000;">- 하나의 난수 쿠폰은 하나의 게임만을 지원.</span><br /><br /><span style="color: #000000;">- 발급 : 미리 모든 제외로직이 반영된 난수 테이블에 seq 번호로만 발급시 FROM, TO 를 입력</span><br /><br /><span style="color: #000000;">- 체크 : </span><span style="color: #993300;">난수 번호, checksum 로직, 난수타입별 제한 체크, 유효기간 체크&nbsp;</span><br /><br /><br /><span><span style="color: #000000;"><strong>DB</strong></span><br /><br /><span color="#333333" style="color: #333333;"><span style="color: #000000;">- promotion : 프로모션</span><br /><span style="color: #000000;">- event : 프로모션별 이벤트</span><br /><span style="color: #000000;">- event_coupon : 이벤트별 쿠폰발행&nbsp;</span><br /><span style="color: #000000;">- coupon_print : 사전 발급 쿠폰</span><br /><span style="color: #000000;">- event_prefix : 이벤트 프리픽스</span><br /><span style="color: #000000;">- promotion_user : 프로모션 참여자 체크용</span><br /><span style="color: #000000;">- coupon_use_check : 쿠폰 입력오류 체크용</span><br /><span style="color: #000000;">- coupon_use_log : 쿠폰 사용 로그</span><br /><br /></span></span>
</body>
</html>