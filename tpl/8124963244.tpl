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
<code>
apply plugin: 'java'
apply plugin: 'eclipse'
apply plugin: 'war'
apply plugin: 'spring-boot'
apply plugin: 'application'

buildscript {
    repositories {
        mavenLocal()
        mavenCentral()
        maven { url "https://repo.spring.io/libs-release" }
    }
    dependencies {
        classpath("org.springframework.boot:spring-boot-gradle-plugin:1.1.10.RELEASE")
        classpath("org.codehaus.groovy:groovy-eclipse-compiler:2.9.1-01")
    }
}

mainClassName = "project.MainApplication"

jar {
    manifest {
        attributes 'Implementation-Title': 'Push Admin', 'Implementation-Version': '1.0'
    }
}

repositories {
    mavenCentral()
}

dependencies {   
	// spring
	compile("org.springframework.boot:spring-boot-starter-web") {
        //exclude module: "spring-boot-starter-tomcat"
    }
	compile("org.springframework:spring-context-support")	
	
	// actuator
    compile("org.springframework.boot:spring-boot-starter-actuator")
	
	// database
	compile("org.springframework:spring-jdbc")
	compile("commons-dbcp:commons-dbcp")
    compile("mysql:mysql-connector-java:5.1.31")
    compile("org.mybatis:mybatis:3.2.7")
    compile("org.mybatis:mybatis-spring:1.2.2")
    
    // log
    compile "ch.qos.logback:logback-classic:1.1.2"
    
    // jsp, jstl
    compile("org.apache.tomcat.embed:tomcat-embed-jasper")
    compile("javax.servlet:jstl")
    
    // apache common
    compile("commons-io:commons-io:2.4")
    compile("org.apache.commons:commons-csv:1.1")
    compile("org.apache.commons:commons-lang3:3.3.2")
    compile("org.apache.commons:commons-pool2:2.3")    
}

test {
    systemProperties 'property': 'value'
}

uploadArchives {
    repositories {
       flatDir {
           dirs 'repos'
       }
    }
}

</code>

</pre>