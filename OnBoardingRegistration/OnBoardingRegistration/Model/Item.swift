//
//  Item.swift
//  OnBoardingRegistration
//
//  Created by Manzoor Ahmed on 8/18/24.
//

import Foundation

struct Item: Decodable {
    let title: String
    let price: String
    let image: String
    let description: String
    let category: String
}
