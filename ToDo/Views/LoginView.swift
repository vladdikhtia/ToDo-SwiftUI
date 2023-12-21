//
//  LoginView.swift
//  ToDo
//
//  Created by Влад Дихтярук on 11.12.2023.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        
        
        NavigationView{
           VStack{
                //Header
                HeaderView()

                //LoginForm
                Form{
                    TextField("Email Address", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        // Attempt log in
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(.blue)
                            Text("Login")
                                .foregroundStyle(.white)
                                .bold()
                        }
                    })
                    .padding(.top, 10)
                }
                
                VStack{
                    Text("New around here?")
                    NavigationLink("Create An Account", destination: RegisterView())
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
