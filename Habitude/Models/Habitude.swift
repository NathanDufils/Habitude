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

let customDate1 = Calendar.current.date(from: DateComponents(year: 2024, month: 4, day: 2))!
let customDate2 = Calendar.current.date(from: DateComponents(year: 2024, month: 4, day: 1))!
let customDate3 = Calendar.current.date(from: DateComponents(year: 2024, month: 3, day: 29))!
let customDate4 = Calendar.current.date(from: DateComponents(year: 2024, month: 3, day: 30))!

struct Habitude: Identifiable {
    var id = UUID()
    var title: String
    var quantity: Int
    var type: Type
    var state: Etat
    var date: Date
    
    static var testData = [
        Habitude(title: "Boire de l'eau", quantity: 1000, type: .milliliter, state: .todo, date: customDate1),
        Habitude(title: "Faire des pompes", quantity: 10, type: .n, state: .done, date: customDate2),
        Habitude(title: "Matchs Tinder", quantity: 5, type: .n, state: .done, date: customDate3)
    ]
}
