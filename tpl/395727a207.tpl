<pre>
<code>
<strong>SERVER</strong>
?php
$sEnerKey = uniqid();
$nEner = 10000;
$nEnerCur = 10000;
$nChar = 30;

for($i=0,$j=$nChar;$i<$j;$i++)
{
  $aChar[$i]['att'] = rand(1, 10);
  $aChar[$i]['spee'] = rand(1, 3);
}

while($nEnerCur > 0)
{
  for($i=0, $j=count($aChar);$i<$j;$i++)
  {
    $nEnerCur -= $aChar[$i]['att'];
  }
}

$oData = array(
  'nEner'=>$nEner,
  'sEnerKey'=>$sEnerKey,
  'aChar'=>$aChar
);

echo json_encode($oData, JSON_UNESCAPED_UNICODE);
</code></pre>

<pre>
<code>
<strong>HTML</strong>

&lt;!DOCTYPE&gt;
&lt;html&gt;
&lt;head&gt;
&nbsp; &lt;script src=&quot;//static.four33.co.kr/external/jquery/jquery.min.js&quot;&gt;&lt;/script&gt;
&nbsp; &lt;script src=&quot;1.js&quot;&gt;&lt;/script&gt;
&nbsp; &lt;link href=&quot;//static.four33.co.kr/external/bootstrap/css/bootstrap.min.css&quot; rel=&quot;stylesheet&quot; type=&quot;text/css&quot; /&gt;
&nbsp; &lt;link href=&quot;//static.four33.co.kr/external/bootstrap/css/AdminLTE.css&quot; rel=&quot;stylesheet&quot; type=&quot;text/css&quot; /&gt;
&lt;/head&gt;
&lt;body&gt;
&nbsp; &lt;div class=&quot;col-xs-6&quot;&gt;
&nbsp; &nbsp; &lt;div class=&quot;box-header&quot;&gt;
&nbsp; &nbsp; Ener
&nbsp; &nbsp; &lt;/div&gt;
&nbsp; &nbsp; &lt;div class=&quot;box-body&quot;&gt;
&lt;pre id=&quot;p_ener&quot; class=&quot;text-muted well well-sm no-shadow&quot; style=&quot;height:50px;&quot;&gt;
&lt;/pre&gt;
&lt;pre id=&quot;p_ener_time&quot; class=&quot;text-muted well well-sm no-shadow&quot; style=&quot;height:50px;&quot;&gt;
&lt;/pre&gt;
&nbsp; &nbsp; &nbsp; &lt;/div&gt;
&nbsp; &nbsp; &lt;/div&gt;
&nbsp; &lt;/div&gt;
&nbsp; &nbsp; &lt;div class=&quot;col-xs-6&quot;&gt;
&nbsp; &nbsp; &nbsp; &lt;div class=&quot;box-header&quot;&gt;
&nbsp; &nbsp; &nbsp; User
&nbsp; &nbsp; &nbsp; &lt;/div&gt;
&nbsp; &nbsp; &nbsp; &lt;div class=&quot;box-body&quot;&gt;
&lt;pre id=&quot;p_user&quot; class=&quot;text-muted well well-sm no-shadow&quot; style=&quot;height:510px;overflow:scroll&quot;&gt;
&lt;/pre&gt;
&nbsp; &nbsp; &nbsp; &lt;/div&gt;
&nbsp; &nbsp; &lt;/div&gt;
&nbsp; &lt;/div&gt;
&lt;/body&gt;
&lt;/html&gt;</code></pre>

<pre>
<code>
<strong>JS</strong>
(function(){

  var uApi = &#39;fi.php&#39;;
  var aChar = [];

  function f( ret ){
    window.nEner = [];
    window.nEner[ ret.sEnerKey ] = [];
    window.nEner[ ret.sEnerKey ][ &#39;hp&#39; ] = parseInt(ret.nEner);
    var aChar = [];

    window.nEner[ ret.sEnerKey ][ &#39;stime&#39; ] = new Date().getTime();
    for(var i in ret.aChar){
      (function(){
        var nIdx = i
          , nSpee = []
          , nAtt = [];

        nSpee[ nIdx ] = parseInt( ret.aChar[ nIdx ].spee ) * 500;
        nAtt[ nIdx ] = parseInt( ret.aChar[ nIdx ].att ) * 10;

        aChar[ nIdx ] = [];

        aChar[ nIdx ][ &#39;intv&#39; ] = setInterval(function(){
          window.nEner[ ret.sEnerKey ][ &#39;hp&#39; ] -= nAtt[ nIdx ];

          if( window.nEner[ ret.sEnerKey ][ &#39;end&#39; ] || ( window.nEner[ ret.sEnerKey ][ &#39;hp&#39; ] - nAtt[ nIdx ] ) &lt; 0 ){
            clearInterval( aChar[ nIdx ][ &#39;intv&#39; ] );

            if(!window.nEner[ ret.sEnerKey ][ &#39;end&#39; ]){
              window.nEner[ ret.sEnerKey ][ &#39;etime&#39; ] = new Date().getTime();
              var sSpendTime = ( window.nEner[ ret.sEnerKey ][ &#39;etime&#39; ] - window.nEner[ ret.sEnerKey ][ &#39;stime&#39; ] ) / Math.floor(1000);
              $( &#39;#p_ener_time&#39; ).html( sSpendTime + &#39; ms&#39; );
            }

            window.nEner[ ret.sEnerKey ][ &#39;end&#39; ] = true;
          }

          $( &#39;#p_user&#39; ).append( nIdx + &quot; Att : &quot; + nAtt[ nIdx ] + &#39;, Speed : &#39; + nSpee[ nIdx ] + &#39;&#39; );
          $( &#39;#p_ener&#39; ).html( window.nEner[ ret.sEnerKey ][ &#39;hp&#39; ] );
        }, nSpee[ nIdx ]);

      })();
    }
  };

  $.post(uApi, {}, function( ret ){
    f( ret );
  }, &#39;json&#39;);

})();
</code></pre>
