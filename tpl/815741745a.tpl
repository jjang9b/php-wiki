<p><strong>1. Serverless API</strong></p>

<p><strong>API Gateway +&nbsp;Lambda(Node.js)&nbsp;+ dynamoDB</strong></p>

<p>&nbsp;</p>

<p><span style="color:#B22222"><strong>1. Lambda - new function</strong></span> ( node-exec : Node.js 4.3 )</p>

<p><span style="color:#B22222"><strong>2. API Gateway</strong></span> - Create API - Setup - Intergration TYpe : 새로 생성한 Lambda function 으로 설정.<br />
해당 API - Action - Deploy API - new Stage<br />
: 내부적으로 생성한 api 를 stage라고 하는 공간으로 deploy를 시켜줘야&nbsp;외부에서 접근 가능.<br />
dns 등 외부에서 aws 내부 api 로 접근하기 위한 설정이 되어 있는 공간을&nbsp;stage로 정의하고 있음.</p>

<p><span style="color:#B22222"><strong>3. 생성 API &nbsp;TEST</strong></span> : Public 오픈된 API 접근 확인.<br />
추가적인 인증을 위해 Authorization / API Key 생성 및 설정.</p>

<p><span style="color:#B22222"><strong>4. DynamoDB - Create table</strong></span> -&nbsp;Primary key 설정.</p>

<p><strong><span style="color:#B22222">5. IAM </span></strong>(<a href="http://docs.aws.amazon.com/ko_kr/IAM/latest/UserGuide/introduction.html">Identity and Access Management</a>) 에서 Lambda를 통해 DynamoDB의 접근 권한 설정.<br />
IAM - Roles - Create New Role - 생성 후 - Inline Policies EX)<br />
&nbsp;</p>

<pre>
<code>{
    &quot;Version&quot;: &quot;2012-10-17&quot;,
    &quot;Statement&quot;: [
        {
            &quot;Effect&quot;: &quot;Allow&quot;,
            &quot;Action&quot;: [
                &quot;lambda:InvokeFunction&quot;
            ],
            &quot;Resource&quot;: [
                &quot;*&quot;
            ]
        },
        {
            &quot;Effect&quot;: &quot;Allow&quot;,
            &quot;Action&quot;: [
                &quot;dynamodb:*&quot;,
                &quot;logs:CreateLogGroup&quot;,
            ],
            &quot;Resource&quot;: &quot;*&quot;
        }
    ]
}
</code></pre>

<p><span style="color:#B22222"><strong>6. Lambda - Configuration - Role - 생성한 IAM Role 선택</strong></span><br />
이제 Lambda 에서 dynamoDB 접근에 필요한 설정 완료됨.</p>

<p>&nbsp;</p>

<pre>
<code>&#39;use strict&#39;;

var AWS = require( &#39;aws-sdk&#39; );
AWS.config.update({&quot;region&quot;: &quot;ap-northeast-1&quot;});
var dynamodb = new AWS.DynamoDB();

exports.handler = (event, context, callback) =&gt; {
    
    var params = {
        TableName: &quot;bbin_dynamo2&quot;,
        Item: {
            &quot;user_seq&quot;:{&quot;N&quot;:&quot;148238923&quot;},
            &quot;user_data&quot;:{
                &quot;M&quot;:{
                    &quot;id&quot;:{&quot;S&quot;:&quot;bbin&quot;},
                    &quot;email&quot;:{&quot;S&quot;:&quot;bbin@test.com&quot;},
                }
                
            }
        }
    };

    /*
    dynamodb.putItem(params, function(err, data) {
       if (err) {
            callback(err);
       } else {
            callback(null, data);
       }
    });
    */
    dynamodb.getItem({
        TableName: &quot;bbin_dynamo2&quot;,
        Key: {
            &quot;user_seq&quot;:{&quot;N&quot;:&quot;148238923&quot;}
        }  
    }, function(err, data) {
       if (err) {
            callback(err);
       } else {
            callback(null, data);
       }
    });
};
</code></pre>

<pre>
@ dynamoDB 자료 구조 형태
<a href="https://docs.aws.amazon.com/ko_kr/amazondynamodb/latest/developerguide/Programming.LowLevelAPI.html">https://docs.aws.amazon.com/ko_kr/amazondynamodb/latest/developerguide/Programming.LowLevelAPI.html
</a>
</pre>

<p><span style="color:#B22222"><strong>7. &nbsp;마지막으로 외부에서 API를 호출</strong></span>을 통해 Lambda function이 호출되며, dynamoDB내용이 리턴되는지 확인.<br />
url : EX)&nbsp;<strong>https://2mjb4ylqvc.execute-api.ap-northeast-1.amazonaws.com/stage1/api</strong><br />
<br />
POST /stage1/api HTTP/1.1<br />
Host: 2mjb4ylqvc.execute-api.ap-northeast-1.amazonaws.com<br />
x-api-key: yhyfrUF9Tl72V5QkDHHPA3j15sH7p5rl1dQGGLmI<br />
Cache-Control: no-cache<br />
<br />
{&quot;test&quot;:2} &nbsp; &nbsp; &lt;= 요 값은 <strong>Lambda 에서 event</strong>를 통해 전달 받는 값.<br />
<br />
<strong>Response</strong><br />
{<br />
&nbsp; &nbsp; &quot;Item&quot;: {<br />
&nbsp; &nbsp; &nbsp; &nbsp; &quot;user_seq&quot;: {<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;N&quot;: &quot;148238923&quot;<br />
&nbsp; &nbsp; &nbsp; &nbsp; },<br />
&nbsp; &nbsp; &nbsp; &nbsp; &quot;user_data&quot;: {<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;M&quot;: {<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;id&quot;: {<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;S&quot;: &quot;bbin&quot;<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; },<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;email&quot;: {<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;S&quot;: &quot;bbin@test.com&quot;</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br />
&nbsp; &nbsp; &nbsp; &nbsp; }<br />
&nbsp; &nbsp; }<br />
}</p>
