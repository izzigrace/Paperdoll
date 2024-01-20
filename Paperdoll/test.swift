//
//  test.swift
//  Paperdoll
//
//  Created by Isabelle Smith on 1/18/24.
//

import Foundation
import SwiftUI
import CoreData

struct UserProfileView: View {
    
    @State private var buttonClicked = "closet"
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    // Profile Picture
                    Text("izzigrace") //later we'd do "@" + variable for user's username
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.top/*@END_MENU_TOKEN@*/, 0)
                    
                    HStack { //horizontal stack of followers, follow button, profile pic, message button, how many items in closet? etc
                        
                        VStack {
                            Text("11k")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                            
                            Text("followers")
                                .font(.system(size: 14))
                                .frame(width: 90)
                        }
                        
                        Image(systemName: "plus.circle.fill")
                        
                        Image("profilePic")
                            .resizable()
                            .frame(width: 85, height: 80)
                            .clipShape(Circle())  // Apply a circular clip shape
                            .overlay(
                                Circle()
                                    .stroke(Color(UIColor(hex: "3c4f74")), lineWidth: 2.1)
                                    .frame(width: 100, height: 85)  // Adjust the frame to increase the size of the circle
                            )  // Add a stroke (circle border)
                            .padding(.top, 2)
                        
                        Image(systemName: "envelope")
                        
                        VStack {
                            Text("108")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                            
                            Text("items")
                                .frame(width: 83)
                                .font(.system(size: 14))
                        }
                        
                    }

                    // User Information
                    Text("Little description of my profile, where my description will go")
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center) // Center-align the text
                        .padding(.top, 3)
                        .frame(maxWidth: .infinity) // Expand the width to the maximum
                        .frame(width: 210)


                    Spacer()
                }
                
                Rectangle() // rectangle behind all posts and buttons
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(width: 375)
                    .foregroundColor(Color(UIColor(hex: "f1f3f4")))
                    .cornerRadius(10)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .padding(.top, 185)
                    .edgesIgnoringSafeArea(.bottom)
                
                HStack { // this hstack contains all the buttons that take you to different profile sections
                    NavigationLink(destination: ClosetView()) {
                        Text("closet")
                            .foregroundColor(.white)
                            .font(.system(size: 13))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity)
                            .frame(width: 60, height: 25)
                            .background(Color(UIColor(hex: "3c4f74")))
                            .cornerRadius(19)
                            .padding(.top, -202)
                    } //end closet button
                    
                    NavigationLink(destination: OutfitsView()) {
                        Text("outfits")
                            .foregroundColor(.black)
                            .font(.system(size: 13))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity)
                            .frame(width: 60, height: 25)
//                            .background(Color(UIColor(hex: "3c4f74")))
                            .cornerRadius(19)
                            .padding(.top, -202)
                    } //end outfits button
                    
                    Text("market")
                        .foregroundColor(.black)
                        .font(.system(size: 13))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity)
                        .frame(width: 60, height: 25)
                        .cornerRadius(19)
                        .padding(.top, -202)
                    
                    Text("wishlist")
                        .foregroundColor(.black)
                        .font(.system(size: 13))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity)
                        .frame(width: 60, height: 25)
                        .cornerRadius(19)
                        .padding(.top, -202)
                    
                    
                } // end Hstack for navigation buttons
                
                
                HStack { // stack of white rectangles
                    Rectangle()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .frame(width: 170, height: 220)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.top, -112)
                        .alignmentGuide(.leading) { dimension in
                            dimension[HorizontalAlignment.leading]
                        }
                    Rectangle()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .frame(width: 170, height: 160)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .foregroundColor(.white)
                        .padding(.top, -167)
                } // end of Hstack
                
                HStack { // stack of white rectangles
                    Image("jeans")
                        .resizable() // Make the image resizable
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .frame(width: 170, height: 220)
                        .cornerRadius(10)
                        .padding(.top, -112)
                        .alignmentGuide(.leading) { dimension in
                            dimension[HorizontalAlignment.leading]
                        }
                    Image("converse")
                        .resizable() // Make the image resizable
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .frame(width: 170, height: 160)
                        .cornerRadius(10)
                        .padding(.top, -167)
                } // end of Hstack
                
            }
            .edgesIgnoringSafeArea(.bottom)
            
            
            
//            .navigationBarTitleDisplayMode(.inline) // Set the display mode to inline
//            .navigationBarTitle("@izzigrace") //later we'd do "@" + variable for user's username
//            .font(.largeTitle) // Set the font size for the navigation title
        }
    }
}

struct ClosetView: View {
    var body: some View {
        VStack {
        }
        .navigationTitle("Closet")
    }
}

struct OutfitsView: View {
    var body: some View {
        VStack {
        }
    }
}

//this lets you use hex codes instead of names of colors. call it and insert the hex code like used in code ealier in file ^
extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        self.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgb & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
