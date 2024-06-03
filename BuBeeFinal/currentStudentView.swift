//
//  currentStudentView.swift
//  BuBeeFinal
//
//  Created by 최주현 on 5/28/24.
//

import SwiftUI


struct currentStudentView : View {
    var body: some View {
        NavigationView{
            VStack(spacing: 0){
                Image("currentStudent")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack(alignment: .leading, spacing: 0){
                    ZStack(alignment: .trailing){
                        Rectangle()
                            .frame(width:60, height: 20)
                            .foregroundStyle(Color.mainColor)
                        Text("나, 재학생")
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    
                    Text("우리 학과 행사를 놓치기 싫어..")
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.bottom,5)
                    
                    Text("신입생 뿐만 아니라 재학생도 학과 행사,")
                        .font(.subheadline)
                    
                    VStack{
                        Text("교내 행사, 동아리 행사에서 ")
                            .font(.subheadline)
                        + Text("관심행사 등록")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        + Text("후")
                    }
                    .font(.subheadline)
                    Text("알림을 받을 수 있습니다.")
                }
                .padding(.leading,-100)
                NavigationLink(destination: studentCouncilView()){
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
    currentStudentView()
}
