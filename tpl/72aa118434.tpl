<p>&nbsp;</p>

<p>&nbsp;</p>

<p><strong><span style="color:#993300">[mssql] index 명령어</span></strong></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<pre>
<span style="font-family:verdana,geneva,sans-serif"><code>-- NONCLUSTERED INDEX 생성
CREATE NONCLUSTERED INDEX &quot;IX_인덱스명&quot; ON &quot;테이블명&quot;( 컬럼명 )

alter table 테이블명 drop index 인덱스명;
alter table 테이블명 add unique index 인덱스명 (인덱스 컬럼들);
</code>
</span></pre>
