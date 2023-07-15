//
//  ArtworkViewModel.swift
//  snp65-project
//
//  
//

import Foundation
import SwiftUI
import Firebase

final class ArtworkViewModel: ObservableObject,Identifiable {
    @Published var artworks: [Artwork] = []
    
    init(){
        fetchArtworks()
    }
    
    
    // get data artwork
    func fetchArtworks(){
        let db = Firestore.firestore()
        db.collection("artworks").getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("debug: error geting documents: \(error)")
            } else {
                if let querySnapshot = querySnapshot{
                    for document in querySnapshot.documents {
                        let data = document.data()
                        
                        let id = data["idartwork"] as? String ?? ""
                        let exhbtid = data["exhbtid"] as? String ?? ""
                        let name = data["name"] as? String ?? ""
                        let artist = data["artist"] as? String ?? ""
                        let type = data["type"] as? String ?? ""
                        let desc = data["desc"] as? String ?? ""
                        
                        //title
                        let headexhbt = data["headexhbt"] as? String ?? ""
                        
                        // img url
                        let imgcover = data["imgcover"] as? String ?? ""
                        let imgdesc = data["imgdesc"] as? String ?? ""
                        
                        // sound
                        let sound = data["sound"] as? String ?? ""
                        
                        let uuidbeacon = data["uuidbeacon"] as? String ?? ""
                        let majorbeacon = data["majorbeacon"] as? Int ?? 0
                        let minorbeacon = data["minorbeacon"] as? Int ?? 0
                        
                        let artwork = Artwork(id: id, exhbtid: exhbtid, name: name, artist: artist, type: type, desc: desc, imgcover: imgcover, imgdesc: imgdesc, sound: sound, uuidbeacon: uuidbeacon, majorbeacon: majorbeacon, minorbeacon: minorbeacon, headexhbt: headexhbt)
                        
                        self.artworks.append(artwork)
                    }
                }
            }
            
        }
    } // End fetchArtworks
    
}
