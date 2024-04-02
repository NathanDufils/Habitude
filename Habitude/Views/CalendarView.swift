//
//  CalendarView.swift
//  Habitude
//
//  Created by Dufils Nathan on 27/03/2024.
//

import SwiftUI

struct CalendarView: View {
    @EnvironmentObject var data: HabitudeViewModel
    @State var selectedDate: Date = Date()
    
    var body: some View {
        VStack() {
            Text(formatDate(selectedDate))
                .font(.system(size: 28))
                .bold()
                .foregroundColor(Color.accentColor)
                .padding()
                .animation(.spring(), value: selectedDate)
                .frame(width: 500)
            Divider().frame(height: 1)
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                .frame(height: 290)
                    .padding(.horizontal)
                    .datePickerStyle(.graphical)
            Divider()
            List{
                Section(header:Text("Fait")) {
                    ForEach(data.habitudes) { habitude in
                        if (formatDate(habitude.date) == formatDate(selectedDate) && habitude.state == .done){
                            RowView(habitude: habitude)
                        }
                    }

                }
                Section(header:Text("Pas fait")) {
                    ForEach(data.habitudes) { habitude in
                        if (formatDate(habitude.date) == formatDate(selectedDate) && habitude.state == .todo){
                            RowView(habitude: habitude)
                        }
                    }

                }
            }
            
        }
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long // Format de date personnalisé
        return formatter.string(from: date)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView().environmentObject(HabitudeViewModel())
    }
}
