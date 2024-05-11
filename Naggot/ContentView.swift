//
//  ContentView.swift
//  Naggot
//
//  Created by Pete Louise Brooks-Asclepiadoideae on 5/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var cyclingColors = false
    @State private var currentColor: Color = .blue
    let colors: [Color] = [.red, .green, .blue, .orange, .purple, .pink]
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text("This is your full-screen notification!")
                .font(.largeTitle)
                .foregroundColor(.white)
            Button(action: {
                NSApp.keyWindow?.close()
            }) {
                Text("Dismiss")
                .padding()
                .frame(minWidth: 100)
                .background(Color.white.opacity(0.2))
                .foregroundColor(.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 2)
                )
            }
            .padding()
            .buttonStyle(PlainButtonStyle())
            Toggle("Cycle Colors", isOn: $cyclingColors)
                .padding()
                .foregroundColor(.white)
                NSApp.keyWindow?.close()
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(cyclingColors ? currentColor : Color.blue)
        .edgesIgnoringSafeArea(.all)  // Ensures the view extends into the safe area
        .onReceive(timer) { _ in
            if cyclingColors {
                currentColor = colors.randomElement() ?? .blue
            }
        }
    }
}
