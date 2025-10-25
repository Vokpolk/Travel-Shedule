import SwiftUI

import OpenAPIRuntime
import OpenAPIURLSession

struct ContentView: View {
    @State private var viewModel = SourceViewModel()
    private let servicesProvider: ServicesProvider? = nil//ServicesProvider(apikey: Constants.apikey)
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                TabView {
                    VStack {
                        StoriesView()
                        ScheduleCellView(viewModel: $viewModel) {
                            print("TEST")
                        }
                        Spacer()
                    }
                    .tabItem {
                        Label {
                            Text("Расписание")
                                .foregroundColor(.black)
                        } icon: {
                            Image(.schedule)
                                .renderingMode(.template)
                                .foregroundColor(.black)
                        }
                        .labelStyle(.iconOnly)
                    }
                    ZStack {
                        Color.blue.edgesIgnoringSafeArea(.top)
                        Text("Экран настроек")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .tabItem {
                        Label {
                            Text("Настройки")
                                .foregroundColor(.black)
                        } icon: {
                            Image(.settings)
                                .renderingMode(.template)
                                .foregroundColor(.black)
                        }
                        .labelStyle(.iconOnly)
                    }
                }
                .tint(.black)
            }
        }
        .onAppear {
            print(ErrorType.server.description)
            print("APPEARED")
//                        testFetchStations()
//                        testFetchSheduleBetweenStations()
//                        testFetchStationSchedule()
//                        testFetchRouteStations()
//                        testFetchNearestCity()
//                        testFetchCarrierInfo()
//            testFetchAllStations()
//                        testFetchCopyright()
        }
    }
        
    
    func testFetchStations() {
        Task {
            do {
                guard let servicesProvider else { return }
                
                let _ = try await servicesProvider.nearestStationsService.getNearestStations(
                    lat: 59.864177,
                    lng: 30.319163,
                    distance: 2
                )
                
                print("testFetchStations: OK")
            } catch {
                print("testFetchStations: FAIL")
            }
        }
    }
    
    func testFetchSheduleBetweenStations() {
        Task {
            do {
                guard let servicesProvider else { return }
                
                let _ = try await servicesProvider
                    .schedualBetweenStationsService
                    .getSchedualBetweenStations(
                        
                        from: "c213",
                        to: "c11"
                    )
                
                print("testFetchSheduleBetweenStations: OK")
            } catch {
                print("testFetchSheduleBetweenStations: FAIL")
            }
        }
    }
    
    func testFetchStationSchedule() {
        Task {
            do {
                guard let servicesProvider else { return }
                
                let _ = try await servicesProvider.stationScheduleService.getStationSchedule(
                    station: "s9602498"
                )
                
                print("testFetchStationSchedule: OK")
            } catch {
                print("testFetchStationSchedule: FAIL")
            }
        }
    }
    
    func testFetchRouteStations() {
        Task {
            do {
                guard let servicesProvider else { return }
                
                let _ = try await servicesProvider.routeStationsService.getRouteStations(uid: "126YE_6_2")
                
                print("testFetchRouteStations: OK")
            } catch {
                print("testFetchRouteStations: FAIL")
            }
        }
    }
    
    func testFetchNearestCity() {
        Task {
            do {
                guard let servicesProvider else { return }
                
                let _ = try await servicesProvider.nearestCityService.getNearestCity(
                    lat: 59.864177,
                    lng: 30.319163,
                    distance: 12
                )
                
                print("testFetchNearestCity: OK")
            } catch {
                
                print("testFetchNearestCity: FAIL")
            }
        }
    }
    
    func testFetchCarrierInfo() {
        Task {
            do {
                guard let servicesProvider else { return }
                
                let _ = try await servicesProvider.carrierInfoService.getCarrierInfo(
                    code: "TK",
                    system: "iata"
                )
                
                print("testFetchCarrierInfo: OK")
            } catch {
                print("testFetchCarrierInfo: FAIL")
            }
        }
    }
    
    func testFetchAllStations() {
        Task {
            do {
                guard let servicesProvider else { return }
                
                let data = try await servicesProvider.allStationService.getAllStations()
                let country = data.countries?.filter({ country in
                    if country.title == "Россия" {
                        print("РОССИЯ")
                        return true
                    }
                    return false
                })
//                country[0].regions?.forEach({ region in
//                    region.
//                })
                print("testFetchCarrierInfo: OK")
            } catch {
                print("testFetchCarrierInfo: FAIL")
            }
        }
    }
    
    func testFetchCopyright() {
        Task {
            do {
                guard let servicesProvider else { return }
                
                let _ = try await servicesProvider.copyrightService.getCopyright()
                
                print("testFetchCopyright: OK")
            } catch {
                print("testFetchCopyright: FAIL")
            }
        }
    }
}

#Preview {
    ContentView()
}
