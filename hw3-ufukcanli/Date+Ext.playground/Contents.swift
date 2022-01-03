import Foundation

extension Date {
    
    enum DateType {
        case day
        case month
        case year
        case dateAsPrettyString
    }
    
    static func get(_ type: DateType) -> String {
        let date = Date()
        let calendar = Calendar.current
        
        let dayString = String(calendar.component(.day, from: date))
        let monthString = String(calendar.component(.month, from: date))
        let yearString = String(calendar.component(.year, from: date))
        let prettyString = "\(dayString)<>\(monthString)<>\(yearString)"
        
        switch type {
        case .day: return dayString
        case .month: return monthString
        case .year: return yearString
        case .dateAsPrettyString: return prettyString
        }
    }
}

Date.get(.day)
Date.get(.month)
Date.get(.year)
Date.get(.dateAsPrettyString)
