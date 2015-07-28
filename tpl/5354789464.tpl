<!DOCTYPE html>
<html>
<head>
</head>
<body>
<span style="color: #000000;"><strong>.bashrc<br /><br /></strong>export GREP_OPTIONS='--color=always' GREP_COLOR='1;32' # grep 색상 설정</span><br /><br /><span style="color: #000000;">search(){</span><br /><span style="color: #000000;"> find ./ -name '*.php' | xargs grep -irn $1 |more</span><br /><span style="color: #000000;">}<strong><br /><br />.vimrc<br /><br /></strong>map &lt;C-j&gt; :bp &lt;CR&gt;</span><br /><span style="color: #000000;">map &lt;C-k&gt; :bn &lt;CR&gt;</span><br /><br /><span style="color: #000000;">set ts=2</span><br /><span style="color: #000000;">set expandtab</span><br /><span style="color: #000000;">set cindent</span><br /><span style="color: #000000;">set shiftwidth=2</span><br /><br /><span style="color: #000000;">set foldmethod=marker</span><br /><span style="color: #000000;">set fdm=marker<strong><br /></strong></span>
</body>
</html>