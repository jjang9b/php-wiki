<p><span style="color:#B22222"><strong>[Chrome] 206 partial content</strong></span></p>

<p>&nbsp;</p>

<p>크롬 자체에서 mp4와 같은 content를 다운받을 때 <strong>http request&nbsp;header 의 Range&nbsp;</strong>를 통해&nbsp;</p>

<p>원하는 범위만큼을 요청 한 후&nbsp;</p>

<p><strong>status code 206</strong> 상태인 partial content 를 통해 해당 content를 나누어서 받게 된다.</p>

<p>근데 간혹 해당 content를 로딩하지 못하는 경우가 발생하는데, 여러가지 원인이 있을 수 있다.</p>

<p>한가지는 <strong>status code 200 의 no-cache</strong> 상태에서&nbsp;<strong>http request&nbsp;header 의 Range 를&nbsp;</strong></p>

<p>해당 content의 끝지점을 요청하는 경우가 있었다. ex) status code 200, Requst&nbsp;Range: bytes = 7832872-78502382</p>

<p>당연히 206상태가 아니어서 부분부분 나누어 받지 않는데 해당 content의 끝부분만을 요청범위로 잡으니</p>

<p>해당 mp4 는 로딩되지 않은 상태로 머물러 있었다.</p>

<p>nginx 등의 웹서버 상에서 range 설정 등의 방법이 있으나</p>

<p>apache를 사용중이었고,&nbsp;video 태그의 source src 로 바로 입력이 되는 경우라 request의 header를 접근할 수도 없었다.</p>

<p>&nbsp;</p>

<p>결국, 일정 주기로 해당 video 의 dom 객체를 잡아 <strong>readyState&nbsp;</strong>를 확인하여 0인 경우 (로딩실패) mp4를 대신할</p>

<p>배경이미지를 노출한 후&nbsp;<strong>mp4를 재 로딩 및 재생 처리</strong>를 하였다.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
