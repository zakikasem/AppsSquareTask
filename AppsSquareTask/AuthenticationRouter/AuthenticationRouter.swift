//
//  AuthenticationRouter.swift
//  AppsSquareTask
//
//  Created by Zaki on 06/07/2022.
//

import Foundation
import Alamofire

enum AuthenticationRouter : URLRequestConvertible {
  
    case GetMyProducts
    
    
    var url: URL {
        switch self {
        
        case .GetMyProducts:
          //  return URL(string : "We Put Our URL Here")!
            return URL(string : "www.gfddd.com")!
            
            
        }

   
    }
    
    var parameters: [String:Any]? {
        switch self {
        
            
        case .GetMyProducts:
            return nil
        
            
        }
    }
    
    
    
    func asURLRequest() throws -> URLRequest {
        
        
        let headers : HTTPHeaders? = {
            
            switch self{
            
            case .GetMyProducts:
              return nil
            
            }
            
        }()
        
        
        
        let method: HTTPMethod = {
            switch self {
            
                
            case .GetMyProducts:
                return .get
                
            }
        }()
        
        var urlRequest = try! URLRequest(url: url, method: method, headers: headers)
        var encoding: ParameterEncoding
        
        // TODO:
        switch self {
        
        default:
            encoding = JSONEncoding.default
            urlRequest = try encoding.encode(urlRequest , with : parameters)
        }
        
        return urlRequest
    }
}
    

