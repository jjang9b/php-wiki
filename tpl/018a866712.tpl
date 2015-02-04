<!DOCTYPE html>
<html>
<head>
</head>
<body>
<span style="color: #993300;"><strong>2. 기본기<br /><br /><br /></strong></span>
<ol>
<li><strong>이미지 예제</strong><br /><br />
<pre><code class="java"><strong>ImageView.java<br /></strong><br />import android.content.Context;<br />import android.graphics.Bitmap;<br />import android.graphics.BitmapFactory;<br />import android.graphics.Canvas;<br />import android.view.View;<br /><br />public class ImageView extends View {<br />  public ImageView(Context context) {<br />    super(context);<br />  }<br /> <br />  @Override<br />  public void onDraw(Canvas canvas){<br />      // 리소스에서 비트맵이미지를 불러와준뒤 화면에 표시해준다. android.png<br />     Bitmap _android = BitmapFactory.decodeResource(getResources(),R.drawable.android);<br />     canvas.drawBitmap(_android, 0, 0, null);<br />  }<br />}<br /><br /><strong>ImageExample.java<br /><br /></strong>import android.app.Activity;<br />import android.os.Bundle;<strong><br /><br /></strong>public class ImageExample extends Activity {<br />  @Override<br />  public void onCreate(Bundle savedInstanceState) {<br />    super.onCreate(savedInstanceState);<br />    setContentView(new ImageView(this));<br />  }<br />}<br /><strong><br /></strong></code></pre>
</li>
<li><span style="color: #333333;">test</span></li>
</ol>
</body>
</html>