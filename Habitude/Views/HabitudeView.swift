//
//  HabitudeView.swift
//  Habitude
//
//  Created by lorton baptiste on 13/03/2024.
//

import SwiftUI

struct HabitudeView: View {
    
    @State var type: String = "All"
    var data: [Habitude]
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Type", selection: $type){
                    Text("All")
                    ForEach(Type.allCases, id: \.self) {
                        type in
                        Text(type.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                List {
                    ForEach(data) { habitude in
                        if (habitude.type.rawValue == $type.wrappedValue || $type.wrappedValue == "All"){
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
