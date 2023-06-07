//
//  AppString.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 04.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation

struct AppString {
    struct View {
        struct Welcome {
            static let title = "Welcome"
            static let description = "Lorem ipsum dolor sit amet. Est quisquam impedit ut nulla minus et ipsum adipisci in dolorum commodi. Non velit cupiditate est consequatur officia et asperiores atque 33 voluptate voluptatem sit voluptas ducimus eos laborum laudantium. Ut voluptates velit aut ipsa autem ut unde repellat. Ad totam quae est galisum enim id omnis consequatur."
            static let signUpPrompt = "Don't have an account yet?"
        }
        
        struct VacancyDetails {
            static let title = "Vacancy Details"
            static let description = "Before sending your resume, carefully read the job posting for any instructions from the employer about how to apply."
            static let email = "Email"
            static let phone = "Phone"
        }
        
        struct LoginWithEmail {
            static let title = "Welcome"
            static let description = "Please enter your email address and password to login."
        }
        
        struct SignUpRegister {
            static let title = "Let's Get Started!"
            static let description = "Please enter the following information to create a new account."
        }
        struct SignUpConfirm {
            static let title = "Verification Code"
            static let description = "Please enter a confirmation code that was sent to the email address you provided."
            static let resendCode = "Don't recieve a confirmation code?"
        }

        struct ResetPassword {
            static let title = "Reset Password"
            static let description = "Please enter a new password and confirmation code that was sent to the email address you provided."
            static let resendCode = "Don't recieve a confirmation code?"
        }
        
        struct Complete {
            static let title = "Complete"
            static let description = "Lorem ipsum dolor sit amet. Est quisquam impedit ut nulla minus et ipsum adipisci in dolorum commodi. Non velit cupiditate est consequatur officia et asperiores atque 33 voluptate voluptatem sit voluptas ducimus eos laborum laudantium. Ut voluptates velit aut ipsa autem ut unde repellat. Ad totam quae est galisum enim id omnis consequatur."
        }
        
        struct VacancyFilter {
            static let title = "Search Filter"
            static let description = "Please enter criteria by which you want to search, and any other options as desired."
            static let jobTitle = "Job Title"
            static let location = "Location"
            static let isRemote = "Is Remote"
            static let salary = "Salary"
            static let categories = "Categories"
        }
    }
    
    struct State {
        static let yes = "Yes"
        static let no = "No"
        static let notSet = "Not Set"
    }
    
    struct Alert {
        static let error = "Error"
        static let info = "Information"
        static let warning = "Warning"
        static let question = "Question"
        static let success = "Success"
        static let failure = "Failure"
        static let confirm = "Confirmation"
    }
    
    struct Button {
        static let loginWithEmail = "Login With Email"
        static let login = "Login"
        static let registerHere = "Register Here"
        static let forgotPassword = "Forgot Password?"
        static let resetPassword = "Reset Password"
        static let resendAgain = "Resend Again"
        static let close = "Close"
        static let createAccount = "Create Account"
        static let submit = "Submit"
        static let respond = "Respond"
        static let accept = "Accept"
    }
    
    struct Input {
        struct Placeholder {
            static let email = "Email"
            static let password = "Password"
            static let confirmPassword = "Confirm Password"
            static let confrimationCode = "Confrimation Code"
            static let phone = "Phone (optimal)"
            static let firstName = "First Name"
            static let lastName = "Last Name"
            static let common = "<tab to enter>"
        }
    }
    
    struct Common {
        static let version = "Version"
    }
}
    

