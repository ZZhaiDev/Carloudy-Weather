# Carloudy-Weather

##Demo:
![](https://github.com/zijiazhai/Carloudy-News/blob/master/githubImages/weather-dem0.gif)

## Catch Weather Data:
#### Codable Struct
```
    class CatchWeatherData: NSObject, Codable {
        var timeStamp: Double?
        var tableViewData: TableModel?
        var collectionData: CollectionModel?
    }

    struct CollectionModel: Codable {
        var cnt: Int?
        var list: [List]?
        var city: City?
    }

    struct TableModel: Codable {
        var location: Location?
        var current: Current?
        var forecast: Forecast?
     }
     
    ......
```
####  JSONEncoder, convert dictionary to Data to jsonString, then save it on your phone.
```
      let dict = CatchWeatherData()
          dict.timeStamp = timestamp
          dict.collectionData = collectionData
          dict.tableViewData = tableViewData
    
          if let jsonData = try? JSONEncoder().encode(dict) {
              if let jsonString = String(data: jsonData, encoding: .utf8) {
                    let defaults = UserDefaults.standard
                    defaults.set(jsonString, forKey: currentCity.lowercased())
              } 
          }
```
####  JSONDecoder, retrieve the data from your phone, then convert jsonString to data to dictionary.
```
    let defaults = UserDefaults.standard
        let jsonString = defaults.string(forKey: currentCity.lowercased())
        if let data = jsonString?.data(using: .utf8){
            do {
                let json = try JSONDecoder().decode(CatchWeatherData.self, from: data)
                if let timestamp = json.timeStamp, let tableViewModel = json.tableViewData, let collectionModel = json.collectionData {
                    ZJPrint(timestamp)
                    ZJPrint(tableViewModel)
                    ZJPrint(collectionModel)
                }
            } catch let jsonError {
                ZJPrint(jsonError)
            }
        }
```
