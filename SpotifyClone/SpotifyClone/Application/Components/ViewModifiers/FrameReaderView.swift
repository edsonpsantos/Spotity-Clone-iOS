//
//  FrameReaderView.swift
//  SpotifyClone
//
//  Created by EDSON SANTOS on 01/04/2024.
//

import SwiftUI

@available(iOS 14, *)
/// Adds a transparent View and read it's frame.
///
/// Adds a GeometryReader with infinity frame.
struct FrameReaderView: View {
    
    let coordinateSpace: CoordinateSpace
        let onChange: (_ frame: CGRect) -> Void
        
        public init(coordinateSpace: CoordinateSpace, onChange: @escaping (_ frame: CGRect) -> Void) {
            self.coordinateSpace = coordinateSpace
            self.onChange = onChange
        }

        public var body: some View {
            GeometryReader { geo in
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .onAppear(perform: {
                        onChange(geo.frame(in: coordinateSpace))
                    })
                    .onChange(of: geo.frame(in: coordinateSpace), perform: onChange)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    @available(iOS 14, *)
    public extension View {
        
        /// Get the frame of the View
        ///
        /// Adds a GeometryReader to the background of a View.
        func readingFrame(coordinateSpace: CoordinateSpace = .global, onChange: @escaping (_ frame: CGRect) -> ()) -> some View {
            background(FrameReaderView(coordinateSpace: coordinateSpace, onChange: onChange))
        }
    }

    @available(iOS 14, *)
    struct FrameReader_Previews: PreviewProvider {
        
        struct PreviewView: View {
            
            @State private var yOffset: CGFloat = 0
            
            var body: some View {
                ScrollView(.vertical) {
                    VStack {
                        Text("")
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .cornerRadius(10)
                            .background(Color.green)
                            .padding()
                            .readingFrame { frame in
                                yOffset = frame.minY
                            }
                        
                        ForEach(0..<30) { x in
                            Text("")
                                .frame(maxWidth: .infinity)
                                .frame(height: 200)
                                .cornerRadius(10)
                                .background(Color.green)
                                .padding()
                        }
                    }
                }
                .coordinateSpace(name: "test")
                .overlay(Text("Offset: \(yOffset)"))
            }
        }

        static var previews: some View {
            PreviewView()
        }
    }
