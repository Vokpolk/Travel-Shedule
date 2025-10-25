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
                
                self.schedules.removeAll()
                let schedules = try await servicesProvider
                    .schedualBetweenStationsService
                    .getSchedualBetweenStations(
                        
                        from: from,
                        to: to
                    )
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
            
            var imageUrl: String?
            if let imageUrlSchedule = schedule.thread?.carrier?.logo {
                imageUrl = imageUrlSchedule
            }
            var date: String?
            if let dateSchedule = schedule.start_date {
                date = formatDateString(dateSchedule)
            }
            var departureTime: String?
            if let departureTimeSchedule = schedule.departure {
                departureTime = formatTimeString(departureTimeSchedule)
            }
            
            var arrivalTime: String?
            if let arrivalTimeSchedule = schedule.arrival {
                arrivalTime = formatTimeString(arrivalTimeSchedule)
            }
            
            
            self.schedules.append(Schedule(
                carrierName: schedule.thread?.carrier?.title,
                carrierImage: imageUrl,
                date: date,
                hasTransfer: schedule.has_transfers,
                departureTime: departureTime,
                arrivalTime: arrivalTime,
                travelTime: (schedule.duration ?? 0) / 3600
            ))
        }
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
    
    private func formatDateString(_ dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        guard let date = dateFormatter.date(from: dateString) else {
            return nil
        }
        
        dateFormatter.dateFormat = "d MMMM"
        return dateFormatter.string(from: date)
    }
    
    private func formatTimeString(_ timeString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        
        guard let date = dateFormatter.date(from: timeString) else {
            return nil
        }
        
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
}
