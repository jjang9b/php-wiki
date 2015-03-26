<!DOCTYPE html>
<html>
<head>
</head>
<body>
<strong><span style="color: #993300;">[jQuery] onResize()</span><br /><br /><br /></strong>화면에 괜히 생기는 스크롤 바를 없애며, 실제 화면 크기를 측정에 min-height를 지정할 수 있다.<br />.wrapper 에 해당하는 부분을 전체 감싸는 div 로 수정.<br /><br />
<pre><code>var onloadResize = function(){<br /> var height = $(window).height() - $( 'body &gt; .header' ).height() - ($( 'body &gt; .footer' ).outerHeight() || 0);<br /> height = parseInt(height)-40;<br /> $( '.wrapper' ).css( 'min-height', height + 'px' );<br /><br /> var content = $( '.wrapper').height();<br /> if (content &gt; height)<br /> $( '.left-side, html, body' ).css( 'min-height', content + 'px' );<br /> else {<br /> $( '.left-side, html, body' ).css( 'min-height', height + 'px' );<br /> };</code></pre>
</body>
</html>