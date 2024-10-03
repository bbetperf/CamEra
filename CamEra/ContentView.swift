//
//  ContentView.swift
//  CamEra
//
//  Created by Maksim on 10/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            let photos = [
                Photo("Lily Pads"),
                Photo("Fish"),
                Photo("Succulent")
            ]
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 8) {
                    ForEach(photos) { photo in
                        VStack {
                            ZStack {
                                ItemPhoto(photo)
                                    .scrollTransition(axis: .horizontal) { content, phase in
                                        content
                                            .offset(x: phase.isIdentity ? 0 : phase.value * -200)
                                    }
                            }
                            .containerRelativeFrame(.horizontal)
                            .clipShape(RoundedRectangle(cornerRadius: 36))
                
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .contentMargins(.horizontal, 16)
            .scrollTargetBehavior(.paging)
            .padding(.vertical, 32)
            
            VStack {
                Text("This app consolidates your food orders in one place.")
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 16)
                    .padding(.horizontal, 16)
                
                Text("You can track your orders, get notifications for special deals, and explore a variety of cuisines and restaurants.")
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 32)
                    .padding(.horizontal, 16)
                
                Button("Next") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .buttonStyle(FullWidthButtonStyle())
                .padding(.bottom, 16)
                .padding(.horizontal, 16)
                
                Button("About App and Privacy") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(.automatic)
                .padding(.bottom, 16)
                
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct Photo: Identifiable {
    var title: String
    
    var id: Int = .random(in: 0 ... 100)
    
    init(_ title: String) {
        self.title = title
    }
}

struct ItemPhoto: View {
    var photo: Photo
    
    init(_ photo: Photo) {
        self.photo = photo
    }
    
    var body: some View {
        Image(photo.title)
            .resizable()
            .scaledToFill()
            .frame(maxHeight: .infinity)
    }
}

struct FullWidthButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            .padding(.vertical, 14)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(configuration.isPressed ? 16 : 12)
    }
}

#Preview {
    ContentView()
}
