//
//  ContentView.swift
//  iExpense
//
//  Created by Grace couch on 20/08/2024.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]
    @State private var showingAddView = false
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount)
    ]

    @State private var filter: ExpenseType? = nil

    var body: some View {
        NavigationStack {
            ListView(sortOrder: sortOrder, filter: filter)
                .sheet(isPresented: $showingAddView) {
                    AddView(expenses: expenses)
                }
                .navigationTitle("iExpense")
                .toolbar {
                    Button("Add expense", systemImage: "plus") {
                        showingAddView = true
                    }
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort by", selection: $sortOrder) {
                            Text("Sort by name")
                                .tag([
                                    SortDescriptor(\ExpenseItem.name),
                                    SortDescriptor(\ExpenseItem.amount)
                                ])
                            Text("Sort by amount")
                                .tag([
                                    SortDescriptor(\ExpenseItem.amount),
                                    SortDescriptor(\ExpenseItem.name)
                                ])
                        }
                    }
                    Menu("Filter", systemImage: "line.3.horizontal.decrease.circle") {
                        Picker("Filter by", selection: $filter) {
                            ForEach(ExpenseType.allCases, id: \.rawValue) { type in
                                Text(type.rawValue)
                                    .tag(type)
                            }
                            Text("None").tag(Optional<ExpenseType>(nil))
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
