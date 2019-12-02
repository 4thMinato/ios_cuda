//
//  chart view.swift
//  food_calories
//
//  Created by User07 on 2019/12/2.
//  Copyright © 2019 ouo. All rights reserved.
//

import SwiftUI

struct chart_view: View {
    @ObservedObject var foodData = FoodData()
    var percentages : [Double]
    var degree = [Double]()
    var types = ["Breakfast","Lunch","Dinner"]
    var Angles = [Angle]()
    var colors : [Color]
    var total: Int = 0
    init(foodData: FoodData){
        self.foodData = foodData
        if foodData.foods.count == 0{
            colors = [Color.white,Color.white,Color.white]
            percentages = [1.0]
            degree = [0.0,0.0,0.0]
        }
        else{
            percentages = [0.0,0.0,0.0]
            colors = [Color.blue,Color.red,Color.yellow]
            for food in foodData.foods{
                total += food.calories;
                for index in 0...2{
                    if(types[index] == food.time){
                        percentages[index] += Double(food.calories)
                    }
                }
            }
            for index in 0...2{
                percentages[index] /= Double(total)
            }
            Angles = [Angle]()
            var degree: Double = 0
            for percentages in percentages
            {
                Angles.append(.degrees(degree))
                degree += 360 * percentages
            }
        }
    }
    var body: some View {
        NavigationView{
        ZStack {
            chart_structure(startAngle: .zero,endAngle:.degrees(120)).fill(Color.red)
            chart_structure(startAngle: .degrees(120), endAngle:.degrees(240)).fill(Color.blue)
            chart_structure(startAngle: .degrees(240), endAngle:.degrees(360)).fill(Color.green)
            }
         }.navigationBarTitle("圖表統計")
     }
}

struct chart_view_Previews: PreviewProvider {
    static var previews: some View {
        chart_view(foodData: FoodData())
    }
}
