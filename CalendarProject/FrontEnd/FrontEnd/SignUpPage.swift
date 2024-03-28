//
//  SignUpPage.swift
//  FrontEnd
//
//  Created by Tiernan Jesrani on 12/29/23.
//

import SwiftUI

struct SignUpPage: View {
    let logInst = login()
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack(spacing: 24) {
                InputView(text: $username,
                          title: "Username",
                          placeholder: "abc")
                .autocapitalization(.none)
                
                InputView(text: $password,
                          title: "Password",
                          placeholder: "123",
                          isSecureField: true)
                .autocapitalization(.none)
                
                InputView(text: $confirmPassword,
                          title: "Confirm Password",
                          placeholder: "123",
                          isSecureField: true)
                .autocapitalization(.none)
                
            }
            .padding(.horizontal)
            
            Button {
                if (confirmPassword == password) {
                    logInst.sendLogin(username: username, password: password, Url: "http://127.0.0.1:5000/login") { result in
                        switch result {
                            case .success(let token):
                                print(token)
                            case .failure(let error):
                                print(error.localizedDescription)
                        }
                    }
                }
            } label: {
                HStack {
                    Text("SIGN UP")
                        .fontWeight(.semibold)
                    Image(systemName:"arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.systemBlue))
            .cornerRadius(10)
            .padding(.top, 24)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 2) {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .foregroundColor(Color(.systemBlue))
            }
            
            
            
            
            
            
        }
    }
}

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
    }
}
