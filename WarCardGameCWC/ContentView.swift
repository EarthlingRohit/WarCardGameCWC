//
//  ContentView.swift
//  WarCardGameCWC
//
//  Created by Rohit Singh on 2022-12-10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard = "card2"
    @State private var cpuCard = "card3"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
        ZStack{
            
            // Background image.
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            // User interface.
            VStack{
                
                Spacer()
                // Game logo.
                Image("logo")
                
                Spacer()
                // Card deck.
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                
                Spacer()
                // Deal button.
                Button {
                    // Generate random numbers between 2 and 14.
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    // Update cards.
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    // Update scores.
                    if playerRand > cpuRand {
                        playerScore += 1
                    } else if playerRand < cpuRand {
                        cpuScore += 1
                    }
                } label: {
                    Image("dealbutton")
                }
                
                Spacer()
                // Score deck.
                HStack{
                    Spacer()
                    VStack{
                        // Player score.
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack{
                        // CPU score.
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(Color.white)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
