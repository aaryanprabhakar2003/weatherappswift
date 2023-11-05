//
//  mainview.swift
//  weatherapp
//
//  Created by Aaryan Prabhakar on 05/11/23.
//

import SwiftUI

struct mainview: View {
    let now=Date()
    @State private var searchtxt:String=""
    @State private var cat:catdata?
    let columns=[GridItem(.fixed(160)),GridItem(.fixed(160))]
    var body: some View {
       
        ZStack{
        
                Color("bgcolor")
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    ScrollView{
                    VStack{
                        
                        HStack(spacing:20){
                            TextField("Search City",text: $searchtxt)
                                .padding()
                                .background(Color(.white))
                                .autocorrectionDisabled()
                              
                                .foregroundColor(.black)
                                .frame(width: 280)
                               
                             
                            .cornerRadius(20)
                            Button {
                                refresh()
                                
                            } label: {
                                Image(systemName: "magnifyingglass.circle.fill")
                                 
                                    .foregroundColor(.white)
                                    .font(.system(size: 40))
                                
                                    
                            }

                        }
                        
                       
                         
                            
                        HStack{
                            Text("TODAY")
                                .font(.custom("teko", size: 35))
                                .bold()
                                .textCase(.uppercase)
                                .foregroundColor(.white)
                            
                            
                            
                            Text(now,format:Date.FormatStyle().day().month().year())
                                .font(.custom("teko", size: 35))
                                .bold()
                                .textCase(.uppercase)
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth:.infinity,alignment: .leading)
                        
                        HStack(spacing:15){
                            
                            /*Image(systemName: "location.circle")
                             .foregroundColor(.white)
                             .font(.system(size: 18))*/
                            //Text("Chandigarh")
                            Text(cat?.name ?? "")
                                .font(.custom("teko", size: 25))
                                .bold()
                                .textCase(.uppercase)
                                .foregroundColor(.white)
                            
                          
                        }
                        .frame(maxWidth:.infinity,alignment: .leading)
                        HStack{
                            //Text("Cloudy")
                            Text(cat?.weather[0].main ?? "")
                                .font(.custom("teko", size: 21))
                                .bold()
                                .textCase(.uppercase)
                                .foregroundColor(.white)
                                .offset(y:30)
                        }
                        .frame(maxWidth:.infinity,alignment: .leading)
                    }
                    //.frame(maxWidth:.infinity,alignment: .leading)
                    .padding()
                    
                    Spacer()
                    
                    VStack{
                        Image("cloudy")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200,height: 200)
                            .padding(.vertical)
                        
                        
                        
                        //Text("26*")
                        Text((String(format: "%.f", cat?.main.temp ?? 0)) + "°C")


                            .foregroundColor(.white)
                            .font(.custom("teko", size: 100))
                            .bold()
                            .padding(.vertical,-30)
                            .frame(maxWidth: .infinity,alignment: .center)
                        
                        
                        Spacer()
                        
                     
                        
                      
                        
       

                        
                    }
                    
                }
            }
        }
        .task {
            do{
                cat=try await getuser()
            }
            catch{
                print("error")
            }
        }
    }
    
    func refresh(){
        Task {
            do{
                cat=try await getuser()
            }
            catch{
                print("errrpr")
            }
        }
    }
    
    
    
    func getuser()async throws-> catdata{
       // let endpoint="https://catfact.ninja/fact"
        //let endpoint="https://api.genderize.io/?name=luc"
        //let endpoint="https://official-joke-api.appspot.com/random_joke"
       // let endpoint="https://api.coindesk.com/v1/bpi/currentprice.json"
        let endpoint="https://api.openweathermap.org/data/2.5/weather?q=\(searchtxt)&appid=03bd4cb91e752bd1f299ce4f9e7c0a36&units=metric"
        guard let url=URL(string:endpoint)else{ throw catdataerror.invalidurl}
                let (data,response)=try await URLSession.shared.data(from: url)
        guard let response=response as? HTTPURLResponse,response.statusCode==200 else{throw catdataerror.invaliddata}
        do{
            let decoder=JSONDecoder()
            
            return try decoder.decode(catdata.self, from: data)
     
        }
        
        
                
        
        
        
    }
}



struct catdata: Decodable {
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
        var temp: Float
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
}


struct mainview_Previews: PreviewProvider {
    static var previews: some View {
        mainview()
    }
}
