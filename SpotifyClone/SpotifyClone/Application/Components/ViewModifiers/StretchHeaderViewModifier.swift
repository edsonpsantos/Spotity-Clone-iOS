//
//  StretchHeaderViewModifier.swift
//  SpotifyClone
//
//  Created by EDSON SANTOS on 01/04/2024.
//

import SwiftUI

struct StretchHeaderViewModifier: ViewModifier {
        
        var startingHeight: CGFloat = 300
        var coordinateSpace: CoordinateSpace = .global
        
        func body(content: Content) -> some View {
            GeometryReader(content: { geometry in
                content
                    .frame(width: geometry.size.width, height: stretchedHeight(geometry))
                    .clipped()
                    .offset(y: stretchedOffset(geometry))
            })
            .frame(height: startingHeight)
        }
        
        private func yOffset(_ geo: GeometryProxy) -> CGFloat {
            geo.frame(in: coordinateSpace).minY
        }
        
        private func stretchedHeight(_ geo: GeometryProxy) -> CGFloat {
            let offset = yOffset(geo)
            return offset > 0 ? (startingHeight + offset) : startingHeight
        }
        
        private func stretchedOffset(_ geo: GeometryProxy) -> CGFloat {
            let offset = yOffset(geo)
            return offset > 0 ? -offset : 0
        }
    }

    public extension View {
        
        func asStretchHeader(startingHeight: CGFloat) -> some View {
            modifier(StretchHeaderViewModifier(startingHeight: startingHeight))
        }
    }

    #Preview {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    Rectangle()
                        .fill(Color.green)
                        .overlay(
                            ZStack {
                                if #available(iOS 15.0, *) {
                                    AsyncImage(url: URL(string: "https://picsum.photos/800/800"))
                                }
                            }
    //                        Image(systemName: "heart.fill")
    //                            .resizable()
    //                            .scaledToFill()
    //                            .padding(100)
                        )
                        .asStretchHeader(startingHeight: 300)
                }
            }
        }
    }
