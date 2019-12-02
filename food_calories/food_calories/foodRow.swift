//
//  foodRow.swift
//  food_calories
//
//  Created by User20 on 2019/11/28.
//  Copyright © 2019 ouo. All rights reserved.
//

import SwiftUI

struct FoodRow: View {
    
    var food: Food

    var body: some View {
        HStack {
            Text(food.name)
            Spacer()
            Text("\(food.calories) cal")
            Text(food.time)
        }
        
    }
}

struct LoverRow_Previews: PreviewProvider {
    static var previews: some View {
        FoodRow(food: Food(name: "三明治", calories: 30, time:"Breakfast"))
    }
}
