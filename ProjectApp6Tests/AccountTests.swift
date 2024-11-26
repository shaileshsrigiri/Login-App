//
//  AccountTests.swift
//  ProjectApp6Tests
//
//  Created by Shailesh Srigiri on 11/26/24.
//

import XCTest
@testable import ProjectApp6
final class AccountTests: XCTestCase {

    func testInitialBalance() {
        let account = Account(initialBalance: 100.0)
        XCTAssertEqual(account.getBalance(), 100.0, "Initial balance should match the provided value.")
    }
    
    func testDepositValidAmount() {
        let account = Account(initialBalance: 100.0)
        do {
            try account.deposit(amount: 50.0)
            XCTAssertEqual(account.getBalance(), 150.0, "Balance should increase by the deposit amount.")
        } catch {
            XCTFail("Deposit with a valid amount should not throw an error.")
        }
    }
    
    func testDepositNegativeAmount() {
        let account = Account(initialBalance: 100.0)
        XCTAssertThrowsError(try account.deposit(amount: -50.0)) { error in
            XCTAssertEqual(error as? AccountError, AccountError.negativeAmount, "Error should be negativeAmount.")
        }
    }
    
    func testWithdrawValidAmount() {
        let account = Account(initialBalance: 100.0)
        do {
            try account.withdraw(amount: 50.0)
            XCTAssertEqual(account.getBalance(), 50.0, "Balance should decrease by the withdrawal amount.")
        } catch {
            XCTFail("Withdraw with a valid amount should not throw an error.")
        }
    }
    
    func testWithdrawAmountExceedingBalance() {
        let account = Account(initialBalance: 100.0)
        XCTAssertThrowsError(try account.withdraw(amount: 150.0)) { error in
            XCTAssertEqual(error as? AccountError, AccountError.insufficientFunds, "Error should be insufficientFunds.")
        }
    }
    
    func testWithdrawNegativeAmount() {
        let account = Account(initialBalance: 100.0)
        XCTAssertThrowsError(try account.withdraw(amount: -50.0)) { error in
            XCTAssertEqual(error as? AccountError, AccountError.negativeAmount, "Error should be negativeAmount.")
        }
    }
}
