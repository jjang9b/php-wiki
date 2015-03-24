<!DOCTYPE html>
<html>
<head>
</head>
<body>
<span style="color: #993300;"><strong>[jQuery] $.when 활용</strong></span><br /><br /><span style="color: #000000;">1. 전체 document의 모든 submit 액션 이후 특정 액션을 실행시키고 싶을 때</span><br /><br />
<pre><code>$.when( $( document ).on( 'submit' ) ).then(function(){<br /> &nbsp;&nbsp;console.log( "after action" );<br /> });</code></pre>
</body>
</html>