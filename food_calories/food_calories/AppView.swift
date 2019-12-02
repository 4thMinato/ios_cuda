//
//  AppView.swift
//  food_calories
//
//  Created by User07 on 2019/12/2.
//  Copyright © 2019 ouo. All rights reserved.
//
import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("主頁")
            }
           FoodList()
                .tabItem {
                    Image(systemName: "info.circle.fill")
                    Text("簡介")
            }
           chart_view(foodData: FoodData())
                .tabItem {
                    Image(systemName: "info.circle.fill")
                    Text("圖表")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
