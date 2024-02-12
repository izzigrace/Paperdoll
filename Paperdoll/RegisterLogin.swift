//
//  RegisterLogin.swift
//  Paperdoll
//
//  Created by Isabelle Smith on 1/27/24.
//

import Foundation
import SwiftUI

struct RegisterLogin: View {
    @State private var paddingWidth = 240
    @State private var underlineWidth = 63
    @State private var loginClicked = true
    @State private var buttonSpacerHeight = 450
    @State private var colorBool = true
    
    var body: some View {
        ZStack {
            if loginClicked {
                LoginView()
            } else {
                RegisterView()
            }
            
            VStack {
                HStack {
                    Button(action: {
                        withAnimation {
                            loginClicked = true
                            paddingWidth = 240
                            underlineWidth = 63
                            buttonSpacerHeight = 450
                        }
                        colorBool = true
                    }) {
                        Text("LOGIN")
                            .font(.system(size: 20))
                            .fontWeight(.regular)
                            .foregroundColor(colorBool ? Color("darkblue") : .gray)
                    }
                    
                    Spacer()
                        .frame(width: 60)
                    
                    Button(action: {
                        withAnimation {
                            loginClicked = false
                            underlineWidth = 94
                            paddingWidth = 90
                            buttonSpacerHeight = 650
                        }
                        colorBool = false
                    }) {
                        Text("REGISTER")
                            .font(.system(size: 20))
                            .fontWeight(.regular)
                            .foregroundColor(colorBool ? .gray : Color("darkblue"))
                    }
                } // end hstack of login and register view buttons
                Spacer()
                    .frame(height: 1)
                
                HStack {
                    Spacer()
                    Rectangle() // line underneath login/register
                        .frame(width: CGFloat(underlineWidth), height: 1.5)
                        .foregroundColor(Color("darkblue"))
                        .padding(.trailing, CGFloat(paddingWidth))
                }
                
                Spacer()
//                    .frame(height: 650)
                    .frame(height: CGFloat(buttonSpacerHeight))
                
                
            } // end vstack of static components (login view button, register view button)
            
        } // end big zstack
    }
}

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var viewPassword = false
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 40)
            
            RegularTextBoxView(input: $username, expectedInput: "Username or email", textPaddingWidth: CGFloat(70))
            
            Spacer()
                .frame(height: 20)
            
            PasswordTextBoxView(input: $password, expectedInput: "Password", textPaddingWidth: CGFloat(70))
            
            Text("Forgot your password?")
                .font(.system(size: 14))
                .fontWeight(.semibold)
                .foregroundColor(Color("darkblue"))
                .padding(.leading, 110)
                .padding(.top, 2)
            
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
                } // end hstack of google logo and text for google button
                .frame(width: 270, height: 45)
                .cornerRadius(8)
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.blue, lineWidth: 1)
                )
            } // end google button
            
        } // end big vstack
    }
}

struct RegisterView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        VStack {
            RegularTextBoxView(input: $name, expectedInput: "Name", textPaddingWidth: CGFloat(70))
                .padding(.bottom, 5)
            RegularTextBoxView(input: $email, expectedInput: "Email", textPaddingWidth: CGFloat(70))
                .padding(.bottom, 5)
            RegularTextBoxView(input: $username, expectedInput: "Create a username", textPaddingWidth: CGFloat(70))
                .padding(.bottom, 5)
            PasswordTextBoxView(input: $password, expectedInput: "Password", textPaddingWidth: 70)
            if (passwordChecker(password: password).count == 0) {
                EmptyView()
            } else {
                Text(passwordChecker(password: password))
                    .multilineTextAlignment(.center)
                    .frame(width: 270)
                    .font(.system(size: 12))
                    .foregroundColor(.red)
            }
            
                //parent: store JUST final information, and bools for whether they passed the tests or not. use the bools to validate before registering. in the individual textboxes, you can update your strings to test and display the warnings if they dont pass. update the parent bools on every update to the text whether they are valid or not
            
            PasswordTextBoxView(input: $confirmPassword, expectedInput: "Confirm password", textPaddingWidth: 70)
            
            Spacer()
                .frame(height: 50)
            
            Button(action: {
                        // Add your login action here
                    }) {
                        Text("Create Account")
                            .font(.system(size: 22))
                            .fontWeight(.semibold)
                            .frame(width: 200, height: 45)
                            .foregroundColor(.white)
                            .background(Color("darkblue"))
                            .cornerRadius(8)
                    }
            
            Spacer()
                .frame(height: 30)
            
            Button(action: {
                // add action code here
            }) {
                HStack {
                    Spacer()
                    Image("googlelogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 40)
                    Text("Sign up with Google")
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                    Spacer()
                } // end hstack of google logo and text for google button
                .frame(width: 270, height: 45)
                .cornerRadius(8)
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.blue, lineWidth: 1)
                )
            } // end google button

        } // end big vstack
    }
}

