//
//  mainView.swift
//  BuBeeFinal
//
//  Created by 최주현 on 5/28/24.
//

import SwiftUI

struct mainView: View {
    @State private var searchKeyword: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image("bubeeLogo")
                        .resizable()
                        .frame(width: 50, height: 50)
                    TextField("", text: $searchKeyword, prompt: Text("관심있는 행사를 검색해보세요!").font(.system(size: 14)))
                        .padding(.vertical, 8)
                        .padding(.leading, 14)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.filterBg)
                        )
                }
                .padding(.top, -30)
                .padding(.bottom, 15)
                
                VStack {
                    Text("현시각 부산외대 행사 TOP3!")
                        .font(.system(size: 19))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.bottom, -2)
                    Text("클릭하면 행사 상세 내용을 확인할 수 있어요!")
                        .font(.system(size: 14))
                        .foregroundStyle(Color.secondary)
                        .padding(.bottom, 5)
                        VStack {
                            textView(text: "1. 이공대 해커톤 행사")
                            NavigationLink(destination: eventDetailView()) {
                                textView(text: "2. 컴퓨터공학과 종강총회")
                                    .foregroundColor(.black)
                            }
                            textView(text: "3. 멋쟁이사자처럼 5월 정기모임")
                        }
                    .frame(height: 120)
                }
                .padding(.bottom, 10)
                
                VStack {
                    HStack {
                        majorView(bgColor: Color.light1, majorName: "유럽미주대학")
                        majorView(bgColor: Color.light2, majorName: "아시아대학")
                    }
                    HStack {
                        majorView(bgColor: Color.light3, majorName: "사회과학대학")
                        majorView(bgColor: Color.light1, majorName: "상경대학")
                    }
                    HStack {
                        NavigationLink(destination: aboutITView()) {
                            majorView(bgColor: Color.light2, majorName: "디지털미디어 IT대학")
                        }
                        majorView(bgColor: Color.light3, majorName: "만오교양대학")
                    }
                }
            }
            .padding()
            Spacer()
        }

    }
}

struct textView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 14))
            .fontWeight(.semibold)
            .frame(width: 250, height: 33)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.mainColor)
            )
    }
}

struct majorView: View {
    @State private var isClicked:Bool = false
    var bgColor: Color
    
    var majorName: String
    var body: some View {
        
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(bgColor)
                    .frame(width: 160, height: 140)
                Text(majorName)
                    .foregroundStyle(.black)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .padding(.top, -55)
            }
        
    }
}

#Preview {
    mainView()
}

