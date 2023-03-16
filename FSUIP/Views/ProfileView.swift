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
    @State private var name = " "
    @State private var phoneNumber = " "
    @State private var isProfileExpended: Bool = false
    @State private var currentAddres: String = "Текущий адрес доставки: Минск, Широкая, д. 3, кв. 26"
    @Namespace private var profileAnimation
    @Namespace private var profileAvatar
    @Namespace private var profileName
    @Namespace private var profileEmail
    
    var body: some View {
//        ScrollView {
//            if isProfileExpended {
//
//                expendedProfileView
//
//            } else {
//
//                collapsedProfileView
//                previosOrderListView
//
//            }
//
//        }
//        .padding(.top, 1)
 //       var expendedProfileView: some View {
            VStack {
                profileImageView
                    .frame(width: 250, height: 250)
                    .scaledToFill()
                    .overlay(Circle().stroke(Color.purple, lineWidth: 5))
                    .shadow(radius: 10)
                    .clipShape(Circle())
                    .matchedGeometryEffect(id: profileAvatar, in: profileAnimation)
                HStack {
                    Text("Имя")
                    TextField("", text: $name)
                        .matchedGeometryEffect(id: profileName, in: profileAnimation)
                }
                .cornerRadius(20)
                .padding(10)
                .padding(.horizontal)
                .background(.ultraThinMaterial)
                .foregroundColor(.black)
                .cornerRadius(15)
                .padding(.horizontal)
                .shadow(color: Color.purple.opacity(0.5), radius: 4, x: 6, y: 3)
                .frame(width: nil, height: 60)
                
                
                HStack {
                    Text("Телефон")
                    TextField("", text: $phoneNumber)
                }
                .cornerRadius(20)
                .padding(10)
                .padding(.horizontal)
                .background(.ultraThinMaterial)
                .foregroundColor(.black)
                .cornerRadius(15)
                .padding(.horizontal)
                .shadow(color: Color.purple.opacity(0.5), radius: 4, x: 6, y: 3)
                .frame(width: nil, height: 60)
                
                
                TextField("", text: $name)
                    .lineLimit(1)
                    .matchedGeometryEffect(id: profileName, in: profileAnimation)
                Spacer()
                
                Text("\(Auth.auth().currentUser?.email ?? "")")
                    .lineLimit(1)
                    .matchedGeometryEffect(id: profileEmail, in: profileAnimation)
                
                Spacer()
                
                TextEditor(text: $currentAddres)
                Button("Выйти") {
                    model.logOut()
                }
            }
    //    }
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
                    TextField("", text: $name)
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

