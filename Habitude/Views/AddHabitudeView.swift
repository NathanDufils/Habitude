//
//  AddHabitudeView.swift
//  Habitude
//
//  Created by bertomeu tom on 20/03/2024.
//

import SwiftUI

struct AddHabitudeView: View {
    
    @State var habitudeTitle: String = ""
    
    @EnvironmentObject var data: HabitudeViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("Entrer votre habitude", text: $habitudeTitle)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(.systemGray5))
                .cornerRadius(10)
            
            List(Type.allCases, id: \.self) { type in
                Text(type == .n ? "Aucune" : type.rawValue)
            }
            .padding(.horizontal)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            
            Button {
                
            } label: {
                Text("Ajouter")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding(14)
        .navigationTitle("Ajouter une habitude")
    }
}

struct AddHabitudeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddHabitudeView()
        }
    }
}
