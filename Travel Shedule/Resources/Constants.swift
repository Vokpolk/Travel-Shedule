import Foundation

enum Constants {
    static let apikey = "6bb0df37-9f36-45dc-b60b-51d902881cb7"
}

extension DateFormatter {
    static let yyyyMMddRu: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter
    }()
    
    static let HHmmss: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter
    }()
}
