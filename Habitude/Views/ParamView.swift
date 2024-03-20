//
//  ParamView.swift
//  Habitude
//
//  Created by lorton baptiste on 20/03/2024.
//

import SwiftUI

struct ParamView: View {
    var body: some View {
        NavigationView{
            List{
                Section(header:Text("Affichage")){
                    Text("Thème")
                    Text("Mon compte")
                }
                Section(header:Text("Modes")){
                    Text("Modes d'édition")
                }
                Section(header:Text("Plus")){
                    Text("Informations")
                }
            }
            .navigationTitle("Paramètres")
        }
        
    }
}

struct ParamView_Previews: PreviewProvider {
    static var previews: some View {
        ParamView()
    }
}
