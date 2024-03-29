//
//  HomeView.swift
//  SpotifyClone
//
//  Created by EDSON SANTOS on 29/03/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                
                LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders], content: {
                    Section {
                        ForEach(0..<20) { _ in
                            Rectangle()
                                .fill(.red)
                                .frame(width: 200, height: 200)
                        }
                    } header: {
                        header
                    }
                })
                .padding(.top, 8)
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do{
            currentUser = try await DataBaseHelper().getUsers().first
        }
        catch{}
    }
    
    private var header: some View{
        HStack(spacing: 0){
            ZStack{
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                        }
                }
            }
            .frame(width: 35, height: 35)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8){
                    ForEach(Category.allCases, id: \.self) { category in
                        CategoryCell(title: category.rawValue.capitalized,
                                     isSelected: category == selectedCategory)
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .background(.spotifyBlack)
    }
}

#Preview {
    HomeView()
}
