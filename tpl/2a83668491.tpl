<p><strong>[웹통신] ssl 방식 웹통신 보안</strong></p>

<ol>
	<li>JavaScript -&gt;&nbsp;PHP
	<ol style="list-style-type:upper-alpha">
		<li>Hello</li>
	</ol>
	</li>
	<li>PHP -&gt;&nbsp;JavaScript
	<ol style="list-style-type:upper-alpha">
		<li>RSA&nbsp;공개키 전달</li>
	</ol>
	</li>
	<li>JavaScript -&gt;&nbsp;PHP
	<ol style="list-style-type:upper-alpha">
		<li>매&nbsp;AJAX&nbsp;전송 시&nbsp;AES&nbsp;비밀키 생성</li>
		<li>전문을&nbsp;AES&nbsp;비밀키로&nbsp;AES&nbsp;암호화</li>
		<li>AES&nbsp;비밀키를&nbsp;RSA&nbsp;공개키로 암호화</li>
		<li>AES&nbsp;암호화문과&nbsp;RSA&nbsp;암호화문을 서버에 전송</li>
	</ol>
	</li>
	<li>PHP&nbsp;-&gt;&nbsp;JavaScript
	<ol style="list-style-type:upper-alpha">
		<li>RSA&nbsp;암호화문이 포함된 전문인 경우&nbsp;RSA&nbsp;비밀키로&nbsp;RSA&nbsp;암호화문을 복호화 하여&nbsp;AES&nbsp;비밀키 획득</li>
		<li>AES&nbsp;암호화문을&nbsp;AES&nbsp;비밀키로 복호화</li>
		<li>서버 프로세스 처리 후&nbsp;Output을&nbsp;AES&nbsp;비밀키로 암호화</li>
		<li>AES&nbsp;암호화된&nbsp;Output을 출력</li>
	</ol>
	</li>
	<li>JavaScript
	<ol style="list-style-type:upper-alpha">
		<li>서버가 회신한&nbsp;AES&nbsp;암호화 출력을&nbsp;AES&nbsp;비밀키로 복호화</li>
	</ol>
	</li>
</ol>

<p>&nbsp;</p>

<ol style="list-style-type:upper-alpha">
	<li>AJAX&nbsp;프로세스 종료</li>
</ol>
