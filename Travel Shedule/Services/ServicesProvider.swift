import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

final class ServicesProvider {
    
    private let client: Client
    
    private(set) var allStationService: AllStationsService
    private(set) var carrierInfoService: CarrierInfoService
    private(set) var copyrightService: CopyrightService
    private(set) var nearestCityService: NearestCityService
    private(set) var nearestStationsService: NearestStationsService
    private(set) var routeStationsService: RouteStationsService
    private(set) var schedualBetweenStationsService: SchedualBetweenStationsService
    private(set) var stationScheduleService: StationScheduleService
    
    // MARK: - Initializers
    init?(apikey: String) {
        var url: URL? = nil
        do {
            url = try Servers.Server1.url()
        } catch {
            print("Не удалось создать URL для Client")
        }
        
        guard let url else { return nil }
        
        client = Client(
            serverURL: url,
            transport: URLSessionTransport()
        )
        
        allStationService = AllStationsService(client: client, apikey: apikey)
        carrierInfoService = CarrierInfoService(client: client, apikey: apikey)
        copyrightService = CopyrightService(client: client, apikey: apikey)
        nearestCityService = NearestCityService(client: client, apikey: apikey)
        nearestStationsService = NearestStationsService(client: client, apikey: apikey)
        routeStationsService = RouteStationsService(client: client, apikey: apikey)
        schedualBetweenStationsService = SchedualBetweenStationsService(client: client, apikey: apikey)
        stationScheduleService = StationScheduleService(client: client, apikey: apikey)
    }
}
