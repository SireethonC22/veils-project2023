//
//  RoundedShape.swift
//  snp65-project
//
//  Created by Sireethorn on 23/12/2565 BE.
//

import SwiftUI

struct RoundedShape: Shape {
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,byRoundingCorners: corners ,cornerRadii: CGSize(width: 80, height: 80))
        
        return Path(path.cgPath)
    }
}
