//
//  HomeModel.swift
//  AppsSquareTask
//
//  Created by Zaki on 06/07/2022.
//

import Foundation

struct HomeResponse : Codable {
    let message : String?
    let restaurantProducts : [RestaurantProducts]?
}

struct RestaurantProducts : Codable {
    let meal_image : String?
    let price : String?
    let name : String?
    let Cateogry : String?
    
    }
