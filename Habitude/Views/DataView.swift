//
//  DataView.swift
//  Habitude
//
//  Created by lorton baptiste on 20/03/2024.
//

import SwiftUI

struct DataView: View {
    @EnvironmentObject var data: HabitudeViewModel
    
    // Propriétés calculées pour recalculer habitCounts et dates avec les nouvelles données
    var habitCounts: [DateCount] {
        analyzeHabitData()
    }
    
    var dates: [Date] {
        getDates()
    }
    
    var body: some View {
        NavigationView{
            VStack{
                HStack {
                    Text("Statistiques")
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                        .bold()
                    
                    NavigationLink (destination: CalendarView()){
                        Image(systemName: "calendar.circle.fill" )
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 60)
                    }
                }.padding()
                
                Spacer()
                    .frame(height: 80)
                Text("Nombre d'habitudes réalisées par semaine")
                BarChart(data: habitCounts, dates: dates)
                    .frame(height: 200)
                    .padding()
                Spacer()
            }
        }
        
    }
    
    func analyzeHabitData() -> [DateCount] {
        var habitCountDictionary = [Date: Int]()
        
        for habit in data.habitudes where habit.state == .done {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day], from: habit.date)
            if let date = calendar.date(from: components) {
                habitCountDictionary[date, default: 0] += 1
            }
        }
        
        var currentDate = Date()
        for _ in 0..<6 {
            currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate)!
            if habitCountDictionary[currentDate] == nil {
                habitCountDictionary[currentDate] = 0
            }
        }
        
        var habitCounts = habitCountDictionary.map { DateCount(date: $0.key, count: $0.value) }
        
        habitCounts.sort(by: { $0.date < $1.date })
        
        return habitCounts
    }
    

    func getDates() -> [Date] {
        var allDates = Set<Date>()
        
        // Ajouter toutes les dates des habitudes à allDates
        for habit in data.habitudes {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day], from: habit.date)
            if let date = calendar.date(from: components) {
                allDates.insert(date)
            }
        }
        
        var currentDate = Date()
        for _ in 0..<6 {
            let previousDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate)!
            if !allDates.contains(where: { Calendar.current.isDate($0, inSameDayAs: previousDate) }) {
                allDates.insert(previousDate)
            }
            currentDate = previousDate
        }
        
        return Array(allDates).sorted()
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView().environmentObject(HabitudeViewModel())
    }
}


struct BarChart: View {
    let data: [DateCount]
    let dates: [Date]
    let maxHeight: CGFloat = 150
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(dates, id: \.self) { date in
                VStack {
                    if let datum = data.first(where: { $0.date == date }) {
                        Text("\(datum.count)")
                            .font(.caption)
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 20, height: barHeight(for: datum))
                        Text("\(datum.date, formatter: DateFormatter.monthDayFormat)")
                            .font(.caption)
                    } else {
                        Text("0")
                            .font(.caption)
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width: 20, height: 0)
                        Text("\(date, formatter: DateFormatter.monthDayFormat)")
                            .font(.caption)
                    }
                }
            }
        }
    }
    
    private func barHeight(for datum: DateCount) -> CGFloat {
        let normalizedHeight = CGFloat(datum.count) / CGFloat(maxCount() + 1)
        return normalizedHeight * maxHeight
    }
    
    private func maxCount() -> Int {
        return data.map { $0.count }.max() ?? 0
    }
}

extension DateFormatter {
    static let monthDayFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM"
        return formatter
    }()
}
