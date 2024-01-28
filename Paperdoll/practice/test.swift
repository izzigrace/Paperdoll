//
//  test.swift
//  Paperdoll
//
//  Created by Isabelle Smith on 1/18/24.
//

import Foundation
import SwiftUI
import CoreData

//for formatting and spacing, its generally a better idea to use spacers with small frames instead of using padding with negative numbers. anny padding with negative numbers is a little hacky and might cause problems with click events and stuff in the future

struct UserProfileView: View {
    
    @State private var buttonClicked = "closet"
    @State private var location = -132
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack { //profile information
                    // Profile Picture
                    Text("izzigrace") //later we'd do "@" + variable for user's username
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(/*@START_MENU_TOKEN@*/.top/*@END_MENU_TOKEN@*/, 0)
                    
                    HStack (spacing: 8){ //horizontal stack of followers, follow button, profile pic, message button, how many items in closet? etc
                        
                        VStack {
                            Text("11k")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                            
                            Text("followers")
                                .font(.system(size: 14))
                                .fontWeight(.light)
                                .frame(width: 90)
                        }
                        
                        Image(systemName: "plus.circle.fill")
                        
                        Image("profilePic")
                            .resizable()
                            .frame(width: 85, height: 80)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())  // Apply a circular clip shape
                            .overlay(
                                Circle()
                                    .stroke(Color("darkblue"), lineWidth: 2.1)
                                    .frame(width: 100, height: 85)  // Adjust the frame to increase the size of the circle
                            )  // Add a stroke (circle border)
                            .padding(.top, 2)
                        
                        Image(systemName: "envelope").font(Font.system(size: 18).weight(.light))
                        
                        VStack {
                            Text("108")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                            
                            Text("items")
                                .fontWeight(.thin)
                                .frame(width: 83)
                                .font(.system(size: 14))
                        }
                        
                    } //end of hstack of followers profile pic etc

                    // User Information
                    Text("Little description of my profile, where my description will go")
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center) // Center-align the text
                        .padding(.top, 3)
                        .frame(maxWidth: .infinity) // Expand the width to the maximum
                        .frame(width: 210)


                    Spacer()
                } //end of first vstack profile information
                
                Rectangle() // rectangle behind all posts and buttons
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(width: 375)
                    .foregroundColor(Color("grey")) //the name i chose for the grey color in assets. in real app implementation, i would name it something like "rectanglebehindposts" and the asset would have a dark mode version and light mode version.
                    .cornerRadius(10)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/) //dont know if i like this
                    .padding(.top, 185)
                    .edgesIgnoringSafeArea(.bottom)
                
                if buttonClicked == "closet" {
                    // Render the posts when the closet button is clicked
                    ClosetView()
//                    .transition(.slide) // Add animation transition
                    .allowsHitTesting(true) // Enable hit testing for the posts view
                } else if buttonClicked == "wishlist" {
                    // Render the wishlist when the wishlist button is clicked
                    WishlistView()
//                        .transition(.slide) // Add animation transition
                        .allowsHitTesting(true) // Enable hit testing for the wishlist view
                } else if buttonClicked == "outfits" {
                    OutfitsView()
                } else if buttonClicked == "market" {
                    MarketView()
                }
                // ******* these commented out transitions/animations dont work, i want to slide one in and another out, but i can figure that out later, just wanted to get the general idea of switching views down
                
                Rectangle() //moveable background indicating which button is selected
                    .frame(maxWidth: .infinity)
                    .frame(width: 60, height: 25)
                    .foregroundColor(Color("darkblue"))
                    .cornerRadius(19)
                    .padding(.top, -202)
                    .padding(.leading, CGFloat(location)) //CGFloat converts the variable -132 into the data type that padding expects, just using location without CGFloat will throw an error
                
                HStack { // this hstack contains all the buttons that take you to different profile sections

                        Text("closet")
                            .foregroundColor(buttonClicked == "closet" ? .white : .black)
                            .font(.system(size: 13))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity)
                            .frame(width: 60, height: 25)
//                            .background(Color(UIColor(hex: "3c4f74")))
                            .cornerRadius(19)
//                            .padding(.top, -202)
                            .contentShape(Rectangle()) // Makes the entire content clickable
                            .onTapGesture {
                                withAnimation {
                                    buttonClicked = "closet"
                                    location = -132
                                }
                            }
                            .allowsHitTesting(true) //do i need this? idk
                            //end closet button
                    
                        Text("outfits")
                            .zIndex(500)
                            .foregroundColor(buttonClicked == "outfits" ? .white : .black)
                            .font(.system(size: 13))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity)
                            .frame(width: 60, height: 25)
//                            .background(Color(UIColor(hex: "3c4f74")))
                            .cornerRadius(19)
//                            .padding(.top, -202)
                            .contentShape(Rectangle()) // Makes the entire content clickable
                            .onTapGesture {
                                withAnimation {
                                    buttonClicked = "outfits"
                                    location = -64
                                }
                            }.allowsHitTesting(true) //end outfits button
                    
                    
                    Text("market")
                        .foregroundColor(buttonClicked == "market" ? .white : .black)
                        .font(.system(size: 13))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity)
                        .frame(width: 60, height: 25)
                        .cornerRadius(19)
