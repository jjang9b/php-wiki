<p><span style="color:#000000"><strong>.bashrc</strong><br />
<br />
export GREP_OPTIONS=&#39;--color=always&#39; GREP_COLOR=&#39;1;32&#39; # grep 색상 설정<br />
<br />
search(){<br />
find ./ -name &#39;*.php&#39; | xargs grep -irn $1 |more<br />
}<br />
<br />
<strong>.vimrc</strong><br />
<br />
map &lt;C-j&gt; :bp &lt;CR&gt;<br />
map &lt;C-k&gt; :bn &lt;CR&gt;<br />
<br />
set ts=2<br />
set expandtab<br />
set cindent<br />
set shiftwidth=2<br />
<br />
set foldmethod=marker<br />
set fdm=marker</span></p>

<p>&nbsp;</p>

<p><span style="color:#000000"><strong>[ .screenrc ]&nbsp;&nbsp; : 스크린 화면 4개 설정</strong><br />
<br />
deflogin&nbsp; off</span></p>

<p><span style="color:#000000">defscrollback 5000</span></p>

<p><span style="color:#000000">vbell off</span></p>

<p>&nbsp;</p>

<p><span style="color:#000000">emulate .logout message</span></p>

<p><span style="color:#000000">pow_detach_msg &quot;Screen session of \$LOGNAME \$:cr:\$:nl:ended.&quot;</span></p>

<p>&nbsp;</p>

<p><span style="color:#000000">detach on hangup</span></p>

<p><span style="color:#000000">autodetach on</span></p>

<p>&nbsp;</p>

<p><span style="color:#000000">bind k</span></p>

<p><span style="color:#000000">#F1~F4</span></p>

<p><span style="color:#000000">bindkey &quot;\033[11~&quot; select 1</span></p>

<p><span style="color:#000000">bindkey &quot;\033[12~&quot; select 2</span></p>

<p><span style="color:#000000">bindkey &quot;\033[13~&quot; select 3</span></p>

<p><span style="color:#000000">bindkey &quot;\033[14~&quot; select 4</span></p>

<p>&nbsp;</p>

<p><span style="color:#000000">#startup screens</span></p>

<p><span style="color:#000000">screen -t &quot;**&quot;&nbsp;&nbsp;&nbsp; 1</span></p>

<p><span style="color:#000000">screen -t &quot;**&quot;&nbsp;&nbsp;&nbsp; 2</span></p>

<p><span style="color:#000000">screen -t &quot;**&quot;&nbsp;&nbsp;&nbsp; 3</span></p>

<p><span style="color:#000000">screen -t &quot;**&quot;&nbsp;&nbsp;&nbsp; 4</span></p>
