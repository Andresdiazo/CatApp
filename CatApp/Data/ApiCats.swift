//
//  NetworkingProvider.swift
//  CatApp
//
//  Created by Andres Diaz Orozco on 30/04/23.
//

import Foundation
import Alamofire

final class ApiCats {
    
    static let shared = ApiCats()
    private let baseUrl = "https://api.thecatapi.com/v1/breeds"
    private let apiKey = "bda53789-d59e-46cd-9bc4-2936630fde39"
    private let statusOk = 200...299
    
    func getBreeds(completion: @escaping ([Cat]?, Error?) -> Void) {
        AF.request(baseUrl, method: .get, headers: ["x-api-key": apiKey])
        .validate(statusCode: statusOk)
        .responseDecodable(of: [Cat].self) { response in
            switch response.result {
            case .success(let responseObj):
                completion(responseObj, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
}
