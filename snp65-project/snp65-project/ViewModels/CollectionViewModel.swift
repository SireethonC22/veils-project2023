//
//  CollectionViewModel.swift
//  snp65-project
//
//  
//

import Foundation
import SwiftUI
import Firebase

final class CollectionViewModel: ObservableObject,Identifiable {
    @Published var collections: [Collection] = []
    
    init(){
        fetchCollections()
    }
    
    func fetchCollections(){
        let db = Firestore.firestore()
        db.collection("collections").getDocuments(){(querySnapshot, error) in
            if let error = error {
                print("debug: error geting documents:\(error)")
            } else {
                if let querySnapshot = querySnapshot {
                    for document in querySnapshot.documents {
                        let data = document.data()
                        
                        let uid = data["uid"] as? String ?? ""
                        let artworkid = data["artworkid"] as? String ?? ""
                        
                        let collection = Collection(uid: uid, artworkid: artworkid)
                        
                        self.collections.append(collection)
                    }
                }
            }
        }
    }
}
