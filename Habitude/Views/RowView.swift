//
//  RowView.swift
//  Habitude
//
//  Created by Dufils Nathan on 13/03/2024.
//

import SwiftUI

struct RowView: View {
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
                .foregroundColor(.green)

            Text("Manger 5 fruits et legumes")
            
            Spacer()
            
            Text("Quantité")
                .foregroundColor(Color(.systemGray2))
                .font(.title3)
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    RowView()
        .previewLayout(.sizeThatFits)
}
