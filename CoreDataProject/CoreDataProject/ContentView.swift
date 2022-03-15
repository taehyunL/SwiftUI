//
//  ContentView.swift
//  CoreDataProject
//
//  Created by 이태현 on 2022/03/13.
//

import SwiftUI

struct ContentView: View {
//    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>
    let coreDM: DataController
    @State var countries: [Country] = []
    
    func populateCountries() {
        countries = coreDM.getAllCountries()
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(countries, id: \.self) { country in
                    Section(country.wrappedFullName) {
                        ForEach(country.candyArray, id: \.self) { candy in
                            Text(candy.wrappedName)
                        }
                    }
                }
            }
            
            Button("Add") {
                coreDM.saveCandy(name: "Mars", shortName: "UK", fullName: "United Kingdom")
                
                coreDM.saveCandy(name: "KitKat", shortName: "UK", fullName: "United Kingdom")
                
                coreDM.saveCandy(name: "Twix", shortName: "UK", fullName: "United Kingdom")
                
                coreDM.saveCandy(name: "gana", shortName: "UK", fullName: "United Kingdom")
                
                coreDM.saveCandy(name: "Toblerone", shortName: "CH", fullName: "Switzerland")
                
                coreDM.saveCandy(name: "Toblerone2", shortName: "CH", fullName: "Switzerland")
            }
            
            Button("View") {
                populateCountries()
            }
        }
        .onAppear{
            populateCountries()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: DataController())
    }
}
