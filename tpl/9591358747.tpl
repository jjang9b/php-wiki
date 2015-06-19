<!DOCTYPE html>
<html>
<head>
</head>
<body>
<span style="color: #993300;"><strong>[mssql] identity 속성 제거하기<br /><br /></strong></span>
<pre><code class="sql">
--IDENTITY 컬럼을 가진 원본테이블 생성<br />CREATE TABLE SourceTable<br />(<br /> ID int identity(1,1) NOT NULL,<br /> Name nvarchar(10) NOT NULL<br /> CONSTRAINT PK_SourceTable PRIMARY KEY (ID)<br />);<br /><br /> --데이터 100건 삽입<br />INSERT SourceTable (Name)<br />SELECT TOP 100 REPLICATE('A',10)<br />FROM master.dbo.spt_values;<br /><br /> --원본테이블의 인덱스를 제거한다.<br />ALTER TABLE SourceTable DROP CONSTRAINT PK_SourceTable;<br /><br /> --원본테이블과 같은 스키마의 사본테이블 생성(단, IDENTITY 속성은 제거)<br />CREATE TABLE TargetTable<br />(<br /> ID int NOT NULL,<br /> Name nvarchar(10) NOT NULL<br />);<br /><br /> --파티션 스위치<br />ALTER TABLE dbo.SourceTable SWITCH TO dbo.TargetTable;<br /><br />--원본테이블 제거<br />DROP TABLE SourceTable;<br /><br /> --테이블 이름변경<br />EXEC sp_rename 'TargetTable', 'SourceTable';<br /><br /> --인덱스 생성<br />ALTER TABLE SourceTable ADD CONSTRAINT PK_SourceTable PRIMARY KEY (id);<br /></code></pre>
</body>
</html>