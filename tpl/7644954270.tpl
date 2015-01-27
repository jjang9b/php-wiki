<!DOCTYPE html>
<html>
<head>
</head>
<body>
<span style="color: #993300;"><strong>[ 5. </strong><strong>기타 ]</strong></span>
<ol>
<li><span style="color: #993300;"><strong>SCE(Strict Contextual Escaping)</strong> 을 통한<strong> XSS, 클랙재킹 </strong>등의 보안 대책.<br /><br /></span></li>
<li><strong>jqLite</strong>가 내장되어 있어 기본적인 <span>jQuery </span>함수 사용 가능<span>.<br /><br /></span></li>
<li>controller에 해당되는<span> js</span>의 작성이<span> callback </span>형태로 되어 있어<span>, </span>노출을 원하는 부분은<span> view</span>쪽에 설정해 주고<span>, </span>처리 부분은<span> js</span>에서 인자로 넘겨 받아 처리 요청만 하면 되는 형태<span>. (filter)<br /> ex) </span><span><a href="http://tutorialzine.com/2013/08/learn-angularjs-5-examples/">http://tutorialzine.com/2013/08/learn-angularjs-5-examples/</a></span> ( 4. Instant Search )<br /><br /></li>
<li>AngularJS Hint <br /> - 개발 모범 사례 준수 여부 체크<span><br /> - </span><span><a href="https://github.com/angular/angular-hint">https://github.com/angular/angular-hint</a></span><br /><br />
<pre><code>&lt;script type="text/javascript" src="resources/angularjs/hint.js"&gt;&lt;/script&gt; <br />&lt;html lang="ko" data-ng-app="App" ng-hint&gt;</code></pre>
</li>
</ol>
<ol start="5">
<li>AngularJS 성능 체크<span><br /> -https://chrome.google.com/webstore/detail/angularjs-batarang/ighdmehidhipcmcojjgiloacoafjmpfk<br /> - </span>크롬 익스텐션으로<span> AngularJS </span>탭<span> enable </span>체크<br /><br /></li>
<li><span> </span>3 버전<span> release (</span>성능 향상<span>) <br /> </span><span><a href="http://www.mimul.com/pebble/default/2014/11/11/1415696915837.html">http://www.mimul.com/pebble/default/2014/11/11/1415696915837.html</a></span></li>
</ol>
&nbsp; <br /><span style="color: #993300;"><strong><br /><span style="color: #993300;">[ </span></strong><strong>양방향 바인딩 ]</strong></span> <br /><strong><br /> </strong>AngularJS는<span> dirty-checking</span>라는 방식으로 구현되어 있는데<span>, </span>이것은 바인딩 되는 모든 변수에 대해 특정 시간에 이전 값과 현재 값을 비교하고 값에 변화가 있으면<span> DOM</span>을 갱신하는 구조이다<span>.</span><br /> <br /> 이를 순차적으로 기술해 보면<br /> - HTML을 분석하여 지시문<span>(directive)</span>을 컴파일할 때 바인딩되는 변수를<span> $scope.$watch()</span>로 등록한다<span>.</span><br /> - $rootScope 자식들의<span> scope</span>를 차례로 검색해<span>, watch</span>에 등록된 모든 변수의 변경 검사를 수행한다<span>. </span>이 과정을<span> $digest </span>루프라고 부르고<span>, </span>아래와 같은 타이밍에서 실행된다<span>.(</span>정기적인 폴링은하지 않습니다<span>)</span><br />
<ul>
<li>$scope.$apply()를 부를 때<span>.</span></li>
<li>DOM 이벤트<span> (onChange, onClick </span>등<span>)</span>가 발생한 후<span>.</span></li>
<li>$http와<span> $resource</span>에서 응답이 돌아왔을 경우<span>.</span></li>
<li>$location에서<span> URL</span>을 변경한 후<span>.</span></li>
<li>$timeout이벤트가 발생한 후<span>.</span></li>
</ul>
- 변경 검사가 완료되면 변경된 부분의<span> DOM</span>을 다시 시작한다<span>.</span> <strong>&nbsp;</strong> <br /><br /><br /><span style="color: #993300;"><strong>[ </strong></span><strong><span style="color: #993300;">출처 및 참고</span><span><span style="color: #993300;"> ]</span> <br /> <br /> </span></strong>- <span><a href="http://www.mimul.com/pebble/default/2014/09/14/1410669616494.html">http://www.mimul.com/pebble/default/2014/09/14/1410669616494.html</a></span><strong><br /> - </strong><span><a href="http://blog.outsider.ne.kr/975">http://blog.outsider.ne.kr/975</a></span><br /> - <span><a href="http://programmingsummaries.tistory.com/category/AngularJS">http://programmingsummaries.tistory.com/category/AngularJS</a></span><span><br /> - </span><span><a href="http://mobicon.tistory.com/328">http://mobicon.tistory.com/328</a></span>
</body>
</html>