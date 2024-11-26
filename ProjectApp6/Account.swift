//
//  Account.swift
//  ProjectApp6
//
//  Created by Shailesh Srigiri on 11/26/24.
//


enum AccountError: Error {
    case negativeAmount
    case insufficientFunds
}

class Account {
    private var balance: Double
    
    init(initialBalance: Double) {
        self.balance = initialBalance
    }
    
    func deposit(amount: Double) throws {
        guard amount > 0 else {
            throw AccountError.negativeAmount
        }
        balance += amount
    }
    
    func withdraw(amount: Double) throws {
        guard amount > 0 else {
            throw AccountError.negativeAmount
        }
        guard balance >= amount else {
            throw AccountError.insufficientFunds
        }
        balance -= amount
    }
    
    func getBalance() -> Double {
        return balance
    }
}
