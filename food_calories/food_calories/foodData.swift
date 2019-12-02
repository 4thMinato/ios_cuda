//
//  foodData.swift
//  food_calories
//
//  Created by User20 on 2019/11/28.
//  Copyright © 2019 ouo. All rights reserved.
//

import Foundation

class FoodData: ObservableObject {
    
    @Published var foods = [Food]() {
        didSet {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(foods) {
                UserDefaults.standard.set(data, forKey: "foods")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "foods") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Food].self, from: data) {
                foods = decodedData
            }
        }
    }
    
}

