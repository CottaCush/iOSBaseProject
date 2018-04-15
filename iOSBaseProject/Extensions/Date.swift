import Foundation

extension Date {
    var age: Int? {
        
        let calender =  Calendar.current
        
        let ageComponents = calender.dateComponents([.year], from: calender.startOfDay(for: self), to: calender.startOfDay(for: Date()))

        return ageComponents.year
    }
}
