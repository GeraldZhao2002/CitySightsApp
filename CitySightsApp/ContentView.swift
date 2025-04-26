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
            
            List (businesses) { b in
                Text(b.name ?? "Nil")
                
            }
        }
        .padding(20)
        .task {
            businesses = await service.businessSearch()
        }
        
    }
}

#Preview {
    ContentView()
}
