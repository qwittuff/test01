//
//  RotatedBadgeSymbol.swift
//  test01
//
//  Created by hy on 2024/09/13.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotatedBadgeSymbol(angle: .init(degrees: 5))
}
