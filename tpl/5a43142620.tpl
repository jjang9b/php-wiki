<!DOCTYPE html>
<html>
<head>
</head>
<body>
<strong><span style="color: #993300;">[기본] 표준규격 - commonJS<br /><br /><br /></span></strong>commonJS 라는건 특별한 javascript framework나 module 을 뜻하는건 아니며<br />표준적 언어의 명세를 만들기 위한 워킹 그룹에서 말하는 규격을 의미한다.<br /><br />동기적인 호출 방식으로 인해 보통 Server Side에서 많이 사용되며,&nbsp;node.js가 가장 큰 예로 볼 수 있다.<br /><br /><strong>1. 모듈화</strong> : 각각의 모듈은 독립적이며 필요에 의해 로드하여 사용<br /><strong>2. 모듈객체</strong> : module.exports 를 통하여 공통의 모듈을 담아두는 참조 객체를 정의.<br /><strong>3. 사용</strong> : require 함수를 통해 공통적으로 모듈을 로드하며 해당 모듈은 module.exports를 리턴<br /><br /><br />commonJS.org 에서 제공하는 sample code.<br />
<pre><code><strong>//math.js</strong><br />exports.add = function() {<br /> var sum = 0, i = 0, args = arguments, l = args.length;<br /> while (i &lt; l) {<br /> sum += args[i++];<br /> }<br /> return sum;<br />};<br /><br /><strong>//increment.js</strong><br />var add = require('math').add;<br />exports.increment = function(val) {<br /> return add(val, 1);<br />};<br /><br /><strong>//program.js</strong><br />var inc = require('increment').increment;<br />var a = 1;<br />inc(a); // 2
</code></pre>
</body>
</html>