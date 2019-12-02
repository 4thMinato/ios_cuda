//
//  chart_structure.swift
//  food_calories
//
//  Created by User07 on 2019/12/2.
//  Copyright © 2019 ouo. All rights reserved.
//
import Foundation
import SwiftUI

struct chart_structure: Shape {
    var startAngle: Angle
    var endAngle: Angle
    func path(in rect: CGRect) -> Path
    {
        Path
        {
            (path) in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}

