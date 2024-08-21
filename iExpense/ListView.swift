//
//  ListView.swift
//  iExpense
//
//  Created by Grace couch on 20/08/2024.
//

import SwiftUI

struct ListView: View {
    var amount: Double
    var name: String

    var body: some View {
        HStack {
                Text(name)
                    .font(.headline)

            Spacer()
            if amount <= 5 {
                Text(amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .foregroundStyle(.green)
            } else if amount > 5 && amount < 100 {
                Text(amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .foregroundStyle(.orange)
            } else {
                Text(amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .foregroundStyle(.red)
            }
        }
    }
}


#Preview {
    ListView(amount: 5.0, name: "lunch")
}
