//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Biagio Ricci on 05/02/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
