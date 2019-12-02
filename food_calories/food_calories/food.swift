//
//  food.swift
//  food_calories
//
//  Created by User20 on 2019/11/28.
//  Copyright © 2019 ouo. All rights reserved.
//

import Foundation


struct Food: Identifiable, Codable {
    var id = UUID()
    var name: String
    var calories: Int
    var time: String
}

