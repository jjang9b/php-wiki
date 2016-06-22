<p>&nbsp;</p>

<p><span style="color:#993300"><span style="color:#993300"><span style="color:#993300"><strong>[기본] commonJS - nodeJS 로딩 이해</strong><br />
<br />
<span style="color:#000000">nodeJS가 가장 대표적인 commonJS 규격으로 개발된 framework 이며 </span><br />
<span style="color:#000000">ServerSide에서 사용되는 부분을 브라우저로 구현해 보았다.</span><br />
<br />
<span style="color:#000000">실제로는 v8 엔진을 통해 js를 로드하는 부분들은 직접 파일을 로드하게 되는데, </span><br />
<span style="color:#000000">이부분은 eval()을 통해&nbsp;간접 구현.&nbsp;</span><br />
<br />
<span style="color:#000000">코드를 파악해 보면 전체적 nodeJS의 commonJS 규격에 맞춘 모듈 로드 형태가 파악됨.</span></span></span></span></p>

<pre>
<code>
// 1.html
&lt;!DOCYTYPE&gt;
&lt;html&gt;
&lt;head&gt;
 &lt;script src=&quot;node.js&quot;&gt;&lt;/script&gt;
 &lt;script type=&quot;text/javascript&quot;&gt;
 var main = require( &#39;main&#39; );
 main.socketOpen();
 // Console.log : socket open
 &lt;/script&gt;
&lt;/head&gt;
&lt;/html&gt;
</code>
</pre>

<pre>
<code class="javascript">
 // node.js
(function( _this ){
 function Module( id ){
&nbsp; this.id = id;
&nbsp; this.exports = {};
 };

 /* 1. compile 을 통해 module을 로드 및 exports / require 함수 전역화 */
 Module.prototype = {
&nbsp; compile : function(){
&nbsp; &nbsp; (function( exports, id ){
   // 중요! window.exports 에 다가 module.exports 를 넣어줌
   // console.log( exports !== _this.exports );
&nbsp; &nbsp; &nbsp; _this.exports = exports;
&nbsp; &nbsp; &nbsp; Module.evalScript( id );

&nbsp; &nbsp; })( this.exports, this.id );
&nbsp; }
 };

 /* 2. node.js와 같이 server에서 직접 로드 방식 eval()로 구현 */
 Module.evalScript= function( file ){
&nbsp; var xhr = null
&nbsp; , url = file + &#39;.js&#39;;

&nbsp; if ( _this.XMLHttpRequest ) {
&nbsp; &nbsp; xhr = new window.XMLHttpRequest();
&nbsp; } else if ( _this.ActiveXObject ){
&nbsp; &nbsp; xhr = new window.ActiveXObject( &#39;Microsoft.XMLHTTP&#39; );
&nbsp; }

&nbsp; xhr.open( &#39;GET&#39;, url, false );
&nbsp; xhr.setRequestHeader(&#39;Content-type&#39;, &#39;text/html&#39; );
&nbsp; xhr.onreadystatechange = function(){
&nbsp; &nbsp; if( xhr.readyState == 4 ){
&nbsp; &nbsp; &nbsp; switch( xhr.status ){
&nbsp; &nbsp; &nbsp; case 200 :
&nbsp; &nbsp; &nbsp; &nbsp; eval( xhr.responseText );
&nbsp; &nbsp; &nbsp; &nbsp; break;
&nbsp; &nbsp; &nbsp; }
&nbsp; &nbsp; }
&nbsp; }
&nbsp; &nbsp; &nbsp; xhr.send();
 };

 /* 3. 전역 함수 require 정의 */
 Module.require = function( id ){
&nbsp; var module = new Module( id );
&nbsp; module.compile();

&nbsp; return module.exports;
 };

 _this.require = Module.require;

})( window );

</code>
</pre>

<pre>
<code  class="javascript">// main.js
(function( exports ){
  var socket = require( &#39;socket&#39; );
  function socketOpen(){
   socket.open();
  };
  exports.socketOpen = socketOpen; 
})( 
 typeof exports !== undefined ? exports : {}
);</code></pre>

<pre>
<code  class="javascript">
// socket.js
function open(){
 console.log( &#39;socket open&#39; );
};
exports.open = open;
</code>
</pre>

<p>&nbsp;</p>

<p><br />
가장 중요한 부분은 결국 require() 함수를 전역으로 쓸수 있게 하며 <span style="color:#993300"><strong>module.exports </strong><span style="color:#000000">객체가 return 된다는 점이다.</span></span><br />
전역 exports 속성에 각 모듈을 추가하여 정의하도록 하며, 실제 return은 module.exports를 통해<br />
call by reference 의 규약을 갖도록 약속하고 있다.<br />
<br />
1. node.js 를 통해 Module 함수객체(class) 를 선언하며 require() 함수를 정의한다.<br />
해당 함수에서 Module 객체를 new 생성하며 로드하려는 모듈 id를 정의한다.<br />
<br />
2. new를 통해 module.compile() 이란 prototype 속성에 접근하며,&nbsp;<br />
evalScript()를 통해 별도의 js모듈 파일을 로드한다. 이때 각 모듈이 exports 참조에 자신의 모듈을 추가하게 된다.<br />
<br />
3. 이후 return module.exports를 하게 되면 2번에서 추가된 exports참조 값을 리턴하게 되어<br />
해당 모듈을 리턴 받게 된다.<br />
<br />
@실제로는 require() 하는 당시 내부 cache를 쓰는 부분이 추가되어 있다.</p>

<p>&nbsp;</p>
