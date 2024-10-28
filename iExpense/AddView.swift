//
//  AddView.swift
//  iExpense
//
//  Created by Grace couch on 20/08/2024.
//
import SwiftData
import SwiftUI

struct AddView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var type = ExpenseType.personal
    @State private var amount = 0.0

    var expenses: [ExpenseItem]



    let types = ExpenseType.allCases

    var body: some View {
        NavigationStack {
            Form {
                Section("Name of expense") {
                    TextField("Enter name", text: $name)
                }
                Section("Expense type") {
                    Picker("Type", selection: $type) {
                        ForEach(types, id: \.self) {
                            Text($0.rawValue.capitalized)
                        }
                    }
                }
                Section("Amount") {
                    TextField("Enter amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                }
            }
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(amount: amount, name: name, type: type)
                    modelContext.insert(item)
                    dismiss()
                }
            }
            .navigationTitle("Add new expense")
            .navigationBarBackButtonHidden()
        }

    }
}

#Preview {
    AddView(expenses: [ExpenseItem]())
}
