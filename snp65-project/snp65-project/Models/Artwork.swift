//
//  Artwork.swift
//  snp65-project
//
//  
//

import Foundation
import FirebaseFirestoreSwift

struct Artwork: Hashable, Codable, Identifiable {
    
    var id: String
    var exhbtid:String
    var name: String
    var artist: String
    var type: String
    var desc: String
    var imgcover: String
    var imgdesc: String
    var sound: String
    var uuidbeacon: String
    var majorbeacon: Int
    var minorbeacon: Int
    var headexhbt: String
}
