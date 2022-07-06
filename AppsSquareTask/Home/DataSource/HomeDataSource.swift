//
//  HomeDataSource.swift
//  AppsSquareTask
//
//  Created by Zaki on 06/07/2022.
//

import Foundation
import Alamofire

class HomeDataSource {
    
    func GetMyProducts(isSucess : @escaping(HomeResponse?) -> Void , isError : @escaping (String) -> Void ){
        
        let myProductsRequest = AuthenticationRouter.GetMyProducts
        
        AF.request(myProductsRequest).responseDecodable { (response: DataResponse<HomeResponse, AFError>) in
            switch response.result {
            case let .success(data):
                isSucess(data)
                
            case let .failure(error):
                print(error.localizedDescription)
                isError("UnknownError")
            }
        }
    }
}
