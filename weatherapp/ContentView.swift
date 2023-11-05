//
//  ContentView.swift
//  weatherapp
//
//  Created by Aaryan Prabhakar on 05/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var searchtxt:String=""
   // @State private var cat:catdata?
    var body: some View {
        ZStack {
       
            List{
                /*Text("\(cat?.coord.lon ?? 0.0)")
                Text("\(cat?.coord.lat ?? 0.0)")
                Text("\(cat?.main.temp ?? 0.0)")
                Text("\(cat?.wind.speed ?? 0.0)")
                Text(cat?.weather[0].main ?? "")
                Text(cat?.weather[0].description ?? "")*/
                
              

    
                
                
                
              

               
                
            }
            .listStyle(.inset)
           // Text(cat?.punchline ?? "")
          
            VStack{
                TextField("search loction", text: $searchtxt)
                Button {
                    //refresh()
                } label: {
                    Text("ckck")
                }

            }
          
       
            
            
           
          

        }
       /* .task {
            do{
                cat=try await getuser()
            }
            catch{
                print("error")
            }
        }*/
        .padding()
    }
    
    /*func refresh(){
        Task {
            do{
                cat=try await getuser()
            }
            catch{
                print("errrpr")
            }
        }
    }*/
        
    
    
    
   /* func getuser()async throws-> catdata{
       // let endpoint="https://catfact.ninja/fact"
        //let endpoint="https://api.genderize.io/?name=luc"
        //let endpoint="https://official-joke-api.appspot.com/random_joke"
       // let endpoint="https://api.coindesk.com/v1/bpi/currentprice.json"
        let endpoint="https://api.openweathermap.org/data/2.5/weather?q=\(searchtxt)&appid=03bd4cb91e752bd1f299ce4f9e7c0a36"
        guard let url=URL(string:endpoint)else{ throw catdataerror.invalidurl}
                let (data,response)=try await URLSession.shared.data(from: url)
        guard let response=response as? HTTPURLResponse,response.statusCode==200 else{throw catdataerror.invaliddata}
        do{
            let decoder=JSONDecoder()
            
            return try decoder.decode(catdata.self, from: data)
     
        }
        
        
                
        
        
        
    }*/
}



/*struct catdata:Codable{
    let fact:String
    let length:Int
}*/
/*struct catdata:Codable{
    let count:Int
    let name:String
    let gender:String
    let probability:Double
}*/
/*struct catdata:Codable{
    let type:String
    let setup:String
    let punchline:String
    let id:Int
}*/

/*struct catdata:Codable{
        let time: Time
        let disclaimer: String
        let chartName: String
        let bpi: BPI
}
struct Time:Codable{
    let updated: String
       let updatedISO: String
       let updateduk: String
    
}
struct BPI: Codable {
    let USD: Currency
    let GBP: Currency
    let EUR: Currency
}
struct Currency: Codable {
    let code: String
    let symbol: String
    let rate: String
    let description: String
    let rateFloat: Double
    
    enum CodingKeys: String, CodingKey {
           case code, symbol, rate, description
           case rateFloat = "rate_float"
       }
}*/
/*struct catdata:Codable{
    let request: Request
    let location: Location
    let current: Current
    
    
    struct Request: Codable {
        let type: String
        let query: String
        let language: String
        let unit: String
    }
    struct Location: Codable {
        let name: String
        let country: String
        let region: String
        let lat: String
        let lon: String
        let timezoneId: String
        let localtime: String
        let localtimeEpoch: Int
        let utcOffset: String
        
        enum CodingKeys: String, CodingKey {
            case name, country, region, lat, lon
            case timezoneId = "timezone_id"
            case localtime, localtimeEpoch = "localtime_epoch"
            case utcOffset = "utc_offset"
        }
    }
    struct Current: Codable {
        let observationTime: String
        let temperature: Int
        let weatherCode: Int
        let weatherIcons: [String]
        let weatherDescriptions: [String]
        let windSpeed: Int
        let windDegree: Int
        let windDir: String
        let pressure: Int
        let precip: Int
        let humidity: Int
        let cloudcover: Int
        let feelslike: Int
        let uvIndex: Int
        let visibility: Int
        let isDay: String
        
        enum CodingKeys: String, CodingKey {
            case observationTime = "observation_time"
            case temperature,weatherCode = "weather_code", weatherIcons = "weather_icons", weatherDescriptions = "weather_descriptions"
            case windSpeed = "wind_speed", windDegree = "wind_degree", windDir = "wind_dir", pressure, precip, humidity, cloudcover, feelslike, uvIndex = "uv_index", visibility
            case isDay = "is_day"
        }
    }
}*/


/*struct catdata: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}



enum catdataerror:Error{
    case invalidurl
    case invaliddata
}*/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
