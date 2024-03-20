//
//  HabitudeViewModel.swift
//  Habitude
//
//  Created by Dufils Nathan on 13/03/2024.
//

import Foundation

class HabitudeViewModel: ObservableObject {
    
    @Published var habitudes: [Habitude] = []
    
    init() {
        getHabitudes()
    }
    func getHabitudes() {
        habitudes.append(contentsOf: Habitude.testData)
    }
    
    func deleteItem(indexSet: IndexSet) {
        habitudes.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        habitudes.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String,quantity: Double, priority: Type) {
        let newHabitude = Habitude(title: title, quantity: quantity, type: priority, state: .todo)
        habitudes.append(newHabitude)
    }
    
    func Toggle(index: Int) {
        if habitudes[index].state.rawValue == "Done" {
            habitudes[index].state = .todo
        }
        else{
            habitudes[index].state = .done
        }
    }
    
    func updateItem(habitude: Habitude) {
        for (index, hb) in habitudes.enumerated() {
            if hb.id == habitude.id {
                Toggle(index: index)
            }
        }
    }
    
}
