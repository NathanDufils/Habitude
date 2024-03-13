//
//  RowView.swift
//  Habitude
//
//  Created by Dufils Nathan on 13/03/2024.
//

import SwiftUI

struct RowView: View {
    
    let habitude : Habitude
    
    var body: some View {
        HStack {
            Image(systemName: habitude.state ? "checkmark.circle" : "circle")
                .foregroundColor(habitude.state ? .green : .red)

            Text(habitude.title)
            
            Spacer()
            
            Text(String(habitude.quantity)+" "+habitude.type.rawValue)
                .foregroundColor(Color(.systemGray2))
                .font(.title3)
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        RowView(habitude: Habitude.testData[0])
    }
}
