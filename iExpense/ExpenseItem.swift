//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Grace couch on 20/08/2024.
//
import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let amount: Double
    let name: String
    let type: ExpenseType
}

enum ExpenseType: String, Codable, CaseIterable {
    case business
    case personal
}
