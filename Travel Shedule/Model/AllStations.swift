import Foundation

typealias Country = Components.Schemas.Country

struct Station: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var code: String
}

struct City: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var stations: [Station]
}

struct CurrentStation {
    var settlementName: String
    var stationName: String
    var code: String
}
