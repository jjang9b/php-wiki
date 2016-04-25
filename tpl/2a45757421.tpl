<p><strong>[모니터링] VisualVM remote</strong></p>

<p>&nbsp;</p>

<p>1. 원격 대상 서버 jstatd 실행</p>

<p>jstatd -J-Djava.security.policy=/패스/jstatd.all.policy -J-Djava.rmi.server.hostname=서버정보&nbsp;-p포트</p>

<p>- jstatd.all.policy 파일<br />
grant codebase &quot;file:/usr/java/jdk1.8.0_65/lib/tools.jar&quot; {</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; permission java.security.AllPermission;</p>

<p>};</p>

<p>&nbsp;</p>

<p>2. VisualVm 에서 jstatd 정보 설정</p>
