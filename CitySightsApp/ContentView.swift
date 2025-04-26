//
//  ContentView.swift
//  CitySightsApp
//
//  Created by Gerald Zhao on 4/26/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var query: String = ""
    var service = DataService()
    
    var body: some View {
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
        .padding(20)
        .task {
            await service.businessSearch()
        }
        
    }
}

#Preview {
    ContentView()
}
