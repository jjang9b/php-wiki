<p><strong>[Spring4.0] Gradle Project Init</strong></p>

<p>&nbsp;</p>

<p>Gradle 프로젝트 초기 설치 부터 기본적인 형태 project 구성까지</p>

<p>&nbsp;</p>

<p><strong>1. 설치&nbsp;</strong></p>

<p>&bull; JDK8</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html</p>

<p>&bull; Gradle</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; https://gradle.org/</p>

<p>&bull; Eclipse</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; https://eclipse.org/downloads/</p>

<p>&bull; Eclipse Plugin&nbsp; (Eclipse [Help] &ndash; [Marketplace] 에서 검색 후 설치)</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Gradle IDE Pack</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Gradle Intergration for Eclipse</p>

<p>&nbsp;</p>

<p><strong>2.&nbsp;Gradle 프로젝트 생성</strong></p>

<p>eclipse - New - Project - Gradle Project</p>

<p>&nbsp;</p>

<p><strong>3. build.gradle 필수 요소들 설정</strong></p>

<p>&nbsp;</p>

<pre>
<code class="java">
apply plugin: &#39;java&#39;
apply plugin: &#39;eclipse&#39;
apply plugin: &#39;war&#39;
apply plugin: &#39;spring-boot&#39;
apply plugin: &#39;application&#39;

buildscript {
    repositories {
        mavenLocal()
        mavenCentral()
        maven { url &quot;https://repo.spring.io/libs-release&quot; }
    }
    dependencies {
        classpath(&quot;org.springframework.boot:spring-boot-gradle-plugin:1.1.10.RELEASE&quot;)
        classpath(&quot;org.codehaus.groovy:groovy-eclipse-compiler:2.9.1-01&quot;)
    }
}

mainClassName = &quot;project.MainApplication&quot;

jar {
    manifest {
        attributes &#39;Implementation-Title&#39;: &#39;Push Admin&#39;, &#39;Implementation-Version&#39;: &#39;1.0&#39;
    }
}

repositories {
    mavenCentral()
}

dependencies {   
	// spring
	compile(&quot;org.springframework.boot:spring-boot-starter-web&quot;) {
        //exclude module: &quot;spring-boot-starter-tomcat&quot;
    }
	compile(&quot;org.springframework:spring-context-support&quot;)	
	
	// actuator
    compile(&quot;org.springframework.boot:spring-boot-starter-actuator&quot;)
	
	// database
	compile(&quot;org.springframework:spring-jdbc&quot;)
	compile(&quot;commons-dbcp:commons-dbcp&quot;)
    compile(&quot;mysql:mysql-connector-java:5.1.31&quot;)
    compile(&quot;org.mybatis:mybatis:3.2.7&quot;)
    compile(&quot;org.mybatis:mybatis-spring:1.2.2&quot;)
    
    // log
    compile &quot;ch.qos.logback:logback-classic:1.1.2&quot;
    
    // jsp, jstl
    compile(&quot;org.apache.tomcat.embed:tomcat-embed-jasper&quot;)
    compile(&quot;javax.servlet:jstl&quot;)
    
    // apache common
    compile(&quot;commons-io:commons-io:2.4&quot;)
    compile(&quot;org.apache.commons:commons-csv:1.1&quot;)
    compile(&quot;org.apache.commons:commons-lang3:3.3.2&quot;)
    compile(&quot;org.apache.commons:commons-pool2:2.3&quot;)    
}

test {
    systemProperties &#39;property&#39;: &#39;value&#39;
}

uploadArchives {
    repositories {
       flatDir {
           dirs &#39;repos&#39;
       }
    }
}

</code>

</pre>
