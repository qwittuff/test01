//
//  test01App.swift
//  test01
//
//  Created by hy on 2024/09/10.
//

import SwiftUI

@main
struct test01App: App {
    var body: some Scene {
        WindowGroup {
            LandmarkDetail(landmark: landmarkData[0])
        }
    }
}
