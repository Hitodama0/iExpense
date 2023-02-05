//
//  ContentView.swift
//  iExpense
//
//  Created by Biagio Ricci on 05/02/23.
//

import SwiftUI

struct Title: ViewModifier {
    var num: Double
    
    func body(content: Content) -> some View {
        if num < 10 {
            return content.foregroundColor(.green)
        }
        else if num <= 100{
            return content.foregroundColor(.yellow)
        }
        else if num > 100 {
            return content.foregroundColor(.red)
        }
        else {
            return content.foregroundColor(.black)
        }
    }
}



struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: dollarFormatter)
                            .modifier(Title(num: item.amount))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .navigationTitle("iExpense")
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
