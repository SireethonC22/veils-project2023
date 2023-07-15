//
//  Upcoming.swift
//  snp65-project
//
// 
//

import Foundation
import FirebaseFirestoreSwift
struct Upcoming: Hashable, Codable, Identifiable {
    
    var id: String
    var upcomState: String
    var upcomName: String
    var upcomStr: String
    var upcomEnd: String
    var upcomTimeStr: String
    var upcomTimeEnd: String
    var upcomAbout: String
    var upcomOgrz: String
    var upcomLoct: String
    var upcomLoctDetail: String
    var upcomTicket: String
    var upcomImgCover: String
    
}
