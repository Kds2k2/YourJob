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
        
        struct LoginWithEmail {
            static let title = "Welcome"
            static let description = "Please enter your email address and password to login."
            static let navigationItem = "Login"
            static let loginError = "Can`t login"
        }
        
        struct SignUpRegister {
            static let title = "Let's Get Started!"
            static let description = "Please enter the following information to create a new account."
            static let navigationItem = "Sign Up"
            static let signUpError = "Can`t sign up"
        }
        struct SignUpConfirm {
            static let title = "Verification Code"
            static let description = "Please enter a confirmation code that was sent to the email address you provided."
            static let resendCode = "Don't recieve a confirmation code?"
            static let navigationItem = "Sign Up"
            static let resendCodeError = "Can`t resend confirmation code"
            static let confirmError = "Can`t confrim"
        }

        struct ResetPassword {
            static let title = "Reset Password"
            static let description = "Please enter a new password and confirmation code that was sent to the email address you provided."
            static let resendCode = "Don't recieve a confirmation code?"
            static let navigationItem = "Password"
            static let resendCodeError = "Can`t resend confirmation code"
            static let resetError = "Can`t reset password"
        }
        
        struct VacancyFilter {
            static let title = "Search Filter"
            static let description = "Please enter criteria by which you want to search, and any other options as desired."
            static let jobTitle = "Job Title"
            static let location = "Location"
            static let isRemote = "Is Remote"
            static let salary = "Salary"
            static let categories = "Categories"
            static let navigationItem = "Filter"
        }
        
        struct VacancyDetails {
            static let title = "Vacancy Details"
            static let description = "Before sending your resume, carefully read the job posting for any instructions from the employer about how to apply."
            static let email = "Email"
            static let phone = "Phone"
            static let navigationItem = "Details"
            static let jobTitle = "Job Title"
            static let jobDescription = "Description"
            static let location = "Location"
            static let isRemote = "Is Remote"
            static let salary = "Salary"
            static let categories = "Categories"
            static let published = "Published"
        }
        
        struct VacancyOffers {
            static let navigationItem = "Offers"
            static let signOut = "Sign Out"
            static let loading = "Loading..."
        }
    }
    
    struct Messages {
        static let firstNameRequired = "First Name is required.\nPlease enter a first name and try again."
        static let lastNameRequired = "Last Name is required.\nPlease enter a last name and try again."
        static let emailRequired = "Email is required.\nPlease enter valid email and try again."
        static let passwordRequired = "Password is required.\nPlease enter password and try again."
        static let passwordWron = "Password is wrong.\nYour password must be at least 8 characters long and must contain at least one upper case, lower case, number and special character."
        static let confirmPasswordRequired = "Confirm Password is required.\nPlease enter confirm password and try again."
        static let enterEmailToResetPassword = "Email is required.\nPlease enter your email if you want to reset your password."
        static let confirmPasswordWrong = "Password is wrong.\nPassword & Confirm Password do not match."
        static let confirmationCodeRequired = "Confirmation Code is required.\nPlease enter confirmation code that was sent to the email address you providedand and try again."
        static let passwordResetSuccessfully = "Password reset.\nPlease log into the account with your email and new password."
        static let confirmationCodeResent = "The confirmation code has been resent."
        static let accountCreatedAndConfirmed = "Congratulation!\nYour account has been successfully created and confirmed."
        static let confirmSignOut = "Are you sure you want to sign out?"
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
        static let yes = "Yes"
        static let no = "No"
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
    
    struct VacancyCategory {
        static let serviceIndustries = "Service Industries"
        static let salesAndPurchase = "Sales & Purchase"
        static let delivery = "Delivery"
        static let design = "Design"
        static let entertainment = "Entertainment"
        static let engineering = "Engineering"
        static let informationTechnology = "Information Technology"
        static let construction = "Construction"
    }
}
    

