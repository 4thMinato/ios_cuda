//
//  foodlist.swift
//  food_calories
//
//  Created by User20 on 2019/11/28.
//  Copyright © 2019 ouo. All rights reserved.
//

import SwiftUI

struct FoodList: View {
    
    @ObservedObject var foodData = FoodData()
    @State private var showEditfood = false
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(foodData.foods) { (food) in
                    NavigationLink(destination: FoodEditor(FoodsData: self.foodData,editFood:food)) {
                        FoodRow(food: food)
                        
                    }
                }
                .onDelete { (indexSet) in
                    self.foodData.foods.remove(atOffsets: indexSet)
                }
            }
            .navigationBarTitle("飲食列表")
            .navigationBarItems(leading: EditButton() ,trailing: Button(action: {
                
                self.showEditfood = true
                
            }, label: {
                Image(systemName: "plus.circle.fill")
                
            }))
                .sheet(isPresented: $showEditfood) {
                    NavigationView {
                         FoodEditor(FoodsData: self.foodData)
                    }
                   
            }
        }
    }
}

struct LoverList_Previews: PreviewProvider {
    static var previews: some View {
        FoodList()
    }
}
