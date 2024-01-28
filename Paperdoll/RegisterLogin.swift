//
//  RegisterLogin.swift
//  Paperdoll
//
//  Created by Isabelle Smith on 1/27/24.
//

import Foundation
import SwiftUI

struct RegisterLogin: View {
    @State private var paddingWidth = 147 //idk
    @State private var underlineWidth = 70
    @State private var loginClicked = true
    
    var body: some View {
        ZStack {
            if loginClicked {
                LoginView()
            } else {
                RegisterView()
            }
            
            VStack {
                Rectangle()
                    .frame(width: 65, height: 1.5)
                    .foregroundColor(Color("darkblue"))
                    .padding(.trailing, CGFloat(paddingWidth))
                Spacer()
                    .frame(height: 420)
            }
            
            
            VStack {
                HStack {
                    Button(action: {
                        
                    }) {
                        Text("LOGIN")
                            .font(.system(size: 20))
                            .fontWeight(.regular)
                            .foregroundColor(Color("darkblue"))
                    }
                    
                    Spacer()
                        .frame(width: 60)
                    
                    Button(action: {
                        
                    }) {
                        Text("REGISTER")
                            .font(.system(size: 20))
                            .fontWeight(.regular)
                            .foregroundColor(Color("darkblue"))
                    }
                } // end hstack of login and register view buttons
                
                Spacer()
                    .frame(height: 450)
                
                
            } // end vstack of static components (login view button, register view button, etc)
            
        } // end big zstack
    }
}

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Text("Username or email")
                .font(.system(size: 14))
                .fontWeight(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
                .foregroundColor(.gray)
            
            TextField("Username", text: $username)
                .padding()
                .frame(width: 270, height: 45)
                .background(Color("grey"))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 0.3)
                )
            
            Text("Password")
                .font(.system(size: 14))
                .fontWeight(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
                .foregroundColor(.gray)
            
            TextField("Password", text: $password)
                .padding()
                .frame(width: 270, height: 45)
                .background(Color("grey"))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 0.3)
                )
            
            Text("Forgot your password?")
                .font(.system(size: 14))
                .fontWeight(.semibold)
                .foregroundColor(Color("darkblue"))
            
            Spacer()
                .frame(height: 40)
            
            Button(action: {
                        // Add your login action here
                    }) {
                        Text("Login")
                            .font(.system(size: 22))
                            .fontWeight(.semibold)
                            .frame(width: 150, height: 45)
                            .foregroundColor(.white)
                            .background(Color("darkblue"))
                            .cornerRadius(8)
                    }
            
            Spacer()
                .frame(height: 70)
            
            Button(action: {
                // add action code here
            }) {
                HStack {
                    Spacer()
                    Image("googlelogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 40)
                    Text("Sign in with Google")
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                    Spacer()
                }
                .frame(width: 270, height: 45)
                .cornerRadius(8)
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.blue, lineWidth: 1)
                )
            }
        }
    }
}

struct RegisterView: View {
    var body: some View {
        VStack {
            
        }
    }
}

struct RegisterLogin_Previews: PreviewProvider {
    static var previews: some View {
        RegisterLogin()
    }
}
