import SwiftUI
import Network

enum Route:  Hashable {
    case fromSettlementsListView
    case toSettlementsListView
    case fromStationsListView
    case toStationsListView
    case carrierListView
    case scheduleFilterView
}

struct MainView: View {
    @State private var isConnected = true
    
    @State private var path = [Route]()
    @State private var viewModel = SourceViewModel()
    @State private var city = City(name: "", stations: [])
    @State private var firstStation = CurrentStation(settlementName: "", stationName: "", code: "")
    @State private var secondStation = CurrentStation(settlementName: "", stationName: "", code: "")
    var body: some View {
        Group {
            if viewModel.serverError {
                ServerErrorView()
            } else if !isConnected {
                NoInternetView()
            } else {
                NavigationStack(path: $path) {
                    TabView {
                        ScheduleView(path: $path, viewModel: $viewModel)
                            .tabItem {
                                Image(.schedule)
                                    .renderingMode(.template)
                            }
                            .background(.ypWhite)
                        Text("Settings")
                            .tabItem {
                                Image(.settings)
                                    .renderingMode(.template)
                            }
                            .background(.ypWhite)
                    }
                    .tint(.ypBlack)
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .fromSettlementsListView:
                            SettlementListView(path: $path, viewModel: $viewModel, city: $city, currentStation: $firstStation, isFrom: true)
                        case .toSettlementsListView:
                            SettlementListView(path: $path, viewModel: $viewModel, city: $city, currentStation: $secondStation, isFrom: false)
                        case .fromStationsListView:
                            StationListView(path: $path, viewModel: $viewModel, city: $city, isFrom: true)
                        case .toStationsListView:
                            StationListView(path: $path, viewModel: $viewModel, city: $city, isFrom: false)
                        case .carrierListView:
                            CarrierListView(path: $path, viewModel: viewModel)
                        case .scheduleFilterView:
                            ScheduleFilterView()
                        }
                    }
                }
            }
        }
        .onAppear {
            startMonitoring()
        }
    }
    
    private func startMonitoring() {
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: DispatchQueue.global(qos: .background))
    }
}

#Preview {
    MainView()
}
