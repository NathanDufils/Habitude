//
//  DataView.swift
//  Habitude
//
//  Created by lorton baptiste on 20/03/2024.
//

import SwiftUI

struct DataView: View {
    struct DepartmentProfit {
        var department: String
        var profit: Double
    }

    var data: [DepartmentProfit] = [
        DepartmentProfit(department: "LUN", profit: 3),
        DepartmentProfit(department: "MAR", profit: 4),
        DepartmentProfit(department: "MER", profit: 5),
        DepartmentProfit(department: "JEU", profit: 2),
        DepartmentProfit(department: "VEN", profit: 1),
        DepartmentProfit(department: "SAM", profit: 6),
        DepartmentProfit(department: "DIM", profit: 3)
    ]

    var body: some View {
        HStack {
            ForEach(data, id: \.department) { department in
                BarView(value: department.profit, label: department.department)
            }
        }
        .padding()
    }
}

struct BarView: View {
    var value: Double
    var label: String

    var body: some View {
        VStack {
            Text(String(format: "%.0f", value))
            Rectangle()
                .fill(value > 2 ? Color.green : Color.red)
                .frame(width: 30, height: CGFloat(value*25))
                .padding(10)
            Text(label)
        }
        .padding(.bottom, 10)
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
