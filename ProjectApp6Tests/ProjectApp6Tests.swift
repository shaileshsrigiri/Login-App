//
//  ProjectApp6Tests.swift
//  ProjectApp6Tests
//
//  Created by Shailesh Srigiri on 11/25/24.
//

import XCTest
@testable import ProjectApp6
final class ProjectApp6Tests: XCTestCase {
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }

    func testValidEmail() {
        let validEmails = [
            "test@example.com",
            "user.name+tag@example.co.uk",
            "user_name@example.org",
            "user-name@example.net"
        ]
        
        for email in validEmails {
            XCTAssertTrue(isValidEmail(email), "Expected \(email) to be valid.")
        }
    }
    
    func testInvalidEmail() {
        let invalidEmails = [
            "plainaddress",
            "missing@domain",
            "@missingusername.com",
            "user@.com",
        ]
        
        for email in invalidEmails {
            XCTAssertFalse(isValidEmail(email), "Expected \(email) to be invalid.")
        }
    }
    
    func testPasswordValidation() {
        let validPasswords = [
            "Password1!",
            "Abcdef1@",
            "StrongP@ssword2",
            "G00dP@ss!"
        ]

        let invalidPasswords = [
            "short1!",            // Too short
            "NoDigits!",          // No digit
            "nouppercase1!",      // No uppercase letter
            "NOLOWERCASE1!",      // No lowercase letter
            "NoSpecialChar1"      // No special character
        ]

        for password in validPasswords {
            assert(isValidPassword(password), "Expected \(password) to be valid.")
        }

        for password in invalidPasswords {
            assert(!isValidPassword(password), "Expected \(password) to be invalid.")
        }
    }

   

}
