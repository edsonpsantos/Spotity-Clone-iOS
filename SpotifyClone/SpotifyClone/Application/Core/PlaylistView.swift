//
//  PlayListView.swift
//  SpotifyClone
//
//  Created by EDSON SANTOS on 01/04/2024.
//

import SwiftUI
import SwiftfulRouting

struct PlaylistView: View {
    
    @Environment(\.router) var router
    
    var product: Product = .mockProduct
    var user: User = .mock
    
    @State private var products: [Product] = []
    @State private var showHeader: Bool = true
    @State private var offSet: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical){
                LazyVStack(spacing: 12){
                    PlaylistHeaderCell(
                        height: 250,
                        title: product.title,
                        subtitle: product.brand,
                        imageName: product.thumbnail
                    )
                    .readingFrame { frame in
                        showHeader = frame.maxY < 150
                    }
                }
                
                PlaylistDescriptionCell(
                    descriptionText: product.description,
                    userName: user.firstName,
                    subheadline: product.category,
                    onAddToPlaylistPressed: nil,
                    onDownloadPressed: nil,
                    onSharePressed: nil,
                    onEllipsisPressed: nil,
                    onShufflePressed: nil,
                    onPlayPressed: nil
                )
                .padding(.horizontal, 16)
                
                ForEach(products) { product in
                    MusicRowCell(
                        imageSize: 50,
                        imageName: product.thumbnail,
                        title: product.title,
                        subtitle: product.brand,
                        onCellPressed: {
                            goToPlayListView(product: product)
                        },
                        onEllipsisPressed: {
                            
                        }
                    )
                }
                .padding(.leading, 16)
            }
            .scrollIndicators(.hidden)
            
            header
                      
            .frame(maxHeight: .infinity, alignment: .top)
            
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func goToPlayListView(product: Product){
        router.showScreen(.push){_ in
            PlaylistView(product: product)
        }
    }
    
    private var header: some View{
        ZStack{
            Text(product.title)
                .font(.headline)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(Color.spotifyBlack)
                .offset(y: showHeader ? 0 : -40)
                .opacity(showHeader ? 1 : 0)
            
            Image(systemName: "chevron.left")
                .font(.title3)
                .padding(10)
                .background(showHeader ? Color.spotifyBlack.opacity(0.001) : .spotifyGray.opacity(0.7))
                .clipShape(Circle())
                .onTapGesture {
                    router.dismissScreen()
                }
                .padding(.leading, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundStyle(.spotifyWhite)
        .animation(.smooth(duration: 0.2), value: showHeader)
    }
    
    private func getData() async {
        do{
            products = try await Array(DataBaseHelper().getProducts())
        }
        catch{}
    }
}

#Preview {
    RouterView { _ in
        PlaylistView()
    }
}
