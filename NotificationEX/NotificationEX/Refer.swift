//
//  Refer.swift
//  NotificationEX
//
//  Created by 김성호 on 2023/01/13.
//

import Foundation
/*
 
 <>
 
 제가 이번에 담당할 부분은 Notification입니다.
 
 보통 noti라고 이야기하면 크게 2가지로 나눌 수 있습니다.
 1. event를 전달하거나,
 2. 사용자 알림 push를 이야기하거나.
 
 이 중 event를 전달하는 내용을 알려드릴 예정.
 
 
 크게,
 (1) Notification이란 무엇인가에 대한 간단한 개념.
 (2) NotificationCenter
 (2) 사용법
 (3) 어떤 상황에서 사용할지.
 
 
 보통, 우리가 Notification이라고 치면, 상단의 4가지가 나와요.
 <img>
 
 1. Notification
 2. NotificationCenter
 3. NotificationEX
 4. NotificationQueue
 +. UNUserNotificationCenter
 
 이렇게 4가지가 나오는데, 이번에 제가 중점으로 발표할 자료는 1번과 2번입니다.
 
 3번과 4번은 1번과 2번을 먼저 말씀드린 후 간단하게 요약해서 설명드리도록 하겠습니다.
 
 -
 3번: module = (코드를 배포하는 단일 단위)
 4번: Notification은 일반적으로 동기적으로 작용함. 때문에 비동기적으로 처리하고 싶다면 이 method를 사용하면 됨.
 +번: 알림 push를 다루는 method
 -
 
 공식문서의 Notification의 정의를 보면,
 <>
 NotificationCenter를 통해서 등록된 모든 옵저버에게 브로드캐스트 되는 정보를 위한 container, 즉 구조체이다.
 
 라고 되어있습니다.
 
 한마디로 말하면, Center를 통해 / 해당되는 이름을 가진 사람에게 / 정보를 줄 내용을 담는 함수인데
 -> Center를 통해 전달할 수 있으며,
 해당되는 이름을 가진 사람에게,
 그 이름에 맞는 정보를 담는 하나의 바구니라고 생각하시면 될 것 같습니다.
 
 
 해당 구조체는 내부의 3가지 변수를 가지고 있는데,
 <img>
 
 var name: Notification.name
 -> 알림을 식별하는 '태그'
 
 var object: Any?
 -> 발송자가 옵저버에게 보내려고 하는 객체. 주로 발송자 객체를 전달하는데 쓰입니다.
 
 var userInfo: [AnyHashable : Any]?
 -> Notification과 관련된 값 또는 객체의 저장소.
 
 보통 이 3가지 값을 사용하기보다는,
 <img>
 분별을 위해 .Name을 가장 많이 사용하며, 의미는 위에 변수 name과 동일하다고 보시면 되겠습니다.
 
 
 
 
 그럼 두번째로 NotificatonCenter는 무엇일까요?
 <img>
 공식문서에 따르면 등록된 옵저버에게 정보를 알릴 수 있는 '알림 발송 메커니즘'
 이라고 하는데요.
 
 이 메커니즘을 통해 이벤트를 주고 받는 것이라고 생각하시면 될 것 같습니다.
 
 NotificationCenter에는 여러 method가 있는데, 그 중 가장 많이 사용되는 것은.
 <img>
 post, addObserver, removeObserver 3가지가 있으며,
 접근을 하려면 반드시 가운데 default를 붙여줘야한다.
 
 <img>
 (그 이유는? -> default가 notificationcenter 저장 속성인 필수 앱 기본값으로 설정되어 있기 때문)
 
 무튼 이렇게 접근해서 나오는 3가지 method에 대해 살펴보자면,
 
 post : '발송'의 의미인 method입니다.
 느낌을 '지시할게'로 가져가시면 편할 것 같습니다.
 
 addObserver : '관찰자 지정'의 의미인 method입니다.
 느낌을 '지시해줘'로 가져가시면 편합니다.
 
 removeObserver : '관찰자 제거'의 의미인 method입니다.
 우리가 view를 만들고 없앨 때, 메모리에서 해제하는 것까지 생각을 하죠.
 notification도 마찬가지입니다. 동일한 역할이라고 생각하시면 편할 것 같습니다.
 

 
 
 
 위 3가지 method를 기반으로 이제 사용방법을 한번 알아보겠습니다.
 
 <img><gif>
 준비한 내용은 VC 2개이며,
 noti를 통해 VC2 버튼을 누르면, VC1의 backgroundColor를 바꾸는 아주 간단한 code입니다.
 
 (1)
 먼저 보내는 VC 즉, VC2에서 Name을 먼저 설정해줍니다.
 
 <img>
 static으로 써주는 이유:
 해당 property가 instance보다는 type 자체와 연관되어 있다.
 즉, 이것은 단 하나만 존재하고 바로 처리하고 끝내기 위함.
 
 
 (2)
 <img>
 보내는 VC에서 받을 VC로 가는 '경로'에 post를 작성해줍니다.
 
 (3)
 <img>
 받을 VC에서 Observer를 작성합니다.
 
 (4)
 <img>
 받을 VC에서 사용할 함수를 작성해 selector에 등록합니다.
 
 object를 nil로 설정해두면 name에서 설정한 Notification은 어떤 객체가 보내더라도 받을 수 있습니다.
 
 
 (5)
 <img>
 우리는 removeObserver를 사용해서 옵저버를 해제해 메모리에서 내릴 수 있지만, 반드시 그럴 필요는 없습니다.
 (discussion에 의한 내용)
 사실 view자체를 deinit하면 해당 옵저버도 해제되기도 하고,
 이상하게 옵저버 해제에 대한 내용이 많이 없는 것을 보면,
 아마 이런 내용을 기반으로 하고 있기 때문이 아닌가 싶기도 합니다.
 
 
 만약 너무 불안해서 나는 반드시 메모리에서 내리겠다고 생각하신다면,
 viewDidLoad - deinit
 viewWillAppear - viewWillDisappear or viewDidDisapper를
 조합해 사용하시면 됩니다.
 
 이 모든과정이 동기적으로 발생됩니다.
 
 
 
 
 
 
 
 
 
 
 
 3. 어떤 상황에서 사용할까?
 
 1:N인 상황,
 delegate가 먹히지 않는 상황.
 그 외 본인이 편한대로..?
 
 
 
 이제 처음에 나왔던 부분을 다시 살펴보자면,
 4번: Notification은 일반적으로 동기적으로 작용함. 때문에 비동기적으로 처리하고 싶다면 이 method를 사용하면 됨.
 +번: push를 다루는 method
 
 
 
 
 */
