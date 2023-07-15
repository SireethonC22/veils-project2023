//
//  ExhibitionViewModel.swift
//  snp65-project
//
//
//

import Foundation
import SwiftUI
import Firebase
import EventKit

final class ExhibitionViewModel: ObservableObject,Identifiable {
    
    @Published var exhibitions: [Exhibition] = []
//    var exhibition: Exhibition
    
    
    init(){
        fetchExhibitions()
       
    }
    
    func fetchExhibitions(){
        let db = Firestore.firestore()
        db.collection("exhibitions").getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("debug: error geting documents: \(error)")
            } else {
                if let querySnapshot = querySnapshot{
                    for document in querySnapshot.documents {
                        let data = document.data()
                        
                        let id = data["idexhbt"] as? String ?? ""
                        let exhbtstate = data["exhbtstate"] as? String ?? ""
                        let exhbtname = data["exhbtname"] as? String ?? ""
                        
                        //date Format
                        let exhbtStart = (data["exhbtstr"] as AnyObject).dateValue()
                        let exhbtstr = exhbtStart.formatDate()
                        
                        let exhbtEnd = (data["exhbtend"] as AnyObject).dateValue()
                        let exhbtend = exhbtEnd.formatDate()
                        
                        let exhbtdesc = data["exhbtdesc"] as? String ?? ""
                        
                        //time Format
                        let timeStart = (data["timestr"] as AnyObject).dateValue()
                        let timestr = timeStart.formatTime()
                        
                        let timeEnd = (data["timeend"] as AnyObject).dateValue()
                        let timeend = timeEnd.formatTime()
                        
                        let exhbtorgnz = data["exhbtorgnz"] as? String ?? ""
                        let loctname = data["loctname"] as? String ?? ""
                        let loctdetail = data["loctdetail"] as? String ?? ""
                        let ticket = data["ticket"] as? String ?? ""
                        let imgcover = data["imgcover"] as? String ?? ""
                        
                        let exhibition =  Exhibition(id: id, exhbtstate: exhbtstate, exhbtname: exhbtname, exhbtstr: exhbtstr, exhbtend: exhbtend, exhbtdesc: exhbtdesc, timestr: timestr, timeend: timeend, exhbtorgnz: exhbtorgnz, loctname: loctname, loctdetail: loctdetail, ticket: ticket, imgcover: imgcover)
                        
                        self.exhibitions.append(exhibition)

                    }
                }
            }
            
        }
        
    } // func fetchExhibitions
    
    
    
//
//    func remindTapped () {
//        let getdb = Firestore.firestore()
//        let eventStore : EKEventStore = EKEventStore()
//        eventStore.requestAccess(to: .event){ grant, error in
//            if let error = error {
//                print  ("debug: error geting documents: \(error)")
//            } else {
//                let event: EKEvent = EKEvent(eventStore: eventStore)
//                event.title = "\(self.exhibition.exhbtname)"
//                event.notes = "\(self.exhibition.exhbtdesc)"
//
//                let alarm = EKAlarm(relativeOffset: -86400)
//                event.alarms = [alarm]
//                event.calendar = eventStore.defaultCalendarForNewEvents
//
//                do {
//                    try eventStore.save(event, span: .thisEvent)
//                } catch let error as NSError {
//                    print ("debug: error adding event: \(error)")
//                }
//
//            }
//        }
//    } // func reminderTap
    
    
    
    
    
    
    
    
    
    
    
    
    
//    func checkReminder() {
//        let eventStore: EKEventStore = EKEventStore()
//        var eventAlreadyExists = false
//        let event = EKEvent(eventStore: eventStore)
//        event.title = currentExhbt.exhbtname
////        event.startDate = currentExhbt.exhbtstr
////        event.endDate = currentExhbt.exhbtend
//        event.calendar = eventStore.defaultCalendarForNewEvents
//
////        let predicate = eventStore.predicateForEvents(withStart: currentExhbt.exhbtstr, end: currentExhbt.exhbtend, calendars: nil)
//
//
//    }
}
