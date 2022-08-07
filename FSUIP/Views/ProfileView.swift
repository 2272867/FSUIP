//
//  ProfileView.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 31.07.22.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
            ZStack {
                ScrollView {
                    VStack {
                        Image("pepegaProfile")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                        
                    }
                    
                }
                
            }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
