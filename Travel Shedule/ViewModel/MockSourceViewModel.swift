import Foundation

@Observable class MockSourceViewModel {
    
    var cities: [City] = []
    var firstStationCode: String = ""
    var secondStationCode: String = ""
    
    var firstData: CurrentStation = CurrentStation(settlementName: "", stationName: "", code: "")
    var secondData: CurrentStation = CurrentStation(settlementName: "", stationName: "", code: "")
    
    init() {
        initCities()
    }
    
    
    private func initCities() {
        cities.append(
            City(
                name: "Плюсса",
                stations: [Station(name: "Плюсса", code: "s9603037")]
            )
        )
        cities.append(
            City(
                name: "Гдов",
                stations: [Station(name: "Гдов", code: "s9603135")]
            )
        )
        cities.append(
            City(
                name: "Пустошка",
                stations: [Station(name: "Пустошка", code: "s9603005")]
            )
        )
        cities.append(
            City(
                name: "Бежаницы",
                stations: [Station(name: "Сущево", code: "s9603053")]
            )
        )
        cities.append(
            City(
                name: "Кунья",
                stations: [Station(name: "Кунья", code: "s9602969")]
            )
        )
        cities.append(
            City(
                name: "Дно",
                stations:
                    [
                        Station(name: "Дно", code: "s9603063"),
                        Station(name: "Дно-3 (551 км)", code: "s9603460")
                    ]
            )
        )
        cities.append(
            City(
                name: "Великие Луки",
                stations:
                    [
                        Station(name: "Великие Луки", code: "s9603033"),
                        Station(name: "481 км", code: "s9603646"),
                        Station(name: "Локомотивное депо", code: "s9635382"),
                        Station(name: "314 км", code: "s9655397")
                    ]
            )
        )
        cities.append(
            City(
                name: "Плюсса",
                stations: [Station(name: "Плюсса", code: "s9603037")]
            )
        )
        cities.append(
            City(
                name: "Гдов",
                stations: [Station(name: "Гдов", code: "s9603135")]
            )
        )
        cities.append(
            City(
                name: "Пустошка",
                stations: [Station(name: "Пустошка", code: "s9603005")]
            )
        )
        cities.append(
            City(
                name: "Бежаницы",
                stations: [Station(name: "Сущево", code: "s9603053")]
            )
        )
        cities.append(
            City(
                name: "Кунья",
                stations: [Station(name: "Кунья", code: "s9602969")]
            )
        )
        cities.append(
            City(
                name: "Дно",
                stations:
                    [
                        Station(name: "Дно", code: "s9603063"),
                        Station(name: "Дно-3 (551 км)", code: "s9603460")
                    ]
            )
        )
        cities.append(
            City(
                name: "Великие Луки",
                stations:
                    [
                        Station(name: "Великие Луки", code: "s9603033"),
                        Station(name: "481 км", code: "s9603646"),
                        Station(name: "Локомотивное депо", code: "s9635382"),
                        Station(name: "314 км", code: "s9655397")
                    ]
            )
        )
        cities.append(
            City(
                name: "Плюсса",
                stations: [Station(name: "Плюсса", code: "s9603037")]
            )
        )
        cities.append(
            City(
                name: "Гдов",
                stations: [Station(name: "Гдов", code: "s9603135")]
            )
        )
        cities.append(
            City(
                name: "Пустошка",
                stations: [Station(name: "Пустошка", code: "s9603005")]
            )
        )
        cities.append(
            City(
                name: "Бежаницы",
                stations: [Station(name: "Сущево", code: "s9603053")]
            )
        )
        cities.append(
            City(
                name: "Кунья",
                stations: [Station(name: "Кунья", code: "s9602969")]
            )
        )
        cities.append(
            City(
                name: "Дно",
                stations:
                    [
                        Station(name: "Дно", code: "s9603063"),
                        Station(name: "Дно-3 (551 км)", code: "s9603460")
                    ]
            )
        )
        cities.append(
            City(
                name: "Великие Луки",
                stations:
                    [
                        Station(name: "Великие Луки", code: "s9603033"),
                        Station(name: "481 км", code: "s9603646"),
                        Station(name: "Локомотивное депо", code: "s9635382"),
                        Station(name: "314 км", code: "s9655397")
                    ]
            )
        )
    }
}
