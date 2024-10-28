//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Grace couch on 20/08/2024.
//
import SwiftData
import SwiftUI

@Model
class ExpenseItem: Identifiable {
    var id = UUID()
    var amount: Double
    var name: String

    var rawType: String

    var type: ExpenseType {
        get { ExpenseType(rawValue: rawType)! }
        set { self.rawType = newValue.rawValue }
   }

    init(id: UUID = UUID(), amount: Double, name: String, type: ExpenseType) {
        self.id = id
        self.amount = amount
        self.name = name
        self.rawType = type.rawValue
    }
}

enum ExpenseType: String, CaseIterable, Codable {
    case business
    case personal
}
