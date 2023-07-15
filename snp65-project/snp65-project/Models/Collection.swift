//
//  Collection.swift
//  snp65-project
//
//  
//

import Foundation
import FirebaseFirestoreSwift

struct Collection: Hashable, Codable, Identifiable {
    
    @DocumentID var id: String?
    var uid: String
    var artworkid: String
    
}

