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
    
    @State var selected = "house.fill"
    @Namespace var animation
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
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
                
                HStack{
                    
                    TabButton(image: "house.fill", selected: $selected, animation: animation )
                    TabButton(image: "play.tv", selected: $selected, animation: animation )
                    TabButton(image: "person.circle", selected: $selected, animation: animation )
                    TabButton(image: "person.3.fill", selected: $selected, animation: animation )
                    TabButton(image: "bell", selected: $selected, animation: animation )
                    TabButton(image: "line.horizontal.3", selected: $selected, animation: animation )
                }
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

struct TabButton: View {
    
    var image: String
    @Binding var selected: String
    var animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation {
                selected = image
            }
        }, label: {
            VStack(spacing: 0){
                Image(systemName: image)
                    .font(.title)
                    .foregroundStyle(selected == image ? .fb : .gray.opacity(0.7))
                    .frame(height: 40)
                
                ZStack {
                    Capsule()
                        .fill(.clear)
                        .frame(width: 65, height: 3)
                        .matchedGeometryEffect(id: "Tab", in: animation)
                    
                    if selected == image {
                        Capsule()
                            .fill(.fb)
                            .frame(width: 65, height: 3)
                            .matchedGeometryEffect(id: "Tab", in: animation)
                    }
                }
            }
            

        })
        .buttonStyle(PlainButtonStyle())
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

struct PostView: View {
    @State var post = ""
    
    var body: some View {
        
        ScrollView {
            
            VStack{
                
                VStack{
                    
                    HStack{
                        Image(.logo)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                        TextField("What's in your mind", text: $post)
                            .textFieldStyle(.plain)
                    }
                    
                    Divider()
                    
                    HStack{
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Label(title: { Text("Live").foregroundStyle(.black) },
                                  icon: { Image(systemName: "video.fill")
                                    .foregroundStyle(.red)
                            })
                            .frame(maxWidth: .infinity)
                        })
                         .buttonStyle(PlainButtonStyle())
                        
                        Divider()
                            .padding(.vertical, -5)
                        
                        Button(action: {}, label: {
                            Label(title: { Text("Photos").foregroundStyle(.black) },
                                  icon: { Image(systemName: "photo.on.rectangle")
                                    .foregroundStyle(.green)
                            })
                            .frame(maxWidth: .infinity)
                        })
                         .buttonStyle(PlainButtonStyle())
                        
                        Divider()
                            .padding(.vertical, -5)
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Label(title: { Text("Room").foregroundStyle(.black) },
                                  icon: { Image(systemName: "video.fill.badge.plus")
                                    .foregroundStyle(.purple)
                            })
                            .frame(maxWidth: .infinity)
                        })
                         .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(10)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Label(
                                title: { Text("Create Room") },
                                icon: { Image(systemName: "video.badge.plus").foregroundStyle(.purple) }
                            )
                            .padding(10)
                            .background(Capsule().strokeBorder(.purple))
                        })
                        .buttonStyle(PlainButtonStyle())
                        
                        ForEach(users) { user in
                            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
                                WebImage(url: URL(string: user.url) )
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 35, height: 35)
                                    .clipShape(Circle())
                                
                                Circle()
                                    .fill(.green)
                                    .frame(width: 10, height: 10)
                            })
                        }
                    }
                    .padding(10)
                }
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                ForEach(posts) { post in
                    PostCardView(post: post)
                }
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

struct PostCardView: View {
    
    var post: Post
    
    var body: some View {
        VStack{
            
            HStack{
                
                WebImage(url: URL(string: post.user.url)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 5){
                    Text(post.user.name)
                        .foregroundStyle(.black)
                    
                    HStack(spacing: 5){
                        Text(post.postTime)
                            .foregroundStyle(.gray)
                        
                        Circle()
                            .fill(.gray)
                            .frame(width: 3, height: 3)
                        Image(systemName: "globe")
                            .foregroundStyle(.gray)

                    }
                }
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("menu")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18, height: 18)
                        .foregroundStyle(.black)
                        .rotationEffect(.init(degrees: 90))
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal, 10)
            
            Text(post.title)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 10)
            
            WebImage(url: URL(string: post.imageURL)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            HStack{
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundStyle(.fb)
                 
                Text(post.likes)
                
                Spacer()
                
                Text("\(post.comments) Comments")
                    .foregroundStyle(.gray)
                
                Text("\(post.shares) Shares")
                    .foregroundStyle(.gray)
            }
            .padding(.horizontal,10)
            .padding(.top,5)
            
            Divider()
            
            HStack{
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Label(title: { Text("Like") },
                          icon: { Image(systemName: "hand.thumbsup") }
                    )
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity)
                })
                 .buttonStyle(PlainButtonStyle())
                
                Divider()
                    .padding(.vertical, -5)
                
                Button(action: {}, label: {
                    Label(title: { Text("Comment") },
                          icon: { Image(systemName: "arrow.up.message") }
                    )
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity)
                })
                 .buttonStyle(PlainButtonStyle())
                
                Divider()
                    .padding(.vertical, -5)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Label(title: { Text("Share") },
                          icon: { Image(systemName: "square.and.arrow.up") }
                    )
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity)
                })
                 .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal,10)
            .padding(.top,10)
        }
        .padding(.vertical)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    Home()
}
