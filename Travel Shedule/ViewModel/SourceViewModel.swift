import Foundation

@Observable class SourceViewModel {
    var serverError: Bool = false
    var isLoaded: Bool = false
    var cities: [City] = []
    var schedules: [Schedule] = []
    var firstData: CurrentStation = CurrentStation(settlementName: "", stationName: "", code: "")
    var secondData: CurrentStation = CurrentStation(settlementName: "", stationName: "", code: "")
    private let servicesProvider: ServicesProvider? = ServicesProvider(apikey: Constants.apikey)
    
    init() {
        fetchAllStations()
    }
    
    func fetchSchedule(from: String, to: String) async {
        do {
            guard let servicesProvider else { return }
            
            self.schedules.removeAll()
            let schedules = try await servicesProvider
                .schedualBetweenStationsService
                .getSchedualBetweenStations(
                    
                    from: from,
                    to: to
                )
            initSchedules(schedules)
        } catch {
            serverError = true
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
                        return true
                    }
                    return false
                }
                
                guard let country else { return }
                initCities(from: country[0])
                isLoaded = true
            } catch {
                serverError = true
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
        guard let date = DateFormatter.yyyyMMddRu.date(from: dateString) else {
            return nil
        }
        
        DateFormatter.yyyyMMddRu.dateFormat = "d MMMM"
        let result = DateFormatter.yyyyMMddRu.string(from: date)
        DateFormatter.yyyyMMddRu.dateFormat = "yyyy-MM-dd"
        return result
    }
    
    private func formatTimeString(_ timeString: String) -> String? {
        guard let date = DateFormatter.HHmmss.date(from: timeString) else {
            return nil
        }
        
        DateFormatter.HHmmss.dateFormat = "HH:mm"
        let result = DateFormatter.HHmmss.string(from: date)
        DateFormatter.HHmmss.dateFormat = "HH:mm:ss"
        return result
    }
}
