//
//  InformationsView.swift
//  Habitude
//
//  Created by lorton baptiste on 27/03/2024.
//

import SwiftUI

struct InformationsView: View {
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Text("Cette application a été développée par :")
                    .padding()
                Text("Tom BERTOMEU")
                    .bold()
                    .font(.system(size: 30))
                    .padding()
                Text("Nathan DUFILS")
                    .bold()
                    .font(.system(size: 30))
                    .padding()
                Text("Baptiste LORTON")
                    .bold()
                    .font(.system(size: 30))
                    .padding()
                Spacer()
                Spacer()
            }
            .navigationTitle("Informations")
        }
    }
}

struct InformationsView_Previews: PreviewProvider {
    static var previews: some View {
        InformationsView()
    }
}
