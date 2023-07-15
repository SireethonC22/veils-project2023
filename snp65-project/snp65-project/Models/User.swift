//
//  User.swift
//  snp65-project
//
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let lastname: String
    let email: String
    
}
