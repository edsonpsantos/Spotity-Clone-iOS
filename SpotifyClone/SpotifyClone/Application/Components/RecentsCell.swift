//
//  RecentsCell.swift
//  SpotifyClone
//
//  Created by EDSON SANTOS on 29/03/2024.
//

import SwiftUI

struct RecentsCell: View {
    
    var imageName: String = Constants.randomImage
    var title: String = "Some random title"
    
    var body: some View {
        HStack(spacing: 16){
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)

            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
        }
        .foregroundStyle(.yellow)
        .padding(.trailing, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .themeColors(isSelected: false)
        .cornerRadius(6)
    }
}

#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        VStack{
            HStack{
                RecentsCell()
                RecentsCell()
            }
            HStack{
                RecentsCell()
                RecentsCell()
            }
        }
        
    }
}
