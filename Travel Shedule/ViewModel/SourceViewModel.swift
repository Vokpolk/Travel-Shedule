import Foundation

@Observable class SourceViewModel {
    
    var cities: [City] = []
    var schedules: [Schedule] = []
    var firstData: CurrentStation = CurrentStation(settlementName: "", stationName: "", code: "")
    var secondData: CurrentStation = CurrentStation(settlementName: "", stationName: "", code: "")
    private let servicesProvider: ServicesProvider? = ServicesProvider(apikey: Constants.apikey)
    
    init() {
        fetchAllStations()
    }
    
    func fetchSchedule(from: String, to: String) {
        Task {
            do {
                guard let servicesProvider else { return }
                
                let schedules = try await servicesProvider
                    .schedualBetweenStationsService
                    .getSchedualBetweenStations(
                        
                        from: from,
                        to: to
                    )
                
                var a = 10
                
                print("testFetchSheduleBetweenStations: OK")
                
                initSchedules(schedules)
            } catch {
                print("testFetchSheduleBetweenStations: FAIL")
            }
        }
    }
    
    private func initSchedules(_ schedules: SchedualBetweenStations) {
        
        guard let schedules_ = schedules.segments else { return }
        for schedule in schedules_ {
            self.schedules.append(Schedule(
                carrierName: schedule.thread?.carrier?.title,
                carrierImage: schedule.thread?.carrier?.logo,
                date: schedule.start_date,
                hasTransfer: schedule.has_transfers,
                departureTime: schedule.departure,
                arrivalTime: schedule.arrival,
                travelTime: schedule.duration
            ))
        }
        
        var a = 10
        
    }
    
    private func fetchAllStations() {
        Task {
            do {
                guard let servicesProvider else { return }
                
                let data = try await servicesProvider.allStationService.getAllStations()
                let country = data.countries?.filter { country in
                    if country.title == "Россия" {
                        print("РОССИЯ")
                        return true
                    }
                    return false
                }
                
                guard let country else { return }
                initCities(from: country[0])
                
                print("fetchAllStations: OK")
            } catch {
                print("fetchAllStations: FAIL")
            }
        }
    }
    
    private func initCities(from country: Country) {
        
        guard let regions = country.regions else { return }
        
        regions.forEach { region in
            region.settlements?.forEach { settlement in
                if settlement.title!.isEmpty {
                    return
                }
                var stations: [Station] = []
                settlement.stations?.forEach { station in
                    if station.transport_type == "train" {
                        stations.append(Station(name: station.title!, code: station.codes!.yandex_code!))
                    }
                }
                if (!stations.isEmpty) {
                    cities.append(City(name: settlement.title!, stations: stations))
                }
            }
        }
    }
}
