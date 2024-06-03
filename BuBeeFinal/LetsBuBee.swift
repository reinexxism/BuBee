//
//  LetsBuBee.swift
//  BuBeeFinal
//
//  Created by 최주현 on 5/28/24.
//

import SwiftUI

struct LetsBuBee: View {
    var body: some View {
        NavigationView{
            VStack{
                Image("LetsBuBee")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                //destination bubeeMain()으로 바꾸기
                NavigationLink(destination: ContentView()){
                    ZStack{
                        Capsule()
                            .frame(width: 300,height: 70)
                            .foregroundStyle(Color.mainColor)
                        HStack{
                            Text("부비에서 학과별 행사 살펴보기 ")
                                .foregroundStyle(Color.textColor)
                            Image(systemName:"arrow.forward")
                                .foregroundColor(Color.textColor)
                        }
                    }
                }
                .padding(.bottom,3)
                //destination LoginStudentCouncil()로 바꾸기
                NavigationLink(destination: loginView()){
                    Text("학생회이신가요?")
                        .font(.subheadline)
                        .underline()
                        .foregroundStyle(Color.textColor)
                }
                Spacer()
                
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    LetsBuBee()
}
