//
//  HikeDetail.swift
//  test01
//
//  Created by hy on 2024/09/16.
//

import SwiftUI

import SwiftUI
 
struct HikeDetail: View {
    let hike: Hike
    @State var dataToShow = \Hike.Observation.elevation  // KeyPath<>: 初期値も設定
    // ↑ 型は明記していないが，本当は KeyPath<Hike.Observation, Range<Double>> という型になる
 
    var buttons = [  // (ボタン表示名, その値へのKeyPath)というタプル配列
        ("Elevation", \Hike.Observation.elevation),
        ("Heart Rate", \Hike.Observation.heartRate),
        ("Pace", \Hike.Observation.pace)
    ]
 
    var body: some View {
        return VStack {
            HikeGraph(hike: hike, path: dataToShow)  // Hikeインスタンスと，表示するもののKeyPathを渡している
                .frame(height: 200)
 
            HStack(spacing: 25) {
                ForEach(buttons, id: \.0) { value in
                    Button(action: {
                        self.dataToShow = value.1  // タプルの2つ目の要素(=KeyPath)を代入するというアクション
                    }) {
                        Text(value.0)  // ボタンテキストはタプルの1つ目(=String)
                            .font(.system(size: 15))
                            .foregroundColor(value.1 == self.dataToShow  // 三項演算子: もしタプル二番目要素と今表示しているKeyPathが一致しているならば
                                ? Color.gray
                                : Color.accentColor)
                            .animation(nil)  // アニメーションは指定なし
                    }
                }
            }
        }
    }
}

#Preview {
    HikeDetail(hike: hikeData[0])
}
