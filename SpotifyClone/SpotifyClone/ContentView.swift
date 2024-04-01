//
//  ContentView.swift
//  SpotifyClone
//
//  Created by EDSON SANTOS on 29/03/2024.
//

import SwiftUI
import SwiftfulRouting

struct ContentView: View {
    
    @Environment(\.router) var router
    
    var body: some View {
        List{
            Button("Open Spotify UI Clone"){
                router.showScreen(.fullScreenCover){_ in
                        HomeView()
                }
            }
        }
    }
}

#Preview {
    RouterView{ _ in
        ContentView()
    }
}
