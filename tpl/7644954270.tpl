<!DOCTYPE html>
<html>
<head>
</head>
<body>
<span style="color: #333333;"><strong>[ 5. </strong><strong>기타 ]</strong></span>
<ol>
<li><span style="color: #333333;"><strong>SCE(Strict Contextual Escaping)</strong> 을 통한<strong> XSS, 클랙재킹 </strong>등의 보안 대책.<br /><br /></span></li>
<li><span style="color: #333333;"><strong>jqLite</strong>가 내장되어 있어 기본적인 jQuery 함수 사용 가능.<br /><br /></span></li>
<li><span style="color: #333333;">controller에 해당되는 js의 작성이 callback 형태로 되어 있어, 노출을 원하는 부분은 view쪽에 설정해 주고, 처리 부분은 js에서 인자로 넘겨 받아 처리 요청만 하면 되는 형태. (filter)<br /> ex) <a href="http://tutorialzine.com/2013/08/learn-angularjs-5-examples/" style="color: #333333;">http://tutorialzine.com/2013/08/learn-angularjs-5-examples/</a> ( 4. Instant Search )</span><br /><br /></li>
<li><span style="color: #333333;">AngularJS Hint </span><br /><span style="color: #333333;"> - 개발 모범 사례 준수 여부 체크<br /> - <a href="https://github.com/angular/angular-hint" style="color: #333333;">https://github.com/angular/angular-hint</a></span><br /><br />
<pre><span style="color: #333333;"><code>&lt;script type="text/javascript" src="resources/angularjs/hint.js"&gt;&lt;/script&gt; <br />&lt;html lang="ko" data-ng-app="App" ng-hint&gt;</code></span></pre>
</li>
</ol>
<ol start="5">
<li><span style="color: #333333;">AngularJS 성능 체크<br /> -https://chrome.google.com/webstore/detail/angularjs-batarang/ighdmehidhipcmcojjgiloacoafjmpfk<br /> - 크롬 익스텐션으로 AngularJS 탭 enable 체크</span><br /><br /></li>
<li><span style="color: #333333;"> 3 버전 release (성능 향상) <br /> <a href="http://www.mimul.com/pebble/default/2014/11/11/1415696915837.html" style="color: #333333;">http://www.mimul.com/pebble/default/2014/11/11/1415696915837.html</a></span></li>
</ol>
<span style="color: #333333;">&nbsp; </span><br /><span style="color: #333333;"><strong><br />[ </strong><strong>양방향 바인딩 ]</strong> </span><br /><span style="color: #333333;"><strong><br /> </strong>AngularJS는 dirty-checking라는 방식으로 구현되어 있는데, 이것은 바인딩 되는 모든 변수에 대해 특정 시간에 이전 값과 현재 값을 비교하고 값에 변화가 있으면 DOM을 갱신하는 구조이다.</span><br /> <br /><span style="color: #333333;"> 이를 순차적으로 기술해 보면</span><br /><span style="color: #333333;"> - HTML을 분석하여 지시문(directive)을 컴파일할 때 바인딩되는 변수를 $scope.$watch()로 등록한다.</span><br /><span style="color: #333333;"> - $rootScope 자식들의 scope를 차례로 검색해, watch에 등록된 모든 변수의 변경 검사를 수행한다. 이 과정을 $digest 루프라고 부르고, 아래와 같은 타이밍에서 실행된다.(정기적인 폴링은하지 않습니다)</span><br />
<ul>
<li><span style="color: #333333;">$scope.$apply()를 부를 때.</span></li>
<li><span style="color: #333333;">DOM 이벤트 (onChange, onClick 등)가 발생한 후.</span></li>
<li><span style="color: #333333;">$http와 $resource에서 응답이 돌아왔을 경우.</span></li>
<li><span style="color: #333333;">$location에서 URL을 변경한 후.</span></li>
<li><span style="color: #333333;">$timeout이벤트가 발생한 후.</span></li>
</ul>
<span style="color: #333333;">- 변경 검사가 완료되면 변경된 부분의 DOM을 다시 시작한다. <strong>&nbsp;</strong> </span><br /><br /><br /><span style="color: #333333;"><strong>[ </strong><strong>출처 및 참고 ] <br /> <br /> </strong>- <a href="http://www.mimul.com/pebble/default/2014/09/14/1410669616494.html" style="color: #333333;">http://www.mimul.com/pebble/default/2014/09/14/1410669616494.html</a><strong><br /> - </strong><a href="http://blog.outsider.ne.kr/975" style="color: #333333;">http://blog.outsider.ne.kr/975</a></span><br /><span style="color: #333333;"> - <a href="http://programmingsummaries.tistory.com/category/AngularJS" style="color: #333333;">http://programmingsummaries.tistory.com/category/AngularJS</a><br /> - <a href="http://mobicon.tistory.com/328" style="color: #333333;">http://mobicon.tistory.com/328</a></span>
</body>
</html>