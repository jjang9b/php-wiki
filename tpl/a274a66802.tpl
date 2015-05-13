<!DOCTYPE html>
<html>
<head>
</head>
<body>
<strong><strong><span style="color: #993300;">[Tip] 로그 페이지<br /><br /><br /><span style="color: #000000;">class</span><br /><br /></span></strong></strong>
<pre><code class="php">public function getLog()<br /> {<br /> $aLogDirList = array();<br /> $sLogPath = APPPATH;<br /> $sUrl = '/couponapiLog/getLog';<br /><br /> $aPath[0]['name'] = 'logs';<br /> $aPath[0]['url'] = $sUrl;<br /><br /> for($i=0, $j=func_num_args(); $i&lt;$j; $i++)<br /> {<br /> $sDirName= func_get_arg($i);<br /> $sUrl = $sUrl.'/'.$sDirName;<br /><br /> $aPath[$i+1]['name'] = $sDirName;<br /> $aPath[$i+1]['url'] = $sUrl;<br /> }<br /><br /> if(count($aPath) &gt; 0)<br /> {<br /> for($q=0, $w=count($aPath); $q&lt;$w; $q++)<br /> {<br /> $sLogPath = $sLogPath.'/'.$aPath[$q]['name'];<br /> }<br /> }<br /><br /> if(is_dir($sLogPath)){<br /> $aScanDir = array_diff(scandir($sLogPath), array('..', '.'));<br /><br /> sort($aScanDir);<br /><br /> for($a=0, $b=count($aScanDir); $a&lt;$b; $a++)<br /> {<br /> $aLogDirList[$a]['name'] = $aScanDir[$a];<br /> $aLogDirList[$a]['isDir'] = is_dir($sLogPath.'/'.$aScanDir[$a]);<br /> }<br /> }<br /><br /> $aViewData = array(<br /> 'aLogDirList'=&gt;$aLogDirList,<br /> 'oLogData'=&gt;file_get_contents($sLogPath),<br /> 'sServerIp'=&gt;$_SERVER['SERVER_ADDR'],<br /> 'aCurPath'=&gt;$aPath<br /> );<br /><br /> $this-&gt;load-&gt;view('log/systemLog', $aViewData);<br /> }</code></pre>
<br /><br /><br /><strong>view<br /><br /></strong>
<pre><code>&lt;html&gt;<br />&lt;head&gt;<br /> &lt;meta charset="utf-8"&gt;<br /> &lt;link rel="stylesheet" href="/res/css/couponLog.css" /&gt;<br /> &lt;script type="text/javascript" src="/res/js/jquery.min.js"&gt;&lt;/script&gt;<br /> &lt;script type="text/javascript" src="/res/js/couponLog.js"&gt;&lt;/script&gt;<br />&lt;/head&gt;<br />&lt;body&gt;<br /> &lt;div class="title"&gt;Coupon Log. &lt;/div&gt;<br /> &lt;div class="path"&gt;<br />&lt;?php if($aCurPath){?&gt;<br /> &lt;ul&gt;<br />&lt;?php foreach($aCurPath as $v){ ?&gt;<br /> &lt;li name="c_li_top_path" data-path="&lt;?= $v['url'] ?&gt;"&gt;&lt;?= $v['name'] ?&gt;&lt;/li&gt;&lt;li&gt;&amp;nbsp; &gt; &amp;nbsp;&lt;/li&gt;<br />&lt;?php } ?&gt;<br /> &lt;/ul&gt;<br />&lt;?php } ?&gt;<br /> &lt;/div&gt;<br /><br /> &lt;div class="view"&gt;<br />&lt;?php if(!$oLogData &amp;&amp; $aLogDirList){?&gt;<br /> &lt;ul&gt;<br />&lt;?php<br />foreach($aLogDirList as $v)<br />{<br />?&gt;<br /> &lt;li name="c_li_dir" data-dir="&lt;?= $v['name'] ?&gt;"&gt;<br />&lt;?php if($v['isDir']){ ?&gt;<br /> &lt;img src="/res/img/fd.png" /&gt;&amp;nbsp;<br />&lt;?php } else { ?&gt;<br /> &lt;img src="/res/img/file.png" /&gt;&amp;nbsp;<br />&lt;?php }?&gt;<br /> &lt;?= $v['name'] ?&gt;&lt;/li&gt;<br />&lt;?php<br />}<br />?&gt;<br /> &lt;/ul&gt;<br /><br />&lt;?php } else { ?&gt;<br />&lt;pre&gt;&lt;?= $oLogData ?&gt;<br />&lt;/pre&gt;<br />&lt;?php }?&gt;<br /><br /> &lt;/div&gt;<br />&lt;/body&gt;<br />&lt;/html&gt;</code></pre>
<strong><strong><br /><br /><br />css<br /><br /></strong></strong>
<pre><code>@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);<br /><br />body {<br />background: #fff;<br />color: #000;<br />font-size: 11.5pt;<br />line-height: 150%;<br />font-family: 'jeju gothic';<br />overflow-x:hidden;<br />margin:1em 0 0 3em;<br />}<br />img {width:1em;height:1em;}<br /><br />.title { position:relative;float:left;height:2.5em;margin: 2em 0 0em 0;}<br />.path { position:relative;float:left;clear:both;height:2.5em; margin: 1em 0 0 0;}<br />.path ul{list-style:none;margin:0;padding:0;}<br />.path ul li{margin:0; padding:0; border:0; float:left;}<br />.view { position:relative;float:left;clear:both;height:100%; font-size: 10.5pt;}<br />.view ul{ list-style:none; padding-left:0px;}<br />.view ul li{ margin:0 0 0.5em 0;}<br /><br /><br />js<br /><br />"use strict";<br /><br />$(function(){<br /> var lo = location.href;<br /><br /> $( 'li[name=c_li_top_path]' ).css( 'cursor', 'pointer' );<br /> $( 'li[name=c_li_dir]' ).css( 'cursor', 'pointer' );<br /><br /> $( 'li[name=c_li_dir]' ).click(function(){<br /> var dir = $(this).data( 'dir' );<br /><br /> $(location).attr( 'href', lo + '/' + dir );<br /> });<br /><br /> $( 'li[name=c_li_top_path]' ).click(function(){<br /> var path = $(this).data( 'path' );<br /><br /> $(location).attr( 'href', path );<br /> });<br />});<br /></code></pre>
</body>
</html>