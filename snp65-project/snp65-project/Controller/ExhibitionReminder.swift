//
//  ExhibitionReminder.swift
//  snp65-project
//
//
//

import EventKit
import EventKitUI
import Firebase
import Foundation

class ExhibitionReminder: ObservableObject, Identifiable {
    @Published var exhibitions: [Exhibition] = []

    var eventName: String = ""
    var eventDesc: String = ""
    var dateStart: Date?
    var dateEnd: Date?
    let db = Firestore.firestore()
    


    init() {
        getInfo(index: "")
        remindTapped()
    }

    func getInfo(index: String) {
        db.collection("exhibitions").getDocuments { querySnapshot, error in
            if let error = error {
                print("debug : error \(error.localizedDescription)")
            } else {
                if let querySnapshot = querySnapshot {
                    for document in querySnapshot.documents {
                        print("xx")
//                        if index == document.data()["id"] as? String ?? "" {
                        if "1" == document.data()["idexhbt"] as? String ?? "" {
                        //                      print (document)
                        self.eventName = document.data()["exhbtname"] as? String ?? ""
                        self.eventDesc = document.data()["exhbtdesc"] as? String ?? ""
                        self.dateStart = (document.data()["exhbtstr"] as! Timestamp).dateValue()
                        self.dateEnd = (document.data()["exhbtend"] as! Timestamp).dateValue()

                        print(self.eventName)
                        }
                    }
                }
            }
        }
    } // getInfo

    func remindTapped() {
        DispatchQueue.main.async {
            let eventStore: EKEventStore = EKEventStore()
            eventStore.requestAccess(to: .event) { _, error in
                if let error = error {
                    print("debug: \(error.localizedDescription)")
                } else {
                    let newEvent: EKEvent = EKEvent(eventStore: eventStore)
                    newEvent.title = "\(self.eventName)"
                    newEvent.startDate = self.dateStart
                    newEvent.endDate = self.dateEnd
                    newEvent.notes = "\(self.eventDesc)"



                    let alarm = EKAlarm(relativeOffset: -86400)
                    newEvent.alarms = [alarm]
                    newEvent.calendar = eventStore.defaultCalendarForNewEvents

                    do {
                        try eventStore.save(newEvent, span: .thisEvent)
                    } catch let error as NSError {
                        print("debug: error adding \(error)")
                    }

                }
            }
        }
    }
}
