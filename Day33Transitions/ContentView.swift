//
//  ContentView.swift
//  Day33 Transitions
//  100 Days Of SwiftUI  @TwoStraws Paul Hudson
//  Student: yannemal on 20/07/2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - DATA
    
    @State private var angleBrownBoxes = -30.0
    
    @State private var isShowingOrange = false
    
    
    var body: some View {
        // MARK: - VIEW didload
        ZStack {
            
            // bottom layer
            ZStack {
                Rectangle()
                    .fill(.brown)
                    .frame(width: 980, height: 370)
                    .rotationEffect(.degrees(angleBrownBoxes))
                    .animation(.linear(duration: 40.0)
                            .repeatForever(autoreverses: false)
                               ,value: angleBrownBoxes)
                    .opacity(0.3)
                    .offset(x: 50)
                // layer 2
                Rectangle()
                    .fill(.brown)
                    .frame(width: 980, height: 300)
                    .rotationEffect(.degrees(angleBrownBoxes))
                    .animation(.linear(duration: 40.0)
                        .repeatForever(autoreverses: false)
                               ,value: angleBrownBoxes)
                    .offset(x: 50)
            } // end ZStack brown rects : separate ZS otherwise EVERYTHING rotates
            .onAppear {
                angleBrownBoxes += 360.0
            }
            
            // layer 3
            VStack {
                
                Button("Scratch here 🧚🏻‍♀️") {
                    withAnimation {
                        isShowingOrange.toggle()
                    }
                }
                .font(.system(.largeTitle))
                .foregroundColor(.primary)
                
                if isShowingOrange {
                    Rectangle()
                        .fill(.orange)
                        .frame(width: 200, height: 200)
                        .transition(.asymmetric(insertion: .offset(y:1000)
                                                .combined(with: .scale)
                                                ,
                                                
                                                removal: .push(from: .top)))
                    // issues in Canvas insertion but removal ok. better in sim
                }
            } // endVStack
            .padding()
        } //endZstack
    } // end body View
    
// MARK: - METHODS
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
