//
//  ContentView.swift
//  CitySightsApp
//
//  Created by Gerald Zhao on 4/26/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var businesses = [Business]()
    @State var query: String = ""
    var service = DataService()
    
    var body: some View {
        
        VStack {
            HStack {
                TextField("What are you looking for?", text:$query)
                Button {
                    // TODO: implement query
                } label: {
                    Text("Go")
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            
            List {
                ForEach(businesses) { b in
                    VStack{
                        HStack (spacing:0) {
                            Image("list-placeholder-image")
                                .padding(.trailing, 16)
                            VStack(alignment: .leading){
                                Text(b.name ?? "Restaurant").bold()
                                Text(TextHelper.distanceAway(meters: b.distance ?? 0))
                                    
                            }
                            Spacer()
                            Image("regular_\(b.rating ?? 0)")
                        }
                        Divider()
                    }
                }
                .listRowSeparator(.hidden)
                
            }
            .listStyle(.plain)
        }
        
        .task {
            businesses = await service.businessSearch()
        }
        
    }
}

#Preview {
    ContentView()
}
