import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpensesItem]() {
        didSet {
            let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(items){
                    UserDefaults.standard.set(encoded, forKey: "Items")
                }
            }
        }
    
        init() {
            if let items = UserDefaults.standard.data(forKey: "Items") {
                let decoder = JSONDecoder()
                if let decoded = try? decoder.decode([ExpensesItem].self, from: items){
                    self.items = decoded
                    return
                }
            }
        }
    }

            
