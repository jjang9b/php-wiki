<!DOCTYPE html>
<html>
<head>
</head>
<body>
<span style="color: #993300;"><strong>[기본] 표준규격 - AMD</strong></span><br /><br /><span style="color: #000000;">Asynchronous Module Define 의 약자로 CommonJS와 같이 표준 규약을 지키기 위한 명칭으로 볼 수 있다.</span><br /><span style="color: #000000;">CommonJS 워킹그룹과 같이 규약에 대해 개발을 진행하다가 좀 더 비동기적인 환경에 맞춘</span><br /><span style="color: #000000;">표준 규격으로 발전한 것이 <strong>AMD(Asynchronous Module Define)</strong> 이다.</span><br /><br /><span style="color: #000000;">가장 대표적인 모듈을 requireJS로 들 수 있으며, requireJS에서도 설명하듯이</span><br /><br /><span style="color: #000000;">- 비동기 호출 환경에서의 의존성 관리</span><br /><span style="color: #000000;">- 모듈화</span><br /><span style="color: #000000;">- 동적 로딩</span><br /><br /><span style="color: #000000;">의 특징을 가지며, javascript로의 프로젝트 단위의 개발시 중요하게 생각될 수 있는 부분이다.</span><br /><br />
<pre><code class="javascript">// module/char.js<br />define(["module/log"], function (log) {<br /> function change() {<br /> log.write( "Log Write complete" );<br /> }<br /> return {<br /> change: change<br /> }<br />});<br /><br />// module/log.js<br />define([], function () {<br /> function write( logConts ) {<br /> console.log( logConts );<br /> }<br /> return {<br /> write: write<br /> }<br />});<br /><br />require(["module/char"], function(char) {<br /> char.change();<br /> /* Console.log : Log Write complete */<br />});<br /></code></pre>
<br />commonJS 방식과는 달리 순차적으로 require을 통해 모듈을 호출하여 객체에 담아 사용하지 않으며,&nbsp;<br />require 시 여러 모듈을 동적으로 로딩하는 것이 특징이다.<br /><br />브라우저에서 구현한 commonJS에서 eval로 모듈 로딩을 구현한 부분과 같이&nbsp;<br />실제로는 직접 로컬 파일에 접근하는 형태와 더불어<br /><strong>보통 서버 사이드에선 commonJS를 브라우저 환경에선 AMD</strong>&nbsp;방식이 사용하기 적합하다.
</body>
</html>