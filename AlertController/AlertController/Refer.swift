//
//  Refer.swift
//  AlertController
//
//  Created by 김성호 on 2023/01/11.
//

import Foundation




/*
 (1) custom alert controller

 (2) sheet 방식의 차이.

 (3) style

 (4) 재사용성.


(1) UIView를 생성 - 액션에 원하는 이벤트 연결 후 실행

 
(2)
 uialert이라고 치면,
 controller와 action말고도 uialertview~ 이 내용들은
 swift 2.2 version 이하.
 ios8, 9  이하 때 알람을 만들 때 사용하던 것이여서 지금은 거의 사용을 하지 않는다고 함.


 uialert controller의 파라미터를 보시면, title 내용과 nib내용이 있는데,

 nib내용부터 먼저 설명드리면, 추축으로는 nibfile을 생성해 추가하는 것으로 되는데, 사실 이렇게 하는 것보다, xib을 만들어서 추가하는게 더 낫고, 관련 내용이 전혀 나오지 않더라고요. 그래서 여긴 패스

 가장 많이 쓰이는 title부분을 보시면,
 title과 message는 string을 받는 부분이고,

 preferredStyle부분에서 2가지로 나뉘게 되는데,

(3)
 .alert과 .actionsheet입니다.

 alert은 중앙에 화면을 띄우는 형식
 .actionsheet는 밑에서 올라오는 방식

 action은 버튼을 커스텀해준다 생각하시면 편합니다.
 방식은 present와 동일한 방식으로 되어있어요. 그래서 보시면,
 handler를 써도 되고 안써도 되는 형식으로 되어 있습니다.

 여기도 style에 3가지가 있는데,
 destructive는 현재 색상을 빨간색으로 변경해주고,
 default와 cancel은 동일하시다고 보시면 됩니다.

 단, alert에서만 이고, actionsheet에서는 조금 다르게 나타납니다.

 default는 위로 올라가지만,
 cancel은 하단에 고정.

 
 (4)
 extension 혹은 함수에 저장해서 실행
 
 
 
 */
