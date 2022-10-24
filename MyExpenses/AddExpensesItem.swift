
import SwiftUI

struct AddExpensesItem: View {
    @Environment(\.presentationMode) var presintationMode
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "personal"
    @State private var amount = ""
    
    let types = ["Personal", "Business"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Enter name", text: $name)
                Picker("Choose type", selection: $type) {
                    ForEach(self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Enter amount of expense", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Int(self.amount) {
                    let item = ExpensesItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    // after tap on  save button, view is closed
                    self.presintationMode.wrappedValue.dismiss()
                }
            }
            )
        }
        
    }
}

struct AddExpensesItem_Previews: PreviewProvider {
    static var previews: some View {
        AddExpensesItem(expenses: Expenses())
    }
}