struct RegularTextBoxView: View {
    @Binding var input: String
    var expectedInput: String
    var textPaddingWidth: CGFloat
    @State private var borderColor = Color.gray
    @State private var borderWeight = 0.3
    
    // i guess we can check to see if the expectedInput is "username" and if it is, we can apply the checking function to see if its in the database or too long / short
    
    var body: some View {
        VStack {
            HStack {
                Text(expectedInput)
                    .font(.system(size: 14))
                    .fontWeight(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
                    .padding(.leading, textPaddingWidth)
                Spacer()
            }
            
            Spacer()
                .frame(height: 2)
            //maybe instead of making the text related to $input here, make it equal to a local variable that is just for validating the string, and once its valid we can update input by saying $input = string or whatever
            TextField("Required", text: $input, onEditingChanged: { status in
                if (status) {
                    borderColor = Color("darkblue")
                    borderWeight = 1
                } else {
                    borderColor = Color.gray
                    borderWeight = 0.3
                }
            })
                .padding()
                .frame(width: 270, height: 45)
                .background(Color("grey"))
                .accentColor(Color("darkblue"))
                .cornerRadius(8)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(borderColor, lineWidth: borderWeight)
                )
        }
    }
}

struct PasswordTextBoxView: View {
    @Binding var input: String
    @State private var viewPassword = false
    var expectedInput: String
    var textPaddingWidth: CGFloat
    
    var body: some View {
        VStack {
            HStack {
                Text(expectedInput)
                    .font(.system(size: 14))
                    .fontWeight(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
                    .padding(.leading, textPaddingWidth)
                Spacer()
            }
            
            Spacer()
                .frame(height: 2)
            
            HStack {
                Spacer()
                    .frame(width: 30)
                
                Group {
                    if viewPassword {
                        TextField("Required", text: $input)
                    } else {
                        SecureField("Required", text: $input)
                    }
                } //end password field options group
                .padding()
                .frame(width: 270, height: 45)
                .background(Color("grey"))
                .cornerRadius(8)
                .accentColor(Color("darkblue"))
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 0.3)
                ) // end properties for password field options group
                
                Spacer()
                    .frame(width: 10)
                
                Button(action: {
                    viewPassword.toggle()
                }) {
                    Image(systemName: viewPassword ? "eye.slash" : "eye")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                        .foregroundColor(.gray)
                }
            } //end hstack for password field and eye image
            
        } // end big vstack
    }
}
//struct ConfirmPasswordTextBoxView: View {
//    @Binding var input: String
//    @State private var viewPassword = false
//    var expectedInput: String
//    var textPaddingWidth: CGFloat
//    
//    var body: some View {
//        VStack {
//            HStack {
//                Text(expectedInput)
//                    .font(.system(size: 14))
//                    .fontWeight(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
//                    .foregroundColor(.gray)
//                    .padding(.leading, textPaddingWidth)
//                Spacer()
//            }
//            
//            Spacer()
//                .frame(height: 2)
//            
//            HStack {
//                Spacer()
//                    .frame(width: 30)
//                
//                Group {
//                    if viewPassword {
//                        TextField("Required", text: $input)
//                    } else {
//                        SecureField("Required", text: $input)
//                    }
//                } //end password field options group
//                .padding()
//                .frame(width: 270, height: 45)
//                .background(Color("grey"))
//                .cornerRadius(8)
//                .accentColor(Color("darkblue"))
//                .textInputAutocapitalization(.never)
//                .disableAutocorrection(true)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 8)
//                        .stroke(Color.gray, lineWidth: 0.3)
//                ) // end properties for password field options group
//                
//                Spacer()
//                    .frame(width: 10)
//                
//                Button(action: {
//                    viewPassword.toggle()
//                }) {
//                    Image(systemName: viewPassword ? "eye.slash" : "eye")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 20)
//                        .foregroundColor(.gray)
//                }
//            } //end hstack for password field and eye image
//            
//        } // end big vstack
//    }
//}

func usernameChecker(username: String) -> String {
    let validCharacters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_.1234567890"
    if (username.count > 30) {
        return "Username is too long"
    }
    
    for letter in username {
        if (!validCharacters.contains(letter)) {
            return "Username contains invalid characters"
        }
    }
    
    return ""
}

func passwordChecker(password: String) -> String {
    var includesNum = false
    var includesSpecials = false
    var includesUppercase = false
    let nums = "1234567890"
    var nonSpecials = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
    let uppercases = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    
    for char in password {
        if (nums.contains(char)) {
            includesNum = true
        }
        if (!nonSpecials.contains(char)) {
            includesSpecials = true
        }
        if (uppercases.contains(char)) {
            includesUppercase = true
        }
    }
    
    if (password.count < 8 || !includesSpecials || !includesNum || !includesUppercase) {
        return "Password must include at least 8 characters, one uppercase, and one special character"
    }
    
    return ""
}

struct RegisterLogin_Previews: PreviewProvider {
    static var previews: some View {
        RegisterLogin()
    }
}
