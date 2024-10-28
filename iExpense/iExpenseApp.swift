//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Grace couch on 20/08/2024.
//
import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
