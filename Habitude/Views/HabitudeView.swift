//
//  HabitudeView.swift
//  Habitude
//
//  Created by lorton baptiste on 13/03/2024.
//

import SwiftUI

struct HabitudeView: View {
    
    @State var state: String = "All"
    var data: [Habitude]
    
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
                    ForEach(data) { habitude in
                        if ($state.wrappedValue == "To Do" && habitude.state == false){
                            RowView(habitude: habitude)
                        } else if ($state.wrappedValue == "Done" && habitude.state == true){
                            RowView(habitude: habitude)
                        } else if ($state.wrappedValue == "All") {
                            RowView(habitude: habitude)
                        }
                    }
                }
                
                .navigationTitle("Habitudes")
                .listStyle(PlainListStyle())
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink("Add", destination: EmptyView())
                    }
                }
            }
        }
    }
}

struct HabitudeView_Previews: PreviewProvider {
    static var previews: some View {
        HabitudeView(data: Habitude.testData)
    }
}
