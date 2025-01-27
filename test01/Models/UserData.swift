//
//  UserData.swift
//  test01
//
//  Created by hy on 2024/09/12.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var hikes = hikeData
    @Published var features = featuresData
    @Published var categories = categoriesData
    @Published var profile = Profile.default
}

