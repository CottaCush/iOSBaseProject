import Foundation

extension Date {
    var age: Int? {
        
        let calender =  Calendar.current
        
        let ageComponents = calender.dateComponents([.year], from: calender.startOfDay(for: self), to: calender.startOfDay(for: Date()))

        return ageComponents.year
    }
    
    var daysFromNow: Int {
        return Calendar.current.dateComponents([.day],from: self, to: Date()).day ?? 0
    }
    
    var relativeTime: String {
        
        let days = daysFromNow
        
        if days == 0 {
            return StringLiterals.TODAY
        } else if days == 1 {
            return StringLiterals.YESTERDAY
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd"
            return dateFormatter.string(from: self)
        }
    }
}
