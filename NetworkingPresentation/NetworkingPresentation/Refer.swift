//
//  Refer.swift
//  NetworkingPresentation
//
//  Created by 김성호 on 2023/01/29.
//

import Foundation
/*
 
 
 Networking 발표자료

 보통 네트워킹이라고 하면 서버통신을 이야기하는데,
 우리가 현재 restAPI때문에 알고 있는 URLSession을 의미합니다.
 
 큰 틀에서 URLSession에 대한 간단한 이해, 그리고 '왜'에 초점을 맞춰서 발표.
 
 이번 목차는
 
 (1) URLSession이란,

 (2) URLSession을 사용하는 방법.
 
 (3) 일반적으로 shard를 왜 쓸까 (shared의 의미.)
 
 (4) async를 왜 쓸까
 
 (5) Alamofire & Moya
 

 
 
 
 (1) URLSession이란,
 HTTP 통신을 하기 위해 스위프트에 내장되어 있는 라이브러리이며,
 인증 지원을 위한 많은 델리게이트 메서드를 제공하고,
 애플리케이션이 실행 중이지 않거나(not running)
 일시 중단 된 동안 백그라운드 작업(background)에서 서버와 통신 즉, 콘텐츠를 다운로드하고나, 알림을 받는 역할을 수행하기도 합니다.
 앱 생명주기에 대해 미리 알아보신 분들이라면, 속해있는 부분에 대해 조금 더 이해가 쉬울 것이라고 판단합니다.
 
 
 
 URLSession : 관련된 네트워크 데이터 전송 작업 그룹을 조정하는 객체.
 URLSessionConfiguration : URLSession에 대한 동작 및 정책을 정의하는 구성 객체.
 URLSession(configuration: ) : 지정된 세션 구성으로 세션을 생성.



 보통 URLSession은 3가지 유형의 session을 제공하는데,
 urlsession 객체가 소유한 configuration 프로퍼티 객체에 의해 결정됩니다.

 (1) Default - 기본 통신을 할 때 사용 (쿠키와 같은 저장 객체 사용)
 let configration = URLSessionConfiguration.default
 
 (2) Ephemeral - 쿠키나 캐시를 저장하지 않는 정책을 사용할 때 이용
 let configration = URLSessionConfiguration.ephemeral
 
 (3) Background - 앱이 백그라운드 상태에 있을 때 콘텐츠를 다운로드/업로드
 let configration = URLSessionConfiguration.background(withIdentifier: "identifier")

 
 URLSessionConfiguration 객체에서는
 사용자 지정 HTTP 헤더
 시간 제한
 캐싱 정책
 등을 설정할 수 있습니다.





 URLSessionTask
 세션 작업 하나를 나타내는 추상 클래스를 나타냅니다.

 하나의 세션 내에서 urlsession 클래스는 3가지 작업 유형
 (데이터, 업로드, 다운로드)를 지원함.

 데이터: http의 각종 메소드를 이용해 응답 데이터를 받아 데이터 객체를 가져오는 작업을 수행.(CRUD 전부 사용가능, 주로 Get에 사용)

 업로드: 앱에서 웹서버로 데이터 객체 또는 파일 데이터를 업로드하는 작업을 수행.
 (주로 post, put)

 다운로드: 서버로부터 데이터를 다운로드 받아서 파일의 형태로 저장하는 작업을 수행
 백그라운드 상태에서도 다운로드 가능

 json 데이터 등 단순한 데이터 전송에는 주로 데이터 메서드를 활용
 큰 용량 같은 경우는 백그라운드상태에서도 전달할 수 있도록 업로드, 다운로드 메서드를 주로 활용한다.




 
 
 
(2) URLSession을 사용하는 법.



 
 
 
 
 


 (3) 일반적으로 shard를 왜 쓸까 (shared의 의미.)
 
 GET, POST, PUT, DELETE 요청 시, 다시 사용할 수 있는 싱글톤 인스턴스가 있다.
 다른 작업에 동일한 URLSession 인스턴스를 재사용함으로, 다른 작업의 5개 URLSession을 사용하는 것보다 메모리를 덜 차지한다.
 여러 브라우저를 여는 것보다 하나의 브라우저만 열 때 당연히 메모리 소비의 차이가 나기 때문이다.

 때문에 비슷한 작업을 할 때는,
 모든 JSON 호출을 세션으로 그룹화하거나, 파일 다운로드 호출을 다른 세션으로 그룹화 하는 등.
 동일한 URLSession에서 그룹화하는 것이 좋습니다.
 (즉, 웹 요청마다 새로운 URLSession을 생성하는 것은 매우 안 좋다는 말)
 이는 애플 공식 홈페이지 포럼에 나와있는 내용이기도 합니다.
 https://developer.apple.com/forums/thread/84663



 (4) async를 왜 쓸까
 completion 인자로 data와 error를 넘겨주게 된다.
 요청이 성공할 수도 실패할 수도 있기 때문에, 각각 옵셔널 타입이 되고, nil값을 전달한다.
 이런 각각의 경우 에러처리를 하며, nil값을 넘겨주는 작업이 상당히 귀찮아서 Result 타입이 등장한 것이기는 한데,
 근본적인 해결책이 되지 않아서.

 에러처리를 좀 더 쉽게 할 수 있고, 흐름이 좀 더 자연스러운 async를 사용하게 된 것이다.





 
 
 
 
 
 
 (5) Alamofire & Moya
 URLSession 기반으로 구현되어 있는 간편한 라이브러리이다.
 한마디로 정의하면, URLSession을 Wrapping한 라이브러리라고 생각하면 된다.

 Alamofire의 이점은 다음과 같다.

 연결 가능한 Request/Response 메서드
 Combine 지원
 URL / JSON 파라미터 인코딩
 File / Data / Stream / MultipartFormData 업로드
 Request 혹은 Resume Data를 이용한 파일 다운로드
 URLCredential을 통한 인증
 HTTP Response 검증
 Progress를 통한 Progress Closures 업로드 및 다운로드
 cURL Command 출력
 Requests를 동적으로 조정 및 재시도
 TLS 인증서, 공개 키 Pinning
 네트워크 연결성
 광범위한 단위, 통합 테스트 보장


 
 
 그럼 왜 자꾸 Alamofire를 외칠까?
 코드를 더 간결화할 수 있고, 가독성 있게 작성할 수 있기 때문에 Alamofire를 많이 사용한다고 함.
 
 
 
 
 
 Alamofire의 간단 사용법. -> X

 Moya
 Alamofire를 한 번 더 추상화하여 구현시킨 라이브러리.

 */
