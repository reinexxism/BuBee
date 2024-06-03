//
//  loginView.swift
//  BuBeeFinal
//
//  Created by 최주현 on 5/28/24.
//

import SwiftUI

extension Color{
    static let mainColor = Color("MainColor")
    static let textColor = Color("TextColor")
}
struct loginView: View {
    @State private var id = ""
    @State private var pw = ""

    var body: some View {
        NavigationView{
            ZStack{
                Image("loginStudent")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 0){
                    Text("Login")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .padding(.bottom,50)
                        .padding(.top,250)
                    VStack(alignment: .leading){
                        Text("학생회ID")
                        TextField("학생회 고유번호를 입력하세요", text: $id)
                            .padding()
                            .background(Color.white)
                            .frame(width: 300)
                            .cornerRadius(10)
                    }
                    VStack(alignment: .leading){
                        Text("Password")
                        SecureField("비밀번호를 입력하세요", text: $pw)
                            .padding()
                            .background(Color.white)
                            .frame(width: 300)
                            .cornerRadius(10)
                    }
                    
                    .padding(.top,10)
                    //로그인  destination bubeeMain()으로 변경
                    NavigationLink(destination:loginView()){
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 300, height: 50)
                                .foregroundColor(.white)
                            
                            Text("로그인")
                                .font(.title3)
                                .foregroundColor(.mainColor)
                        }
                        .padding(.vertical,20)
                    }
                    
                    NavigationLink(destination:loginView()){
                        Text("비밀번호 찾기 / 비밀번호 변경")
                            .underline()
                            .foregroundStyle(Color.textColor)
                    }
                    
                    //로그인  destination bubeeMain()으로 변경
                    NavigationLink(destination: LetsBuBee()){
                        Text("학생회가 아니에요!")
                            .padding(.top,50)
                            .foregroundStyle(Color.textColor)
                    }
                    
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    loginView()
}
