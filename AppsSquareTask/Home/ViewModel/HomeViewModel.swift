//
//  HomeViewModel.swift
//  AppsSquareTask
//
//  Created by Zaki on 06/07/2022.
//

import Foundation

class GeyMyProductsViewModel : NSObject {
    
   
    var product : HomeResponse?
    private var apiDataSource : HomeDataSource!
    var showAlert : ((_ showAlert : String) -> Void)?
    var OnMyProductsSucsess : ((_ Details : [RestaurantProducts]?) -> Void)?
    var OnMyProductsFailed : (( _ _message: String) -> Void)?
    
    override init() {
        super.init()
        self.apiDataSource = HomeDataSource()
    }
    
    
    
    func GetMyProducts(){
        apiDataSource.GetMyProducts(isSucess: {
            [weak self] product in
            
            guard let response = product else {
                return
            }
            
            self?.OnMyProductsSucsess?(response.restaurantProducts)
            
        },
        isError: { [weak self] message in
            self?.showAlert?(message ?? "")
        })
    }
}

