//
//  anothertestfile.swift
//  Paperdoll
//
//  Created by Isabelle Smith on 1/19/24.
// general file for testing small swiftui features to get familiar with them. we will delete when deploying app

import Foundation
import SwiftUI
import CoreData


struct ContentView2: View {
    var body: some View {
        NavigationView {
            
            ZStack {
            
                
//                NavigationLink (destination: RandomView()) {
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(width: 200)
                        .frame(height: 200)
                        .onTapGesture {
                            debugPrint("red clicked")
                        }
                        .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
//                }
                
//                NavigationLink (destination: RandomView()) {
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(width: 200)
                        .frame(height: 200)
                        .onTapGesture {
                            debugPrint("blue clicked")
                        }
                        .padding(.top, -100)
//                }
                
                
            } // end zstack
            
        } // end navigation view
    }
}

struct RandomView: View {
    var body: some View {
        NavigationView {
            VStack {
                
            }

        }
    }
}


#Preview {
    ContentView2().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
