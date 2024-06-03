//
//  studentCouncilView.swift
//  BuBeeFinal
//
//  Created by 최주현 on 5/28/24.
//

import SwiftUI


struct studentCouncilView : View {
    var body: some View {
        NavigationView{
            VStack(){
                Image("StudentCouncil")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack(alignment: .leading, spacing: 0){
                    ZStack(alignment: .trailing){
                        Rectangle()
                            .frame(width:60, height: 20)
                            .foregroundStyle(Color.mainColor)
                        Text("나, 학생회")
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    
                    Text("행사에 많은 학우가 참여했으면..")
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.bottom,5)
                    
                    Text("홍보가 생각보다 잘 되지 않아 걱정인")
                        .font(.subheadline)
                    
                    Text("학생회를 위해, 편리한 폼 작성과")
                        .font(.subheadline)
                    VStack{
                        Text("행사 홍보 서비스")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        + Text("를 제공합니다")
                           
                    }
                    .font(.subheadline)
                }
                .padding(.leading,-80)
                NavigationLink(destination: LetsBuBee()){
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
    studentCouncilView()
}
