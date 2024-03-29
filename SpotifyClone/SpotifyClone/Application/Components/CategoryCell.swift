//
//  CategoryCell.swift
//  SpotifyClone
//
//  Created by EDSON SANTOS on 29/03/2024.
//

import SwiftUI

struct CategoryCell: View {
    
    var title: String = "All"
    var isSelected: Bool = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 48)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .themeColors(isSelected: isSelected)
            .cornerRadius(16)
    }
}

extension View {
    func themeColors(isSelected: Bool) -> some View {
        self
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        
        VStack(spacing: 40) {
            CategoryCell(title: "Title goes here")
            CategoryCell(title: "Title goes here", isSelected: true)
            CategoryCell(isSelected: true)
        }
    }
}
