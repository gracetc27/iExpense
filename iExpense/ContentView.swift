//
//  ContentView.swift
//  iExpense
//
//  Created by Grace couch on 20/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddView = false
    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(expenses.items) { item in
                        if case .personal = item.type {
                            ListView(amount: item.amount, name: item.name)
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                Section("Business") {
                    ForEach(expenses.items) { item in
                        if case .business = item.type {
                            ListView(amount: item.amount, name: item.name)
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }

            .sheet(isPresented: $showingAddView) {
                AddView(expenses: expenses)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add expense", systemImage: "plus") {
                    showingAddView = true
                }
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
