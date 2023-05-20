//
//  MatchingSerivce.swift
//  SOPKATHON-11-iOS
//
//  Created by 정채은 on 2023/05/21.
//

import Foundation

import Alamofire

final class MatchingSerivce {
    
    static let shared = MatchingSerivce()
    
    private init() {}
    
    func home(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = Config.baseURL + "/user/matching"
        print(url)
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        
        let dataRequest = AF.request(url,
                                     method: .get,
                                     headers: header)

        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure:
                completion(.networkErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200, 201: return isValidData(data: data)
        case 400, 409: return isValidData(data: data)
        case 500: return .serverErr
        default: return .networkErr
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(Home.self, from: data) else { return .pathErr }
        
        print(decodedData)
        
        return .success(decodedData as Any)
    }
}
