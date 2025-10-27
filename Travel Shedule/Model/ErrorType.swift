import Foundation

enum ErrorType {
    case server
    case connection
    
    var description: String {
        switch self {
        case .server:
            return "Ошибка сервера"
        case .connection:
            return "Нет интернета"
        }
    }
    
    var image: String {
        switch self {
        case .server:
            return "Server Error"
        case .connection:
            return "No Internet"
        }
    }
}
