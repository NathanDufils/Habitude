import Foundation

enum Type: String, CaseIterable {
    case g = "g"
    case ml = "ml"
    case km = "km"
    case n = ""
}

enum Etat: String, CaseIterable {
    case all = "All"
    case done = "Done"
    case todo = "To Do"
}

struct Habitude: Identifiable {
    var id = UUID()
    var title: String
    var quantity: Double
    var type: Type
    var state: Etat
    
    static var testData = [
        Habitude(title: "Boire de l'eau", quantity: 1000, type: .ml, state: .todo),
        Habitude(title: "Faire des pompes", quantity: 10,type: .n, state: .done),
        Habitude(title: "Matchs Tinder", quantity: 5, type: .n, state: .done),
    ]
}
