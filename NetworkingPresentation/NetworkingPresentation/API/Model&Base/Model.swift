//
//  Model.swift
//  NetworkingPresentation
//
//  Created by 김성호 on 2023/01/29.
//

import UIKit


struct TodosModelGeneric<T: Codable>: Codable {
    let data: [T]?
    let meta: Meta?
    let message: String?
}



// MARK: - TodosResponse
struct TodosModel: Codable {
    let data: [Todo]?
    let meta: Meta?
    let message: String?
}


// MARK: - Todo
struct Todo: Codable {
    let id: Int?
    let title: String?
    let isDone: Bool?
    let createdAt, updatedAt: String?

    
    enum CodingKeys: String, CodingKey {
        case id, title
        case isDone = "is_done"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}



enum Title: String, Codable {
    case codeCodeCode = "code code code"
    case 할일을입력해주세요 = "할일을 입력해주세요"
}



// MARK: - Meta
struct Meta: Codable {
    let currentPage, from, lastPage, perPage: Int?
    let to, total: Int?

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case from
        case lastPage = "last_page"
        case perPage = "per_page"
        case to, total
    }
}


