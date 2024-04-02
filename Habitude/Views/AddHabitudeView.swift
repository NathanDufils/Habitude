//
//  AddHabitudeView.swift
//  Habitude
//
//  Created by bertomeu tom on 20/03/2024.
//

import SwiftUI

struct AddHabitudeView: View {
    
    @State private var habitudeTitle: String = ""
    @State private var selectedQuantity: Int = 1
    @State private var selectedType: Type = .n
    @EnvironmentObject var data: HabitudeViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 16) {
            titleTextField
            objectivePicker
            unitPicker
            Spacer()
            addButton
        }
        .padding(14)
        .navigationTitle("Ajouter une habitude")
    }
    
    private var titleTextField: some View {
        TextField("Enter votre habitude", text: $habitudeTitle)
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
    
    private var addButton: some View {
        Button(action: {
            data.addItem(title: habitudeTitle, quantity: selectedQuantity, unit: selectedType)
            presentationMode.wrappedValue.dismiss()
        }) {
            Text("Ajouter")
                .foregroundColor(.white)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(50)
        }
    }
}

struct AddHabitudeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddHabitudeView()
        }
    }
}
