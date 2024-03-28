//
//LoginPage.swift
//  FrontEnd
//
//  Created by Tiernan Jesrani on 12/29/23.
//

import SwiftUI

struct LoginPage: View {
    let logInst = login()
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                //Username and Password Fields
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
                    
                }
                .padding(.horizontal)
                
                
                Button {
                    logInst.sendLogin(username: username, password: password, Url: "http://127.0.0.1:5000/login") { result in
                        switch result {
                            case .success(let token):
                                print(token)
                                let defaults = UserDefaults.standard
                                defaults.setValue(token, forKey: "tokenName")
                                
                            case .failure(let error):
                                print(error.localizedDescription)
                        }
                        
                    }
                } label: {
                    HStack {
                        Text("SIGN IN")
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
                
                //Sign up
                NavigationLink {
                    SignUpPage()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 2) {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .foregroundColor(Color(.systemBlue))
                }
                
            }
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
