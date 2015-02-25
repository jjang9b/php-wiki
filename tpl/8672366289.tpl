<!DOCTYPE html>
<html>
<head>
</head>
<body>
<strong><span style="color: #993300;">[기본] 클로저</span><br /></strong><strong><br /></strong> <span>this </span>의 유효범위와 연결되어 생각되는 개념으로 <span style="color: #993300;">내부 함수가 자신이 선언될 때의 환경에 대한 연결을 갖는다 <br />(scope chain) </span>가 핵심이구요 이를 통해 내부함수가 부모격인 외부함수의 변수에 <span style="color: #993300;">직접(참조) </span>가 가능하게 됩니다<span>.</span>
<pre><code>window.num = 999;<br /><br />function a(){<br /> var num = 1;<br /> <br /> return function b(){<br />  num++;<br />  console.log( this.num, num );<br /> }<br />}<br /><br />var callback = a();<br />callback(); // 999 2<br />callback(); // 999 3<br />callback(); // 999 4</code></pre>
<br /> 보통의 언어에서는 말도 안되는 부분이지만<span> javascript </span>에선 위와 같은 부분이 가능합니다<span>.</span> <br /><span>a() </span>를 실행하여<span> callback </span>변수에 익명의 함수를 전달 받게 되면,&nbsp;<span>&nbsp;</span> <br /><br />내부는<br />
<pre><code>var callback = function(){<br /> num++;<br /> console.log( this.num, num );<br />}</code></pre>
<br /><br /> 의 형태가 됩니다<span>. callback </span>함수<span> (b</span>함수를 리턴 받은<span>) </span>의 입장에선<span> num </span>변수를 선언한 적도 없는데 증가가 불가능 한 게 당연하지만<span>, </span> <span style="color: #993300;">b 함수</span> 자기가 선언될 때 당시의 <span style="color: #993300;">부모격인 외부함수 a() 의 환경에 대한 연결</span>을 갖게 됩니다<span>.</span> 그래서<span> num </span>변수에 참조 접근이 가능하며<span>, </span>이를 통해 증가가 가능하게 됩니다<span><span>.<br /><br /><br /></span></span> <span>@ </span>참고로<span> b </span>함수는 독립적으로 선언된 함수이므로<span> this </span>가<span> window</span>를 가르키며<span>, this.num </span>은 <span style="color: #333333;"><strong>999</strong></span> 를 참조합니다<span>.</span> 하지만<span> num </span>은 자기가 선언될 당시의<span> a</span>함수의<span> num </span>변수를 가르키게 됩니다<span>.</span>
</body>
</html>