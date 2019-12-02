//
//  foodEditor.swift
//  food_calories
//
//  Created by User20 on 2019/11/28.
//  Copyright © 2019 ouo. All rights reserved.
//

import SwiftUI

struct FoodEditor: View {
    @Environment(\.presentationMode) var presentationMode
    var FoodsData: FoodData
    @State private var name = ""
    @State private var calories = 30
    @State private var time = "Breakfast"
    var editFood: Food?
    
    
    var body: some View {
        Form {
            TextField("名字", text: $name)
            Stepper("熱量 \(calories)", value: $calories, in: 30...10000)
           TextField("時間", text: $time)
        }
        .navigationBarTitle(editFood == nil ? "Add new food" : "Edit food")
        .navigationBarItems(trailing: Button("Save") {
            let food = Food(name: self.name, calories: self.calories, time: self.time)
            if let editLover = self.editFood {
                let index = self.FoodsData.foods.firstIndex {
                    $0.id == editLover.id
                    }!
                self.FoodsData.foods[index] = food
            } else {
                self.FoodsData.foods.insert(food, at: 0)
            }
            self.presentationMode.wrappedValue.dismiss()
            
        })
            .onAppear {
                if let editLover = self.editFood {
                    self.name = editLover.name
                    self.calories = editLover.calories
                    self.time = editLover.time
                    
                }
        }
        
    }
    
}

struct LoverEditor_Previews: PreviewProvider {
    static var previews: some View {
        FoodEditor(FoodsData: FoodData())
    }
}
