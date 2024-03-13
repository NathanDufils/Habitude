import Foundation

enum Type: String, CaseIterable {
    case g = "g"
    case ml = "ml"
    case km = "km"
    case n = "none"
}

struct Habitude: Identifiable {
    var id = UUID()
    var title: String
    var quantity: Double
    var type: Type
    var state: Bool
    
    static var testData = [
        Habitude(title: "Boire de l'eau", quantity: 1000, type: .ml, state: false),
        Habitude(title: "Faire des pompes", quantity: 10,type: .n, state: true),
        Habitude(title: "Matchs Tinder", quantity: 5, type: .n, state: true),
    ]
}
