//
//  ProfileView.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 31.07.22.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @AppStorage("login_Status") var status = true
    @StateObject var model = CredentialsModel()
    @State private var isProfileExpended: Bool = false
    @State private var currentAddres: String = "ul. kurica dom pituha"
    @Namespace private var profileAnimation
    @Namespace private var profileAvatar
    @Namespace private var profileName
    @Namespace private var profileEmail
    
    var body: some View {
        ScrollView {
            if isProfileExpended {
                
                expendedProfileView
                
            } else {
                
                collapsedProfileView
                previosOrderListView
                
            }

        }
        .padding(.top, 1)
    }
    
    var expendedProfileView: some View {
        VStack {
            profileImageView
                .frame(width: 250, height: 250)
                .scaledToFill()
                .overlay(Circle().stroke(Color.purple, lineWidth: 5))
                .shadow(radius: 10)
                .clipShape(Circle())
                .matchedGeometryEffect(id: profileAvatar, in: profileAnimation)

            Text("Name Surname")
                .lineLimit(1)
                .matchedGeometryEffect(id: profileName, in: profileAnimation)
            Spacer()
            
            Text("111\(Auth.auth().currentUser?.email ?? "")")
                .lineLimit(1)
                .matchedGeometryEffect(id: profileEmail, in: profileAnimation)
            
            TextEditor(text: $currentAddres)
                    Button("Выйди и зайди нормально!!!") {
                        model.logOut()
                    }
        }
    }
    
    var collapsedProfileView: some View {
        HStack {
            profileImageView
                .frame(width: 60, height: 60)
                .scaledToFill()
                .overlay(Circle().stroke(Color.purple, lineWidth: 5))
                .shadow(radius: 10)
                .clipShape(Circle())
                .matchedGeometryEffect(id: profileAvatar, in: profileAnimation)
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color.purple.opacity(0.7))
                VStack {
                    Text("Name Surname")
                        .lineLimit(1)
                        .matchedGeometryEffect(id: profileName, in: profileAnimation)
                    Text("\(Auth.auth().currentUser?.email ?? "")")
                        .lineLimit(1)
                        .matchedGeometryEffect(id: profileEmail, in: profileAnimation)
                }
                
            }
            Spacer()
            Button(action: {
                withAnimation(.spring()) {
                    
                    isProfileExpended.toggle()
                }
            }, label: {
                Image(systemName: "ellipsis.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
                    .invertOnDarkTheme()
            })
        }
        .padding()
    }
    
    
    var profileImageView: some View {
        Image("pepegaProfile")
            .resizable()
            .onTapGesture {
                withAnimation(.spring()) {
                    
                    isProfileExpended.toggle()
                }
            }
        //.overlay(Circle().stroke(Color.purple, lineWidth: 5))
        // .shadow(radius: 10)
        //.frame(width: 60, height: 60)
        // .scaledToFill()
        //.clipShape(Circle())
        
    }
    
    var previosOrderListView: some View {
        Text("1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15")
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

