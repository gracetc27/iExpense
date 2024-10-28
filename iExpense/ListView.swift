//
//  ListView.swift
//  iExpense
//
//  Created by Grace couch on 20/08/2024.
//
import SwiftData
import SwiftUI

struct ListView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]

    var body: some View {
        List {
            ForEach(expenses) { item in
                HStack {
                    Text("\(item.name)")
                        .font(.headline)

                    Spacer()
                    
                    if item.amount <= 5 {
                        Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .foregroundStyle(.green)
                    } else if item.amount > 5 && item.amount < 100 {
                        Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .foregroundStyle(.orange)
                    } else {
                        Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .foregroundStyle(.red)
                    }
                }
            }
            .onDelete(perform: removeItems)
        }
    }
    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            let item = expenses[offset]
            modelContext.delete(item)
        }
    }
    init(sortOrder: [SortDescriptor<ExpenseItem>], filter: ExpenseType?) {

        let predicate = filter.flatMap { filter in
            #Predicate<ExpenseItem> { item in
                filter.rawValue == item.rawType
            }
        } ?? .true

        _expenses = Query(
            filter: predicate,
            sort: sortOrder
        )
    }
}


#Preview {
    ListView(sortOrder: [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount)
    ], filter: .business)
}
