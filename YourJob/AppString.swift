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
    }
    
    struct Button {
        static let loginWithEmail = "Login With Email"
        static let registerHere = "Register Here"
    }
}
    

