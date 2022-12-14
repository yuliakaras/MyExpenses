import Foundation

struct ExpensesItem: Identifiable, Codable{
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}
