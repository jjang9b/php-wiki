<!DOCTYPE html>
<html>
<head>
</head>
<body>
<span style="color: #993300;"><strong>[Mssql] 중첩 SP Lock 체크</strong></span><br /><br />
<ul style="list-style-type: disc;">
<li>전제 : USP_A 라는 SP에서 중첩 USP_B 라는 SP를 호출했을 때&nbsp;<br />USP_B SP 자체의 트랜잭션과 USP_B 내부 쿼리들에 대한 Lock 이 제대로 잡히는지 확인</li>
</ul>
<br />
<pre><code class="sql">ALTER PROCEDURE [USP_A]<br /><br />AS<br />BEGIN<br />&nbsp; SET NOCOUNT ON;<br />&nbsp; SET TRANSACTION ISOLATION LEVEL READ COMMITTED; -- read Lock<br /><br />  DECLARE @RET INT<br /><br />&nbsp; BEGIN TRY<br />&nbsp;&nbsp;<br />&nbsp; &nbsp;EXEC [USP_B] &nbsp;@RET OUTPUT<br /><br />&nbsp; END TRY<br /><br />&nbsp; BEGIN CATCH<br />&nbsp; &nbsp; ROLLBACK TRAN<br />&nbsp; END CATCH
</code></pre>
<br /><br />
<pre><code class="sql">ALTER PROCEDURE [USP_B]<br />  @RET INT OUTPUT<br />AS<br />BEGIN<br />  SET NOCOUNT ON;<br />  <br />  SET @RET = 0<br /><br />  IF( EXISTS( SELECT * FROM 테이블 WITH(UPDLOCK) ) )     ;-- ROW 행에 대한 Lock<br />    BEGIN<br />      UPDATE 테이블 SET 조건<br />      @RET = 1<br />    END<br />  END</code></pre>
<br /><br />의 예제로 설정된 이후 동시 <span style="color: #993300;"><strong>EXEC [USP_A]&nbsp;</strong><span style="color: #000000;">를 다수의 창으로 실행 했을 경우&nbsp;<br /></span></span><br />
<pre><code class="sql">exec sp_lock<br />dbcc inputbuffer(spid)<br /></code></pre>
<br />spid를 통해 lock 을 확인해 보면 해당 <strong>EXEC [USP_A] </strong>에 대한 Lock 을 확인할 수 있으며,&nbsp;<br />( Mode 가 X, IX의 경우)<br />내부 USP_B 의 Row Lock에 대해서는 Update를 통해 확인해 볼 수 있다.<br /><br />동시에 다수 sp가 실행되더라도 제일 처음 lock을 잡은 sp에서 조건에 대해 수행을 하며 update를 진행하며,&nbsp;<br />나머지 sp는 해당 테이블 row에 대한 접근 대기 상태이다.<br /><br />이후 첫번째 sp가 실행 완료되게 되면 특정 조건을 update하게 되므로 나머지 sp들은 [USP_B] 의 조건에 접근하지&nbsp;<br />못하게 된다.<br /><br /><strong>결국 중첩 SP 내에서의 Lock 정상 확인!</strong>
</body>
</html>