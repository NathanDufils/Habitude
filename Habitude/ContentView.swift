//
//  ContentView.swift
//  Habitude
//
//  Created by lorton baptiste on 20/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HabitudeView() // Premier onglet avec HabitudeView
                .environmentObject(HabitudeViewModel())
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Habitudes")
                }
                .tag(0)
            
            DataView()
                .tabItem{
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("Données")
                }
                .tag(1)
            ParamView()
                .tabItem{
                    Image(systemName: "gearshape.2.fill")
                    Text("Paramètres")
                }
                .tag(2)
        }
    }
}
