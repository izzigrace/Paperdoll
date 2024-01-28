//
//  LandingPage.swift
//  Paperdoll
//
//  Created by Isabelle Smith on 1/24/24.
//

import Foundation
import SwiftUI

struct ViewCoordinator: View {
    @State private var isActive = false
    var body: some View {
        VStack {
            if isActive {
                IntroductionToApp()
            } else {
                LogoView(isActive: $isActive)
            }
        }
    }
}

struct IntroductionToApp: View {
    @State private var index = 1
    @State private var isFirstLaunch = UserDefaults.standard.bool(forKey: "isFirstLaunch")
    
    var body: some View {

        ZStack {
            
            if (index == 1) {
                DigitizeYourCloset()
            }
            if (index == 2) {
                CreateOutifts()
            }
            if (index == 3) {
                ConnectWithFriends()
            }
            if (index == 4) {
                StayInTheKnow()
            }
            
            
            VStack {
                HStack {
                    Spacer()
                    Text("SKIP")
                        .foregroundColor(.gray)
                        .fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 16))
                    Spacer()
                        .frame(width: 20)
                } //end hstack of skip button
                
                Spacer()
                
                HStack {
                    ForEach(1..<5) { i in
                        Circle()
                            .frame(height: 10)
                            .foregroundColor(i == index ? .black : .gray)
                        
                    }
                } //end hstack of circles
                
                Spacer()
                    .frame(width: 0, height: 20)
                
                HStack {
                    Spacer()
                        .frame(width: 40, height: 0)
                    
                    if (index > 1) {
                        Text("BACK")
                            .foregroundColor(Color("darkblue"))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .onTapGesture {
                                index -= 1
                            }
                    } else {
                        EmptyView()
                    }
                
                    Spacer()
                    
                    if (index < 4) {
                        Text("NEXT")
                            .foregroundColor(Color("darkblue"))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .onTapGesture {
                                index += 1
                            }
                    } else {
                        Text("GET STARTED")
                            .foregroundColor(Color("darkblue"))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    
                    Spacer()
                        .frame(width: 3, height: 0)
                    Image(systemName: "arrow.right").foregroundColor(Color("darkblue")).font(Font.system(size: 18).weight(.semibold))
                    Spacer()
                        .frame(width: 30, height: 0)
                } //end hstack of skip button and arrow
                
                Spacer()
                    .frame(height: 10)
            } //end vstack of circles and skip buttons
        }
        
        
    } // end some view
}

struct LogoView: View {
    @State private var scale = 0.7
    @Binding var isActive: Bool
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                    .frame(height: 320)
                
                Image("beigelogo")
                    .resizable()
                    .frame(width: 300, height: 200)
                
                
                Text("PAPERDOLL")
                    .font(.system(size: 40))
                    .fontWeight(.semibold)
                    .padding(.top, 0)
                    .foregroundColor(Color("beige"))
                
                Spacer()
            } // end logo vstack =
            .scaleEffect(scale)
            .onAppear{
                withAnimation(.easeIn(duration: 0.7)) {
                    self.scale = 0.9
                }
            }
            .frame(width: 500, height: 1000)
            .background(Color("darkblue"))
        } //end big vstack
        .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
    }
}

struct DigitizeYourCloset: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                    .frame(height: 110)
                Image("closetforlanding")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 450)
                Spacer()
            } //end vstack of picture and spacers
            
            VStack {
                Spacer()
                    .frame(height: 50)
                
                Text("DIGITIZE YOUR CLOSET")
                    .foregroundColor(Color("darkblue"))
                    .font(.system(size: 26))
                    .fontWeight(.semibold)
                
                Spacer()
                    .frame(height: 520)
                
                Text("Look through your closet on the go")
                    .foregroundColor(Color("darkblue"))
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .frame(width: 350)
                
                Spacer()
            } // end vstack with text
        } // end big zstack
        
    } // end some view
}

struct CreateOutifts: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                    .frame(height: 130)
                Image("outfitsforlanding")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 400)
                Spacer()
            } //end vstack of picture and spacers
            
            VStack {
                Spacer()
                    .frame(height: 50)
                
                Text("CREATE OUTFITS")
                    .foregroundColor(Color("darkblue"))
                    .font(.system(size: 26))
                    .fontWeight(.semibold)
                
                Spacer()
                    .frame(height: 520)
                
                Text("Organize them into boards for any occasion")
                    .foregroundColor(Color("darkblue"))
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .frame(width: 350)
                
                Spacer()
            } // end vstack with text
        } // end big zstack
        
    } // end some view
}

struct ConnectWithFriends: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                    .frame(height: 105)
                Image("followfriendsforlanding")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 440)
                Spacer()
            } //end vstack of picture and spacers
            
            VStack {
                Spacer()
                    .frame(height: 50)
                
                Text("CONNECT WITH FRIENDS")
                    .foregroundColor(Color("darkblue"))
                    .font(.system(size: 26))
                    .fontWeight(.semibold)
                
                Spacer()
                    .frame(height: 520)
                
                Text("Get an inside look into the closets of others")
                    .foregroundColor(Color("darkblue"))
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .frame(width: 350)
                
                Spacer()
            } // end vstack with text
        } // end big zstack
        
    } // end some view
}

struct StayInTheKnow: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                    .frame(height: 105)
                Image("stayintheknow")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.leading)
                    .frame(height: 440)
                Spacer()
            } //end vstack of picture and spacers
            
            VStack {
                Spacer()
                    .frame(height: 50)
                
                Text("STAY IN THE KNOW")
                    .foregroundColor(Color("darkblue"))
                    .font(.system(size: 26))
                    .fontWeight(.semibold)
                
                Spacer()
                    .frame(height: 520)
                
                Text("Get updates of what your friends and following are adding to their closets")
                    .foregroundColor(Color("darkblue"))
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .frame(width: 350)
                
                Spacer()
            } // end vstack with text
        } // end big zstack
        
    } // end some view
}


struct IntroductionToApp_Previews: PreviewProvider {
    static var previews: some View {
        ViewCoordinator()
    }
}


