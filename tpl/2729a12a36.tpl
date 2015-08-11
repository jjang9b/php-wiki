<p><strong>[mysql] 유저 생성</strong></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<pre><code class="sql">
use test;

create user 'dev_test1'@'%' identified by 'test&';
create user 'dev_test2'@'%' identified by 'test123';

grant  all privileges on test.* to 'dev_test1'@'%';
grant  all privileges on test.* to 'dev_test2'@'%';

grant all privileges on *.* to 'dev_test1'@'localhost';

select * from mysql.user where user='dev_test1';

update mysql.user set password = password("test123") where user='dev_test1';

FLUSH PRIVILEGES;
</code></pre>