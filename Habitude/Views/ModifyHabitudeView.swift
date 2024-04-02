//
//  ModifyHabitudeView.swift
//  Habitude
//
//  Created by Dufils Nathan on 26/03/2024.
//

import SwiftUI

struct ModifyHabitudeView: View {
    
    var habitude: Habitude
    @State private var habitudeTitle: String = ""
    @State private var selectedQuantity: Int
    @State private var selectedType: Type
    @EnvironmentObject var data: HabitudeViewModel
    @Environment(\.presentationMode) var presentationMode
    
    init(habitude: Habitude) {
        self.habitude = habitude
        self._habitudeTitle = State(initialValue: habitude.title)
        self._selectedQuantity = State(initialValue: habitude.quantity)
        self._selectedType = State(initialValue: habitude.type)
    }
    
    var body: some View {
        VStack(spacing: 16) {
            titleTextField
            objectivePicker
            unitPicker
            Spacer()
            modifyButton
        }
        .padding(14)
        .navigationTitle("Modifier votre habitude")
    }
    
    private var titleTextField: some View {
        TextField(habitude.title, text: $habitudeTitle)
            .padding(.horizontal)
            .frame(height: 55)
            .background(Color(.systemGray5))
            .cornerRadius(10)
    }
    
    private var objectivePicker: some View {
        VStack {
            Text("Objectif")
                .font(.headline)
                .foregroundColor(.secondary)
            Picker(selection: $selectedQuantity, label: Text("Sélectionner une quantité")) {
                ForEach(1...10, id: \.self) {
                    Text("\($0)").tag($0)
                }
                ForEach(1...8, id: \.self) {
                    Text("\(10+$0*5)").tag(10+$0*5)
                }
                ForEach(1...19, id: \.self) {
                    Text("\(50+$0*50)").tag(50+$0*50)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .padding(.horizontal)
            .background(Color(.systemGray6))
            .cornerRadius(10)
        }
    }
    
    private var unitPicker: some View {
        VStack {
            Text("Unité")
                .font(.headline)
                .foregroundColor(.secondary)
            Picker(selection: $selectedType, label: Text("Sélectionner une unité")) {
                ForEach(Type.allCases, id: \.self) { type in
                    Text(type == .n ? "Aucune" : type.rawValue).tag(type)
                }
            }
            .padding(.horizontal)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .pickerStyle(.menu)
        }
    }
    
    private var modifyButton: some View {
        Button(action: {
            data.modifyItem(id: habitude.id, title: habitudeTitle, quantity: selectedQuantity, unit: selectedType)
            presentationMode.wrappedValue.dismiss()
        }) {
            Text("Modifier")
                .foregroundColor(.white)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}

struct ModifyHabitudeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ModifyHabitudeView(habitude: Habitude.testData[0])
        }
    }
}
