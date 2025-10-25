import Foundation


struct Schedule: Identifiable, Hashable {
    var id = UUID()
    
    var carrierName: String?
    var carrierImage: String?
    var date: String?
//    var from: Station
//    var to: Station
    var hasTransfer: Bool?
    var departureTime: String?
    var arrivalTime: String?
    var travelTime: Int?
}

