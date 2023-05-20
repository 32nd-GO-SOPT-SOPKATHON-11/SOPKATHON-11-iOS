//
//  Home.swift
//  SOPKATHON-11-iOS
//
//  Created by 정채은 on 2023/05/21.
//

import Foundation

// MARK: - Home
struct Home: Codable {
    let code: Int
    let message: String
    let data: [Datum]
    let success: Bool
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let name: String
    let age: Int
    let local: String
    let profileImage: String
}