//                        .padding(.top, -202)
                        .contentShape(Rectangle()) // Makes the entire content clickable
                        .onTapGesture {
                            debugPrint("market clicked :0")
                            withAnimation {
                                buttonClicked = "market"
                                location = 67
                            }
                        } //end outfits button //end market button

                        Text("wishlist")
                            .foregroundColor(buttonClicked == "wishlist" ? .white : .black)
                            .font(.system(size: 13))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity)
                            .frame(width: 60, height: 25)
                            .cornerRadius(19)
                            .contentShape(Rectangle()) // Makes the entire content clickable
                            .onTapGesture {
                                withAnimation {
                                    buttonClicked = "wishlist"
                                    location = 204
                                }
                            }
                            .allowsHitTesting(true)
                            .zIndex(10)
                            //end wishlist button
                    
                }
                .padding(.bottom, 378)
                .contentShape(Rectangle())
                
                
                
            }
            .edgesIgnoringSafeArea(.bottom) //end first zstack
            
        }
    }
}

struct ClosetView: View { // use these to switch between views of closet, outfits, etc later on with navigationLink s
    var body: some View {
        VStack {
            
            HStack { // stack of white rectangles
                Rectangle()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(width: 170, height: 220)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .alignmentGuide(.leading) { dimension in
                        dimension[HorizontalAlignment.leading]
                    }
                    .padding(.top, -113)
                Rectangle()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(width: 170, height: 160)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .foregroundColor(.white)
                    .padding(.top, -167)
            }
            .padding(.top)
            // end of Hstack white rectangles
            
        } //end first vstack. eventually would be a vstack of other hstacks, assuming we'd have more rows. but for this example files purposes we just want a few clothing items
            
            HStack { // stack of clothing images
                Image("jeans")
                    .resizable() // Make the image resizable
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(width: 170, height: 220)
                    .cornerRadius(10)
                    .padding(.top, -90)
                    .alignmentGuide(.leading) { dimension in
                        dimension[HorizontalAlignment.leading]
                    }
                Image("converse")
                    .resizable() // Make the image resizable
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(width: 170, height: 160)
                    .cornerRadius(10)
                    .padding(.top, -163)
                    .onTapGesture {
                        debugPrint("Image tapped!")
                        // Add your onTapGesture code here
                    }
                    .allowsHitTesting(true)
            } // end of Hstack clothes images
            
    } // also for this view we might have everything in a zstack, since the clothing images need to be on top of the white backgrounds
}

struct WishlistView: View {
    var body: some View {
        VStack {
            
            HStack { // stack of white rectangles
                Rectangle()
                    .alignmentGuide(.leading) { dimension in
                        dimension[HorizontalAlignment.leading]
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(width: 170, height: 160)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .foregroundColor(.white)
                    .padding(.top, -167)
                Rectangle()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(width: 170, height: 220)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.top, -113)
            }
            .padding(.top)
            // end of Hstack white rectangles
            
        } //end first vstack. eventually would be a vstack of other hstacks, assuming we'd have more rows. but for this example files purposes we just want a few clothing items
            
            HStack { // stack of clothing images
                Spacer().frame(width: 10)
                Image("baggu")
                    .resizable() // Make the image resizable
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(width: 170, height: 160)
                    .cornerRadius(10)
                    .padding(.top, -163)
                    .onTapGesture {
                        debugPrint("Image tapped!")
                        // Add your onTapGesture code here
                    }
                    .allowsHitTesting(true)
                Spacer().frame(width: 10)
                Image("hoodie")
                    .resizable() // Make the image resizable
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(width: 160, height: 220)
                    .cornerRadius(10)
                    .padding(.top, -100)
                    .alignmentGuide(.leading) { dimension in
                        dimension[HorizontalAlignment.leading]
                    }
                Spacer().frame(width: 10)
            } // end of Hstack clothes images
            
    }
}

struct OutfitsView: View {
    var body: some View {
        Text("Nothing to see here yet :)")
    }
}

struct MarketView: View {
    var body: some View {
        Text("Nothing to see here yet :)")
    }
}


//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView()
//    }
//}

//end of code that we actually use


// general notes and other code implementations/examples:

// when repeating code in a stack, for example how we repeatedly made buttons closet, outfit, market, and wishlist all with similar properties, we can use views for that as well. we can create a view for one of the buttons, but use a variable for the string that we will input later when calling the view. heres an example implementation that i wont be actually calling in the code above just to save time

struct NavigationButtons: View {
    var buttonText: String
    var buttonLocation: CGFloat
    
    var body: some View {
        Text(buttonText)
//            .foregroundColor(buttonClicked == buttonText ? .white : .black) //this makes the code not work because we dont have access to "buttonClicked" since its declared in a separate view. but i dont know how to fix that rn lol so i would just repeat the code instead of using this if it uses variables like this
            .font(.system(size: 13))
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity)
            .frame(width: 60, height: 25)
            .cornerRadius(19)
            .padding(.top, -202)
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation {
//                    buttonClicked = buttonText
//                    location = buttonLocation
                }
            }
            .allowsHitTesting(true) //do i need this? idk
            //end closet button
    }
}

// so when we reuse this view, we will call it with its needed parameters like this: NavigationButtons(buttonText: "closet", buttonLocation: CGFloat(-132))    something like that

