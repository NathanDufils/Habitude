//
//  HabitudeView.swift
//  Habitude
//
//  Created by lorton baptiste on 13/03/2024.
//

import SwiftUI

struct HabitudeView: View {
    
    @State var state: String = "All"
    @EnvironmentObject var data : HabitudeViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("State", selection: $state){
                    Text("All")
                    ForEach(Etat.allCases, id: \.self) {
                        state in
                        Text(state.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                List {
                    ForEach(data.habitudes) { habitude in
                        if (habitude.state.rawValue == $state.wrappedValue || $state.wrappedValue == "All"){
                            RowView(habitude: habitude)
                                .onTapGesture {
                                    data.updateItem(habitude: habitude)
                                }
                        }
                    }
                    .onDelete(perform: data.deleteItem)
                    .onMove(perform: data.moveItem)
                }
                .navigationTitle("Habitudes")
                .listStyle(PlainListStyle())
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
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
