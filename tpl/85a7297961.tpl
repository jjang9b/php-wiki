<p><span style="color:#B22222"><strong>2. click 액션</strong></span></p>

<p>&nbsp;</p>

<p>1. res - layout 의 화면 구성에서 버튼 등의 화면 <strong>리소스 파일 위치 후&nbsp;onclick 속성</strong> 지정.</p>

<pre>
<code>2. <strong>java - MainActivity.java&nbsp;</strong>

    /* Naver 링크 */
    public void onButtonNaverClicked(View v){
        Toast.makeText(getApplicationContext(), &quot;onclick naver!&quot;, Toast.LENGTH_LONG).show();
        Intent in = new Intent(Intent.ACTION_VIEW, Uri.parse(&quot;http://www.naver.com&quot;));

        startActivity(in);
    }

    /* 전화 걸기 */
    public void onButtonCallClicked(View v){
        Intent in = new Intent(Intent.ACTION_VIEW, Uri.parse(&quot;tel:010-9696-1073&quot;));
        startActivity(in);
    }
</code></pre>
