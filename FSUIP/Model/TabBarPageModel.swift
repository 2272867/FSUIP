//
//  TabbarModel.swift
//  FSUIP
//
//  Created by Солодкий Артур Жанович on 30.08.22.
//

import Foundation
import SwiftUI

struct TabBarPageModel: Identifiable {
    var id = UUID()
    var page: Any
    var icon: String
    var fillColor: Color
}
