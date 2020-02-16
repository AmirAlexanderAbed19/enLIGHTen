//
//  AuthView.swift
//  enLIGHTen
//
//  Created by Dominick Lee on 2/16/20.
//  Copyright © 2020 Dominick Lee. All rights reserved.
//

import SwiftUI


struct SignInView : View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore
    
    func signIn () {
        
        session.signIn(email: email, password: password) { (result, error) in
            
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body: some View {
        
        ZStack {
            VStack {
                Spacer()
            }
            .frame(width: screen.width, height: screen.height, alignment: .top)
            .frame(maxWidth: .infinity, maxHeight: screen.height)
            .background(Color.green)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.green.opacity(0.3), radius: 20, x: 0, y: 20)
            .offset(y: -(screen.height / 2))
            
            VStack (spacing: 20) {
                Text("enLIGHTen")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .medium, design: .default))
                    .padding(.horizontal, 40)
                    .padding(.top, 16)
                
                Spacer()
            }
            .padding(.top, 30)
            
            VStack {
                HStack {
                    Image(systemName: "lightbulb")
                        .font(.system(size: 40, weight: .regular, design: .default))
                        .frame(width: 90, height: 90)
                    
                }
                .background(Color.white)
                .cornerRadius(50)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                .padding(.top, 40)
                .padding(.bottom, 10)
                
                HStack {
                    Text("Login")
                    Spacer()
                }
                .padding(20)
                .padding(.horizontal, 20)
                
                TextField("email address", text: $email)
                    .frame(width: screen.width - 200)
                    .padding(15)
                    .padding(.horizontal, 20)
                    .background(Color.white)
                    .cornerRadius(50)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                
                HStack {
                    Text("Password")
                    Spacer()
                }
                .padding(20)
                .padding(.horizontal, 20)
                
                
                SecureField("Password", text: $password)
                    .frame(width: screen.width - 200)
                    .padding(15)
                    .padding(.horizontal, 20)
                    .background(Color.white)
                    .cornerRadius(50)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                
                
                Button(action: signIn) {
                    Text("Sign in")
                        .font(.system(size: 20, weight: .regular, design: .default))
                        
                        .foregroundColor(Color.white)
                        .padding(10)
                        .padding(.horizontal, 20)
                        .background(Color.green)
                        .cornerRadius(50)
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                        
                }
                .offset(y: 50)
                if (error != "") {
                    Text("ahhh crap")
                        .offset(y: -30)
                }
                
                
                Spacer()
            }
            .frame(width: screen.width - 60, height: screen.height * 2 / 3)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 50, style: .continuous))
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
            .offset(y: -30)
            
            // Bottom Button
            NavigationLink(destination: SignUpView()) {
                Text("Create An Account")
                    .font(.system(size: 20, weight: .regular, design: .default))
                    .foregroundColor(Color.white)
                    .padding(10)
                    .padding(.horizontal, 20)
                    .background(Color.green)
                    .cornerRadius(50)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                    // HARD CODE
 
            }
            .offset(y: 330)
            
        }
        
    }
}

struct SignUpView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore
    
    func signUp() {
        session.signUp(email: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            }
            else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body: some View {
        
        VStack {
            VStack {
                Text("Create Account")
                
                Text("Sign up to get Started")
                
                TextField("Email", text: $email)
                
                SecureField("Password", text: $password)
                
            }
            Button (action: signUp) {
                Text("Create Account")
            }
            if(error != "") {
                Text(error)
            }
 
        }
    }
}

struct AuthView: View {
    var body: some View {
        NavigationView {
            SignInView()
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView().environmentObject(SessionStore())
    }
}