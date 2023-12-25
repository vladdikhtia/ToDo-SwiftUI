//
//  LoginView.swift
//  ToDo
//
//  Created by Влад Дихтярук on 11.12.2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        
        NavigationView{
            VStack{
                // Header
                HeaderView(
                    title: "To Do List",
                    subTitle: "Get things done",
                    angle: 15,
                    background: .blue)
                
                // Login Form
                Form{
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TLButton(title: "Login", background: .blue){
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                
                VStack{
                    Text("New around here?")
                    NavigationLink(
                        "Create An Account",
                        destination: RegisterView()
                    )
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
