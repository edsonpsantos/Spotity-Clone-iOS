//
//  MuscRowCell.swift
//  SpotifyClone
//
//  Created by EDSON SANTOS on 01/04/2024.
//

import SwiftUI

struct MusicRowCell: View {

    var imageSize: CGFloat = 50
    var imageName: String = Constants.randomImage
    var title: String = "Music Title"
    var subtitle: String? = "Music Subtitle"
    
    var onCellPressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    
    
    var body: some View {
        
        HStack(spacing: 8){
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            VStack(alignment: .leading, spacing: 4){
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundStyle(.spotifyWhite)
               
                if let subtitle {
                    Text(subtitle)
                        .font(.callout)
                        .foregroundStyle(.spotifyLightGray)
                }
            }
            .lineLimit(2)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Image(systemName: "ellipsis")
                .font(.subheadline)
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .background(Color.spotifyBlack.opacity(0.001))
                .onTapGesture {
                    onEllipsisPressed?()
                }
        }
        .background(Color.spotifyBlack.opacity(0.001))
        .onTapGesture {
            onCellPressed?()
        }
        
    }
}

#Preview {
    
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        
        VStack{
            MusicRowCell()
            MusicRowCell()
            MusicRowCell()
            MusicRowCell()
            MusicRowCell()
        }
    }
}
