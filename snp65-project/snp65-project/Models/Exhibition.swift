//
//  Exhibition.swift
//  snp65-project
//
//  
//

import Foundation
import FirebaseFirestoreSwift

struct Exhibition: Hashable, Codable, Identifiable {
    
    var id: String
    var exhbtstate: String
    var exhbtname: String
    var exhbtstr: String
    var exhbtend: String
    var exhbtdesc: String
    var timestr: String
    var timeend: String
    var exhbtorgnz: String
    var loctname: String
    var loctdetail: String
    var ticket: String
    var imgcover: String 
    
    
}
