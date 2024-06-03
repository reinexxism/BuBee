//
//  freshmanView.swift
//  BuBeeFinal
//
//  Created by 최주현 on 5/28/24.
//

import SwiftUI


struct freshmanView : View {
    var body: some View {
        NavigationView{
            VStack(spacing:0){
                Image("FreshMan")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack(alignment: .leading, spacing: 0){
                    ZStack(alignment: .trailing){
                        Rectangle()
                            .frame(width:70, height: 20)
                            .foregroundStyle(Color.mainColor)
                        Text("나, 신입생!")
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    
                    Text("참여가능한 행사가 뭐가 있지?")
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.bottom,5)
                    
                    Text("자율전공제로 행사 참여가 어려운 당신,")
                        .font(.subheadline)
                    Text("신입생도 참여가능한 학과별 행사를")
                        .font(.subheadline)
                    VStack{
                        Text("해시태그 기능")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        + Text("으로 한눈에 볼 수 있습니다!")
                    }
                    .font(.subheadline)
                }
                .padding(.leading,-100)
                NavigationLink(destination: currentStudentView()){
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
                .offset(CGSize(width: 100, height: 10))
                
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    freshmanView()
}
