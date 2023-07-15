//
//  FontSystem.swift
//  snp65-project
//
//
//

import Foundation
import SwiftUI

extension Font {
    
    // Semibold
    public static var semiHeading: Font {Font.custom("BaiJamjuree-Semibold", size: 24)}
    public static var semiSub: Font {Font.custom("BaiJamjuree-Semibold", size: 18)}
    public static var semiTitle: Font {Font.custom("BaiJamjuree-Semibold", size: 20)}
    
    // Medium
    public static var medTitle: Font {Font.custom("BaiJamjuree-Medium", size: 26)}
    public static var medHeading: Font {Font.custom("BaiJamjuree-Medium", size: 24)}
    public static var medSubHeading: Font {Font.custom("BaiJamjuree-Medium", size: 20)}
    public static var medSubHeading2: Font {Font.custom("BaiJamjuree-Medium", size: 18)}
    public static var medSubHeading3: Font {Font.custom("BaiJamjuree-Medium", size: 16)}
    
    // Regular
    public static var titleNormalText: Font {Font.custom("BaiJamjuree-Regular", size: 18)}
    public static var normalText: Font {Font.custom("BaiJamjuree-Regular", size: 16)}
    public static var subNormalText: Font {Font.custom("BaiJamjuree-Regular", size: 14)}
}
