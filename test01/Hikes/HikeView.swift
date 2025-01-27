//
//  HikeView.swift
//  test01
//
//  Created by hy on 2024/09/16.
//



import SwiftUI
 
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        
        return .asymmetric(insertion: insertion, removal: removal)
    }
}


struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false
 
    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)  // ここでもKeyPath: 今回はHike.Observationであることは定義から自明なので，省略して \. と表記している
                    .frame(width: 50, height: 30)
 
                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }
              
                
                Spacer()
 
                Button(action: {
                    withAnimation(.easeInOut(duration: 2)){
                    
                        self.showDetail.toggle()
                    }
                    
                 
                   
                        
                }) {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .scaleEffect(showDetail ? 1.5:1)
                        .padding()
                        .animation(Animation.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 1), value: showDetail)
                        
                        
                }
            }
 
            if showDetail {
                HikeDetail(hike: self.hike)
                    .transition(.moveAndFade)
            }
        }
    }
}

#Preview {
    VStack {
                HikeView(hike: hikeData[0])
                    .padding()
                Spacer()
            }
}
