<!DOCTYPE html>
<html>
<head>
</head>
<body>
<strong><span style="color: #993300;">[기본] this 유효범위<br /><br /></span></strong><br /> <span style="color: #333333;"><strong>this 유효범위 (scope)</strong></span><strong><span><br /><br /></span></strong>
<ol>
<li><span style="color: #333333;"><strong>독립적으로 선언된 함수일 경우 </strong>(standalone function)</span> <br />
<pre><code class="javascript"><span>function a(){<br /> console.log( this );<br />}<br />a(); // window 객체. Global 객체를 가르킴<br /><br />var a = function(){<br /> console.log( this );<br />}<br />a(); // 동일하게 window 객체<br /><br /></span></code></pre>
</li>
</ol>
<ol start="2">
<li><span style="color: #333333;"><strong>특정 object의 method로 선언된 경우</strong> </span><br />
<pre><code class="javascript">var a = {<br /> b : function(){<br />  console.log( this );<br /> }<br />}<br />a.b(); // a 객체를 가르킴<br /></code></pre>
</li>
</ol>
<span><br />@ </span>참고로 이렇게<span> this</span>의 유효범위가 정해지기 때문에 이를 임의로 조작하기 위해 <br /><span style="color: #993300;"><strong>call / apply 함수를 이용해 this의 유효범위를 변경</strong></span>해 줍니다<span>.</span>
</body>
</html>