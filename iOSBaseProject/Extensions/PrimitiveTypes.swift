import Foundation

extension String {
    public func replacing(range: CountableClosedRange<Int>, with replacementString: String) -> String {
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end   = index(start, offsetBy: range.count)
        return self.replacingCharacters(in: start ..< end, with: replacementString)
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    
    var intValue : Int? {
        return Int(self)
    }
    
    var doubleValue : Double? {
        
        return Double(self)
    }
    
    var asDate: String! {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)!
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour], from: date)
        let finalDate = calendar.date(from:components)!
        dateFormatter.dateFormat = "dd MMMM yyyy"
        return dateFormatter.string(from: finalDate)
    }
}

extension Double {
    
    var intValue : Int {
        return Int(self)
    }
    
    var shortCurrencyDecription: String {
        
        if self >= 10000, self < 1000000 {
            return String(format: "₦%.1fK", locale: Locale.current,self/1000).replacingOccurrences(of: ".0", with: "")
        }
        
        if self >= 1000000 , self < 1000000000 {
            return String(format: "₦%.1fM", locale: Locale.current,self/1000000).replacingOccurrences(of: ".0", with: "")
        }
        if self >= 1000000000 {
            return String(format: "₦%.1fB", locale: Locale.current,self/1000000000).replacingOccurrences(of: ".0", with: "")
        }
        
        return String(format: "₦%.0f", locale: Locale.current,self)
    }
    
    var commaSeparatedValue : String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        return "\(numberFormatter.string(from: NSNumber(value: self))!)"
    }
    
    var string: String! {
        return String(self)
    }
}

extension Float {
    
    var intValue: Int {
        return Int(self)
    }
}

extension Int {

    var fullYearDescription: String {
        return (self <= 1) ? "\(self) year" : "\(self) years"
    }
    
    var string: String! {
        return String(self)
    }
}

extension Bool {
    
    var string: String! {
        return String(self)
    }
}
