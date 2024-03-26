import Foundation

enum Type: String, CaseIterable {
    case n = ""
    case gram = "g"
    case kilogram = "kg"
    case milligram = "mg"
    case liter = "L"
    case milliliter = "mL"
    case kilometer = "km"
    case meter = "m"
    case centimeter = "cm"
    case inch = "in"
    case foot = "ft"
    case yard = "yd"
    case mile = "mi"
    case euro = "€"
    case dollar = "$"
    case pound = "lb"
}

enum Etat: String, CaseIterable {
    case done = "Done"
    case todo = "To Do"
}

struct Habitude: Identifiable {
    var id = UUID()
    var title: String
    var quantity: Double
    var type: Type
    var state: Etat
    var date = Date.now
    
    static var testData = [
        Habitude(title: "Boire de l'eau", quantity: 1000, type: .milliliter, state: .todo),
        Habitude(title: "Faire des pompes", quantity: 10,type: .n, state: .done),
        Habitude(title: "Matchs Tinder", quantity: 5, type: .n, state: .done),
    ]
}
