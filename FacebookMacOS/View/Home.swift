//
//  Home.swift
//  FacebookMacOS
//
//  Created by Vladimir Pisarenko on 11.05.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct Home: View {
    
    var screen = NSScreen.main!.visibleFrame
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                HStack {
                    Text("facebook")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundStyle(Color.fb)
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack{
                            Image("logo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 35)
                                .background(Color.red.opacity(0.2))
                                .clipShape(Circle())
                            
                            Text("Kavsoft")
                                .foregroundStyle(.black)
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.black)
                            .padding(10)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Circle())
                    })
                    .buttonStyle(PlainButtonStyle())
                    .padding(.leading, 8)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                         Image("messanger")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20)
                            .padding(10)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Circle())
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.vertical)
                .padding(.leading, 10)
                .padding(.trailing)
                .padding(.top, 12)
                .background(.white)
            .shadow(color: .black.opacity(0.08), radius: 5, x: 0, y: 5)
            }
            
            HStack{
                SideBarView()
                
                PostView()
                
                ContactsView()
            }
            .frame(maxHeight: .infinity)
           
        }
        .ignoresSafeArea(.all, edges: .all)
        .frame(width: screen.width / 1.4, height: screen.height - 60)
        .background(Color.bg)
        .preferredColorScheme(.light)
    }
}

struct SideBarButton: View {
    var image: String
    var title: String
    var color: String
    var isSystem: Bool
    
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            HStack(spacing: 8) {
                if isSystem {
                    
                    Image(systemName: image)
                        .font(.system(size: 25))
                        .foregroundStyle(Color(color))
                        .frame(width: 25)
                } else {
                    Image(image)
                        .resizable()
                        .renderingMode(color == "" ? .original : .template)
                        .foregroundStyle(Color(color))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                }
                
                Text(title)
                    .foregroundStyle(.black)
            }
            .padding(.horizontal)
        })
        .buttonStyle(PlainButtonStyle())
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    Home()
}

struct PostView: View {
    var body: some View {
        
        ScrollView {
            
            VStack{
                
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct SideBarView: View {
    var screen = NSScreen.main!.visibleFrame
    
    var body: some View {
        VStack(spacing: 18){
            SideBarButton(image: "logo", title: "Kavsoft", color: "", isSystem: false)
                .padding(.top, 20)
            SideBarButton(image: "shield.checkerboard", title: "Covid 19 info center", color: "covid", isSystem: true)
            
            SideBarButton(image: "person.2.fill", title: "Friends", color: "friends", isSystem: true)
            
            SideBarButton(image: "messanger", title: "Messenger", color: "", isSystem: false)
            
            SideBarButton(image: "flag.fill", title: "Pages", color: "pages", isSystem: true)
            
            SideBarButton(image: "shop", title: "Marketplace", color: "market", isSystem: false)
            
            SideBarButton(image: "tv.fill", title: "Watch", color: "watch", isSystem: true)
            
            SideBarButton(image: "calender", title: "Events", color: "", isSystem: false)
            Spacer()
        }
        .frame(maxWidth: (screen.width / 1.8) / 4, maxHeight: .infinity)
    }
}

struct ContactsView: View {
    var screen = NSScreen.main!.visibleFrame
    
    var body: some View {
        VStack{
            HStack{
                Text("Contacts")
                    .fontWeight(.bold)
                    .foregroundStyle(.gray)
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray)
                })
                .buttonStyle(PlainButtonStyle())
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "slider.vertical.3")
                        .foregroundStyle(.gray)
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding()
            
            ScrollView{
                ForEach(users) { user in
                    HStack{
                        WebImage(url: URL(string: user.url)!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                        
                        Text(user.name)
                            .foregroundStyle(.black)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            }
        }
        .frame(maxWidth: (screen.width / 1.8) / 4, maxHeight: .infinity)
    }
}
