<!DOCTYPE html>
<html>
<head>
</head>
<body>
<span style="color: #993300;"><span style="color: #993300;"><strong>[모바일] 구글 결제<br /><br /><br /><span style="color: #333333;">구글 계정 획득<br /><br /></span></strong></span></span>
<pre><code>&lt;uses-permission android:name="android.permission.GET_ACCOUNTS" /&gt;<br /><br /><br />import android.accounts.Account; <br />import android.accounts.AccountManager; <br /><br />AccountManager manager = AccountManager.get(this); <br />Account[] accounts = manager.getAccountsByType("com.google");<br /><br /> if (accounts != null) { <br /> //accounts[0].name;  //계정 이름 획득<br />}</code></pre>
</body>
</html>