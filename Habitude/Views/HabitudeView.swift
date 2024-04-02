//
//  HabitudeView.swift
//  Habitude
//
//  Created by lorton baptiste on 13/03/2024.
//

import SwiftUI

struct HabitudeView: View {
    @EnvironmentObject var data : HabitudeViewModel
    
    var body: some View {
        NavigationView {
            List {
                Section(header:Text("À faire")) {
                    ForEach(data.habitudes) { habitude in
                        if (habitude.state == .todo){
                            NavigationLink (destination: ModifyHabitudeView(habitude: habitude)){
                                RowView(habitude: habitude)
                                    .onTapGesture {
                                        data.updateItem(habitude: habitude)
                                    }
                            }
                        }
                    }
                    .onDelete(perform: data.deleteItem)
                    .onMove(perform: data.moveItem)
                }
                Section(header:Text("Fait")) {
                    ForEach(data.habitudes) { habitude in
                        if (habitude.state == .done){
                            NavigationLink (destination: ModifyHabitudeView(habitude: habitude)){
                                RowView(habitude: habitude)
                                    .onTapGesture {
                                        data.updateItem(habitude: habitude)
                                    }
                            }
                        }
                    }
                    .onDelete(perform: data.deleteItem)
                    .onMove(perform: data.moveItem)
                }
            }
            .navigationTitle("Habitudes")
            .listStyle(GroupedListStyle())
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Ajouter", destination : AddHabitudeView())
                }
            }
        }
    }
}

struct HabitudeView_Previews: PreviewProvider {
    static var previews: some View {
        HabitudeView()
            .environmentObject(HabitudeViewModel())
    }
}
