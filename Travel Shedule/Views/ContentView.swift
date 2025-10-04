import SwiftUI

import OpenAPIRuntime
import OpenAPIURLSession

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            testFetchStations()
            testFetchSheduleBetweenStations()
            testFetchStationSchedule()
            testFetchRouteStations()
            testFetchNearestCity()
            testFetchCarrierInfo()
            testFetchAllStations()
            testFetchCopyright()
        }
    }
    
    func testFetchStations() {
        Task {
            do {
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                
                let service = NearestStationsService(
                    client: client,
                    apikey: "3811c35b-4037-406a-b747-0fb2b80eb55e"
                )
                
                let _ = try await service.getNearestStations(
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
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                
                let service = SchedualBetweenStationsService(
                    client: client,
                    apikey: "3811c35b-4037-406a-b747-0fb2b80eb55e"
                )
                
                let _ = try await service.getSchedualBetweenStations(from: "c213", to: "c11")
                
                print("testFetchSheduleBetweenStations: OK")
            } catch {
                print("testFetchSheduleBetweenStations: FAIL")
            }
        }
    }
    
    func testFetchStationSchedule() {
        Task {
            do {
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                
                let service = StationScheduleService(
                    client: client,
                    apikey: "3811c35b-4037-406a-b747-0fb2b80eb55e"
                )
                
                let _ = try await service.getStationSchedule(station: "s9602498")
                
                print("testFetchStationSchedule: OK")
            } catch {
                print("testFetchStationSchedule: FAIL")
            }
        }
    }
    
    func testFetchRouteStations() {
        Task {
            do {
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                
                let service = RouteStationsService(
                    client: client,
                    apikey: "3811c35b-4037-406a-b747-0fb2b80eb55e"
                )
                
                let _ = try await service.getRouteStations(uid: "126YE_6_2")
                
                print("testFetchRouteStations: OK")
            } catch {
                print("testFetchRouteStations: FAIL")
            }
        }
    }
    
    func testFetchNearestCity() {
        Task {
            do {
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                
                let service = NearestCityService(
                    client: client,
                    apikey: "3811c35b-4037-406a-b747-0fb2b80eb55e"
                )
                
                let _ = try await service.getNearestCity(
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
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                
                let service = CarrierInfoService(
                    client: client,
                    apikey: "3811c35b-4037-406a-b747-0fb2b80eb55e"
                )
                
                let _ = try await service.getCarrierInfo(
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
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                
                let service = AllStationsService(
                    client: client,
                    apikey: "3811c35b-4037-406a-b747-0fb2b80eb55e"
                )
                
                let _ = try await service.getAllStations()
                
                print("testFetchCarrierInfo: OK")
            } catch {
                print("testFetchCarrierInfo: FAIL")
            }
        }
    }
    
    func testFetchCopyright() {
        Task {
            do {
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                
                let service = CopyrightService(
                    client: client,
                    apikey: "3811c35b-4037-406a-b747-0fb2b80eb55e"
                )
                
                let _ = try await service.getCopyright()
                
                print("testFetchCarrierInfo: OK")
            } catch {
                print("testFetchCarrierInfo: FAIL")
            }
        }
    }
}

#Preview {
    ContentView()
}
