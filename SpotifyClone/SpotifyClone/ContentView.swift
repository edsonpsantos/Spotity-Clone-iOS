//
//  ContentView.swift
//  SpotifyClone
//
//  Created by EDSON SANTOS on 29/03/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users: [User] = []
    @State private var products: [Product] = []
    
    var body: some View {
        ScrollView {
            VStack{
                ForEach(products){ product in
                    Text(product.title)
                }
            }
        }
        .padding()
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do{
            users = try await DataBaseHelper().getUsers()
            products = try await DataBaseHelper().getProduct()
        }
        catch{}
    }
}

#Preview {
    ContentView()
}
