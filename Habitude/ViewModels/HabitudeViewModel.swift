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
    
    func addItem(title: String,quantity: Int, unit: Type) {
        let newHabitude = Habitude(title: title, quantity: quantity, type: unit, state: .todo, date: Date.now)
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
        let index = findItem(id: habitude.id)
        if index != -1 {
            Toggle(index: index)
        }
    }
    
    func findItem(id:UUID) -> Int{
        for (index, hb) in habitudes.enumerated() {
            if hb.id == id {
                return index
            }
        }
        return -1
    }
    
    func modifyItem(id: UUID,title: String,quantity: Int, unit: Type) {
        let index = findItem(id: id)
        if index != -1 {
            habitudes[index].title = title
            habitudes[index].quantity = quantity
            habitudes[index].type = unit
        }
    }
    
}
