<p><strong>[Tip] log페이지 php</strong></p>

<p>&lt;?php<br />
$aLogDirList = array();<br />
$sLogPath = &#39;/home/hosting_users/musiqqq/www&#39;;<br />
$sUrl = &#39;/admin/log.php&#39;;<br />
$sLogFile = &#39;log.php&#39;;</p>

<p>$aPath[0][&#39;name&#39;] = &#39;log&#39;;<br />
$aPath[0][&#39;url&#39;] = $sUrl;</p>

<p>$param = array_filter(explode(&#39;/&#39;, $_SERVER[&#39;PHP_SELF&#39;]));</p>

<p>for($a=0, $b=count($param);$a&lt;=$b;$a++)<br />
{<br />
&nbsp; if($param[$a] == $sLogFile)<br />
&nbsp; {<br />
&nbsp; &nbsp; array_splice($param, 0, $a);<br />
&nbsp; }<br />
}</p>

<p>for($i=0, $j=count($param); $i&lt;$j; $i++)<br />
{<br />
&nbsp; $sDirName= $param[$i];<br />
&nbsp; $sUrl = $sUrl.&#39;/&#39;.$sDirName;</p>

<p>&nbsp; $aPath[$i+1][&#39;name&#39;] = $sDirName;<br />
&nbsp; $aPath[$i+1][&#39;url&#39;] = $sUrl;<br />
}</p>

<p>if(count($aPath) &gt; 0)<br />
{<br />
&nbsp; for($q=0, $w=count($aPath); $q&lt;$w; $q++)<br />
&nbsp; {<br />
&nbsp; &nbsp; $sLogPath = $sLogPath.&#39;/&#39;.$aPath[$q][&#39;name&#39;];<br />
&nbsp; }<br />
}</p>

<p>if(is_dir($sLogPath)){<br />
&nbsp; $aScanDir = array_diff(scandir($sLogPath), array(&#39;..&#39;, &#39;.&#39;));</p>

<p>&nbsp; sort($aScanDir);</p>

<p>&nbsp; for($a=0, $b=count($aScanDir); $a&lt;$b; $a++)<br />
&nbsp; {<br />
&nbsp; &nbsp; $aLogDirList[$a][&#39;name&#39;] = $aScanDir[$a];<br />
&nbsp; &nbsp; $aLogDirList[$a][&#39;isDir&#39;] = is_dir($sLogPath.&#39;/&#39;.$aScanDir[$a]);<br />
&nbsp; }<br />
}</p>

<p>$aLogDirList=$aLogDirList;<br />
$oLogData=file_get_contents($sLogPath);<br />
$aCurPath=$aPath;<br />
?&gt;<br />
&lt;!DOCTYPE&gt;<br />
&lt;html&gt;<br />
&lt;head&gt;<br />
&lt;meta charset=&quot;utf-8&quot;&gt;<br />
&lt;style&gt;<br />
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);</p>

<p>body {<br />
&nbsp; background: #fff;<br />
&nbsp; color: #000;<br />
&nbsp; font-size: 11.5pt;<br />
&nbsp; line-height: 150%;<br />
&nbsp; font-family: &#39;jeju gothic&#39;;<br />
&nbsp; overflow-x:hidden;<br />
&nbsp; margin:1em 0 0 3em;<br />
}<br />
img {width:1em;height:1em;}</p>

<p>.title { position:relative;float:left;height:2.5em;margin: 2em 0 0em 0;}<br />
.path { position:relative;float:left;clear:both;height:2.5em; margin: 1em 0 0 0;}<br />
.path ul{list-style:none;margin:0;padding:0;}<br />
.path ul li{margin:0; padding:0; border:0; float:left;}<br />
.view { position:relative;float:left;clear:both;height:100%; font-size: 10.5pt;}<br />
.view ul{ list-style:none; padding-left:0px;}<br />
.view ul li{ margin:0 0 0.5em 0;}<br />
&lt;/style&gt;<br />
&lt;script type=&quot;text/javascript&quot; src=&quot;/res/js/jquery.min.js&quot;&gt;&lt;/script&gt;<br />
&lt;script&gt;<br />
&lt;/script&gt;<br />
&lt;/head&gt;<br />
&lt;body&gt;<br />
&nbsp; &lt;div class=&quot;title&quot;&gt;Log. &lt;/div&gt;<br />
&nbsp; &lt;div class=&quot;path&quot;&gt;<br />
&nbsp; &lt;?php if($aCurPath){?&gt;<br />
&nbsp; &nbsp; &lt;ul&gt;<br />
&nbsp; &nbsp; &lt;?php foreach($aCurPath as $v){ ?&gt;<br />
&nbsp; &nbsp; &nbsp; &lt;li name=&quot;c_li_top_path&quot; data-path=&quot;&lt;?= $v[&#39;url&#39;] ?&gt;&quot;&gt;&lt;?= $v[&#39;name&#39;] ?&gt;&lt;/li&gt;&lt;li&gt;&amp;nbsp; &gt; &amp;nbsp;&lt;/li&gt;<br />
&nbsp; &nbsp; &lt;?php } ?&gt;<br />
&nbsp; &nbsp; &lt;/ul&gt;<br />
&nbsp; &lt;?php } ?&gt;<br />
&nbsp; &lt;/div&gt;</p>

<p>&nbsp; &lt;div class=&quot;view&quot;&gt;<br />
&nbsp; &lt;?php if(!$oLogData &amp;&amp; $aLogDirList){?&gt;<br />
&nbsp; &nbsp; &lt;ul&gt;<br />
&nbsp; &nbsp; &lt;?php<br />
&nbsp; &nbsp; foreach($aLogDirList as $v)<br />
&nbsp; &nbsp; {<br />
&nbsp; &nbsp; ?&gt;<br />
&nbsp; &nbsp; &lt;li name=&quot;c_li_dir&quot; data-dir=&quot;&lt;?= $v[&#39;name&#39;] ?&gt;&quot;&gt;<br />
&nbsp; &nbsp; &lt;?php if($v[&#39;isDir&#39;]){ ?&gt;<br />
&nbsp; &nbsp; &nbsp; &lt;b&gt;FD&lt;/b&gt; &amp;nbsp;<br />
&nbsp; &nbsp; &nbsp; &lt;?php } else { ?&gt;<br />
&nbsp; &nbsp; &nbsp; &lt;b&gt;F&lt;/b&gt; &amp;nbsp;<br />
&nbsp; &nbsp; &lt;?php }?&gt;<br />
&nbsp; &nbsp; &lt;?= $v[&#39;name&#39;] ?&gt;&lt;/li&gt;<br />
&nbsp; &nbsp; &lt;?php<br />
&nbsp; &nbsp; }<br />
&nbsp; &nbsp; ?&gt;<br />
&nbsp; &nbsp; &lt;/ul&gt;</p>

<p>&nbsp; &lt;?php } else { ?&gt;<br />
&lt;pre&gt;&lt;?= $oLogData ?&gt;<br />
&lt;/pre&gt;<br />
&nbsp; &lt;?php }?&gt;</p>

<p>&nbsp; &lt;/div&gt;<br />
&lt;/body&gt;<br />
&lt;/html&gt;<br />
&lt;script&gt;<br />
&quot;use strict&quot;;</p>

<p>$(function(){<br />
&nbsp; var lo = location.href;</p>

<p>&nbsp; $( &#39;li[name=c_li_top_path]&#39; ).css( &#39;cursor&#39;, &#39;pointer&#39; );<br />
&nbsp; $( &#39;li[name=c_li_dir]&#39; ).css( &#39;cursor&#39;, &#39;pointer&#39; );</p>

<p>&nbsp; $( &#39;li[name=c_li_dir]&#39; ).click(function(){<br />
&nbsp; &nbsp; var dir = $(this).data( &#39;dir&#39; );</p>

<p>&nbsp; &nbsp; $(location).attr( &#39;href&#39;, lo + &#39;/&#39; + dir );<br />
&nbsp; &nbsp; });</p>

<p>&nbsp; $( &#39;li[name=c_li_top_path]&#39; ).click(function(){<br />
&nbsp; &nbsp; var path = $(this).data( &#39;path&#39; );</p>

<p>&nbsp; &nbsp; $(location).attr( &#39;href&#39;, path );<br />
&nbsp; });<br />
});<br />
&lt;/script&gt;<br />
&nbsp;</p>
