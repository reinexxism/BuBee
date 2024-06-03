//
//  startsView.swift
//  BuBeeFinal
//
//  Created by 최주현 on 5/28/24.
//

import SwiftUI

struct startsView: View {
    var body: some View {
        NavigationView{
            VStack(spacing:0){
                Image("StartImg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading){
                    Text("부비")
                        .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("BUFS EVENTS")
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.bottom,3)
                    Text("부산외국어대학교 신입생부터 재학생까지")
                        .font(.subheadline)
                    VStack{
                        Text("학교의 모든 행사를 한눈에, 이제 ")
                        + Text("부비")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        + Text("에서 만나보세요!")
                    }
                    .font(.subheadline)
                }
                .padding(.leading,-50)
                NavigationLink(destination: freshmanView()){
                    ZStack{
                        Circle()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                            .foregroundColor(Color.mainColor)
                            .padding()
                        Image(systemName: "arrow.forward")
                            .font(.title)
                            .foregroundStyle(Color.textColor)
                    }
                }
                .offset(CGSize(width: 100, height: 30))
                
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    startsView()
}
