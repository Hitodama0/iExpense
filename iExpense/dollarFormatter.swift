//
//  dollarFormatter.swift
//  iExpense
//
//  Created by Biagio Ricci on 05/02/23.
//

import Foundation

var dollarFormatter : FloatingPointFormatStyle<Double>.Currency {
    let currencyCode = Locale.current.currency?.identifier ?? "USD"
    return FloatingPointFormatStyle<Double>.Currency(code: currencyCode)
}
