//
//  NewReleaseCell.swift
//  SpotifyClone
//
//  Created by EDSON SANTOS on 29/03/2024.
//

import SwiftUI

struct NewReleaseCell: View {
    
    var imageName: String = Constants.randomImage
    var headline: String? = "New Reelase from"
    var subheadline: String? = "Some Artist"
    var title: String? = "Some Playlist"
    var subtitle: String? = "Single - Title"
    
    var onAddToPlayListPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var body: some View {

        VStack(spacing: 16){
            HStack(spacing: 8){
                ImageLoaderView(urlString: imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2){
                    if let headline {
                        Text(headline)
                            .foregroundStyle(.spotifyLightGray)
                            .font(.callout)
                    }
                    
                    if let subheadline {
                        Text(subheadline)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.spotifyWhite)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(){
                ImageLoaderView(urlString: imageName)
                    .frame(width: 140, height: 140)
                
                VStack(alignment: .leading, spacing: 32){
                    VStack(alignment: .leading, spacing: 2){
                        if let title {
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.spotifyWhite)
                        }
                        
                        if let subtitle {
                            Text(subtitle)
                                .foregroundStyle(.spotifyLightGray)
                        }
                    }
                    .font(.callout)
                                        
                    HStack(spacing: 0){
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyLightGray)
                            .font(.title3)
                            .padding(4)
                            .background(.spotifyBlack.opacity(0.001))
                            .onTapGesture {
                                onAddToPlayListPressed?()
                            }
                            .offset(x: -4) // Alignment with the text before
                            .frame(maxWidth: .infinity, alignment: .leading)
                                                
                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.spotifyWhite)
                            .font(.title)
                    }
                }
                .padding(.trailing, 16)
            }
            .themeColors(isSelected: false)
            .cornerRadius(8)
            .onTapGesture {
                onPlayPressed?()
            }
        }
    }
}

#Preview {
    
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        
        NewReleaseCell()
            .padding()
        
    }
}
