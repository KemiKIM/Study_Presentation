//
//  Refer.swift
//  AccessControlEX
//
//  Created by 김성호 on 2023/01/25.
//

import Foundation


/*
 
 
 접근제어란?
 접근제어 레벨에 대해.
 접근제어 레벨에 대한 상세설명.
 접근제어가 필요한 이유
 코드를 구성할 때 어떻게 활용할 수 있을까?
 
 
 
 1.
 Access Control, 접근 제어란, 레벨에 따른 접근도를 제어하는 것을 의미함.

 
 
 2.
 이러한 접근 제어에는 5가지 레벨이 존재하는데,
 
 open, public, internal, fileprivate, private이 있다.
 
 open: module 밖에서도 접근이 가능. 상속과 재정의 가능. ex) FrameWork
 public: module 밖에서도 접근이 가능. 단, 상속과 재정의 불가능. ex) String, Int 등등..
 internal: module 내에서 접근 가능 / default값으로 대부분 생략되어 있음.
 fileprivate: file 내에서만 접근 가능
 private: scope 내에서만 접근 가능.
 
 
 module이란? 흔히 사용하는 라이브러리나 앱 등 import를 통해 사용할 수 있는 외부의 코드를 의미합니다.
 ex) UIKit
 
 
 
 
 3.
 상세설명
 
 
 기본원칙. 타입은 타입을 사용하는 변수(속성)이나, 함수(메서드)보다 높은 수준으로 선언되어야 한다.
 
 
 
 open과 public : 상속과 재정의에 대해.
 String이 재정의나 상속이 가능? -> 불가능. 그런 부분들에 대한 것.
 

 
 
 
 
 
 
 4.
 접근제어가 필요한 이유?
 
 궁극적으로는 코드의 영역을 분리시키기 때문에, 효율적으로 관리가 가능하다.
 코드의 영역을 분리시킨다? -> 컴파일러가 명확하게 구분지을 수 있기 때문에 컴파일 시간이 단축될 수 있다.
 
 
 
 
 
 
 5.
 코드를 구성할 때 어떻게 활용할 수 있을까?
 
 (1) fileprivate과 private keyword를 활용해서 컴파일러에게 더 명확하게 구분짓는다는 걸을 알려주면 비교적 빠르게 컴파일 할 수 있을 것.
 (2) scope를 잘 활용해보세요.
 (3) 구조체와 클래스의 차이를 공부하고 보시면, 좀 더 알맞게 사용하실 수 있을거예요.
 
 
 
 
 
 
 
 */
