import Foundation

struct Carrier: Identifiable, Hashable {
    var id = UUID()
    
    var email: String?
    var telephone: String?
}

struct Schedule: Identifiable, Hashable {
    var id = UUID()
    
    var carrierName: String?
    var carrierImage: String?
    var date: String?
    var hasTransfer: Bool?
    var departureTime: String?
    var arrivalTime: String?
    var travelTime: Int?
    let carrier: Carrier
}

