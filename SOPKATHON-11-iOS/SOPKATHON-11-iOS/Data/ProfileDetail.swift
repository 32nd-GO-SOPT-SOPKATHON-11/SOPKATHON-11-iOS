//
//  ProfileDetail.swift
//  SOPKATHON-11-iOS
//
//  Created by 고아라 on 2023/05/21.
//

import UIKit

struct ProfileDetail {
    let name: String
    //let profileImage: String
    let age: Int
    let local: String
    let isMarried: Bool
    let hasChild: Bool
    let hobby: [String]
    let keyword: [String]
}

extension ProfileDetail {
    static func profileDummy() -> [ProfileDetail] {
        return [
            ProfileDetail(name: "고아라", age: 2001, local: "서울", isMarried: true, hasChild: true, hobby: ["스쿼시"], keyword: ["매력적인"])
        ]
    }
}
