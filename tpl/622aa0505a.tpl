<!DOCTYPE html>
<html>
<head>
</head>
<body>
<span style="color: #993300;"><span style="color: #993300;"><strong>2. 기본기 - 사운드<br /><br /><br /></strong></span></span>
<pre><code class="java">m_SoundPool = new SoundPool(5, AudioManager.STREAM_MUSIC, 0);<br /> <br />// MediaPlayer를 이용해서 리소스들을 로드한다.<br />m_Sound_BackGround = MediaPlayer.create(context,R.raw.background);<br />m_Sound_1 = MediaPlayer.create(context,R.raw.effect1);<br />m_Sound_2 = MediaPlayer.create(context,R.raw.effect2);<br /> <br />// SoundPool 을 이용해서 리소스들을 로드한다.<br />m_Sound_id_BackGround = m_SoundPool.load(context,R.raw.background,1);<br />m_Sound_id_1 = m_SoundPool.load(context,R.raw.effect1,1);<br />m_Sound_id_2 = m_SoundPool.load(context,R.raw.effect2,1);<br /> <br />// 배경음악 재생<br />m_Sound_BackGround.start();</code></pre>
</body>
</html>