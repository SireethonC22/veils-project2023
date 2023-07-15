//
//  UpcomingViewModel.swift
//  snp65-project
//
// 
//

import Foundation
import SwiftUI
import Firebase
import EventKit


final class UpcomingViewModel: ObservableObject,Identifiable {
    
    @Published var upcomings: [Upcoming] = []
    
    
    init(){
        fetchUpcomings()
       
    }
    
    func fetchUpcomings(){
        
        let db = Firestore.firestore()
        db.collection("upcomings").getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("debug: error geting documents: \(error)")
            } else {
                if let querySnapshot = querySnapshot{
                    for document in querySnapshot.documents {
                        let data = document.data()
                        
                        let id = data["idupcom"] as? String ?? ""
                        let upcomState = data["upcomState"] as? String ?? ""
                        let upcomName = data["upcomName"] as? String ?? ""
                        
                        //date Format
                        let upcomStart = (data["upcomStr"] as AnyObject).dateValue()
                        let upcomStr = upcomStart.formatDate()
                        
                        let upcomEnding = (data["upcomEnd"] as AnyObject).dateValue()
                        let upcomEnd = upcomEnding.formatDate()
                        
                        let upcomAbout = data["upcomAbout"] as? String ?? ""
                        
                        //time Format
                        let upcomTimeStart = (data["upcomTimeStr"] as AnyObject).dateValue()
                        let upcomTimeStr = upcomTimeStart.formatTime()
                        
                        let upcomTimeEnding = (data["upcomTimeEnd"] as AnyObject).dateValue()
                        let upcomTimeEnd = upcomTimeEnding.formatTime()
                        
                        let upcomOgrz = data["upcomOgrz"] as? String ?? ""
                        
                        let upcomLoct = data["upcomLoct"] as? String ?? ""
                        let upcomLoctDetail = data["upcomLoctDetail"] as? String ?? ""
                        
                        let upcomTicket = data["upcomTicket"] as? String ?? ""
                        
                        let upcomImgCover = data["upcomImgCover"] as? String ?? ""
                        
                        let upcoming = Upcoming(id: id, upcomState: upcomState, upcomName: upcomName, upcomStr: upcomStr, upcomEnd: upcomEnd, upcomTimeStr: upcomTimeStr, upcomTimeEnd: upcomTimeEnd, upcomAbout: upcomAbout, upcomOgrz: upcomOgrz, upcomLoct: upcomLoct, upcomLoctDetail: upcomLoctDetail, upcomTicket: upcomTicket, upcomImgCover: upcomImgCover)
                        
                        self.upcomings.append(upcoming)


                    }
                }
            }
            
        }
        
    }
    
}
