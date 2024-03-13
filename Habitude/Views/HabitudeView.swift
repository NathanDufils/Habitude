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
                    Text("Done")
                    Text("To Do")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                List {
                    ForEach(data.habitudes) { habitude in
                        if ($state.wrappedValue == "To Do" && habitude.state == false){
                            RowView(habitude: habitude)
                        } else if ($state.wrappedValue == "Done" && habitude.state == true){
                            RowView(habitude: habitude)
                        } else if ($state.wrappedValue == "All") {
                            RowView(habitude: habitude)
                        }
                    }
                }
                .navigationTitle("Todo")
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
