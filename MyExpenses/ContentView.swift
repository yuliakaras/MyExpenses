
import SwiftUI


struct ContentView: View {
    @State private var showingAddNewExpense = false
    @ObservedObject var expenses = Expenses()
    
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
                        Text("$ \(item.amount)")
                    }
                }
                .onDelete(perform: removeItem)
            }
        
        .navigationBarTitle("My expenses")
        .navigationBarItems(trailing: Button(action: {
            self.showingAddNewExpense = true
        }) {
            Image(systemName: "plus")
        })
        .sheet(isPresented: $showingAddNewExpense) {
            AddExpensesItem(expenses: self.expenses)
        }
        }
    }
    
    func removeItem(as offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
