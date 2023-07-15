//
//  DateTimeFormat.swift
//  snp65-project
//
//
//

import Foundation

extension Date {
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.setLocalizedDateFormatFromTemplate("d MMM, YYYY")
        return dateFormatter.string(from: self)
    } // formatDate
    
    
    
    static func FormatterToDate(_ date: String) -> Date {
        let dateFormatter = Foundation.DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        let date = dateFormatter.date(from:date)
        
        return date!
    }
    

}

extension Date {
    func formatTime() -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        timeFormatter.setLocalizedDateFormatFromTemplate("HH:mm")
        return timeFormatter.string(from: self)

    }
    
    func createDateTime(timestamp: String) -> String {
        let strDate = "undefined"
        
        if let unixTime = Double(timestamp) {
            _ = Date(timeIntervalSince1970: unixTime)
            let dateFormatter = DateFormatter()
            let timezone = TimeZone.current.abbreviation() ?? "CET"  // get current TimeZone abbreviation or set to CET
            dateFormatter.timeZone = TimeZone(abbreviation: timezone) //Set timezone that you want
            dateFormatter.locale = NSLocale.current
            
        }
        return strDate
    }
}
