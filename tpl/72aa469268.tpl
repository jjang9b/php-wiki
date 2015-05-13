<!DOCTYPE html>
<html>
<head>
</head>
<body>
<span style="color: #993300;"><strong>[push] push -f 사용법<br /><br /></strong><span style="color: #000000;">특정 branch로 pull 이나 merge 없이 remote쪽으로 교체만을 하고 싶은 경우<br /><br /><strong></strong>push -f 를 이용한다.<br /><br />ex)&nbsp;<br /><br /><strong>master<br /><br />ts&nbsp;<br /><br /></strong>branch 가 있다고 가정할 때 ts 에는 이미 다른 head버전의 브랜치가 올라가져 있고<br />새로운 작업을 위해 <strong>test</strong> branch 를 생성하여 remote push 를 하였다.<br /><br /><strong>master</strong><br /><br /><strong>test</strong><br /><br /><strong>ts<br /><br />그 후 test&nbsp;</strong>버전을 그대로 ts로 교체 해버리고 싶을 경우 (최신 작업 버전은 master에 유지되고 있으니)<br /><br /><strong><span style="color: #993300;">git push -f test:ts</span><br /><br /></strong>를 해주면 test branch 버전이 그대로 ts로 교체되어 remote push가 된다.</span></span>
</body>
</html>