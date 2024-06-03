//
//  eventDetailView.swift
//  BuBeeFinal
//
//  Created by 최주현 on 5/28/24.
//

import SwiftUI

struct eventDetailView: View {
    @State private var isClicked: Bool = false
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(.light2)
                                    .frame(width: 395, height: 270)
                                Text("행사 이미지(1)")
                            }
                            ZStack {
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(.light1)
                                    .frame(width: 395, height: 270)
                                Text("행사 이미지(2)")
                            }
                        }
                    }
                    VStack(alignment: .leading) {
                        VStack {
                            HStack {
                                Text("컴퓨터공학과 2학기 종강총회")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                Text("D-13")
                                    .font(.system(size: 15))
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 10)
                                    .background(
                                        RoundedRectangle(cornerRadius: 30)
                                            .fill(.yellow)
                                    )
                                Spacer()
                                VStack {
                                    Button(action: {
                                        isClicked.toggle()
                                    }) {
                                        Image(systemName: isClicked ? "heart.fill" : "heart")
                                            .font(.system(size: 18))
                                            .foregroundStyle(isClicked ? Color.yellow : Color.black)
                                    }
                                    Text("59")
                                        .font(.system(size: 13))
                                }
                                .padding(.top, 10)
                            }
                            .padding(.horizontal, 15)
                        }
                        HStack {
                            keywordView(keyword: "신입생 환영")
                            keywordView(keyword: "유쾌한")
                            keywordView(keyword: "즐거운")
                        }
                        .padding(.top, -10)
                        .padding(.leading, 13)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            HStack {
                                Text("행사일시 : ").fontWeight(.semibold) + Text("2024.06.14 - 2024.06.20")
                            }
                            .font(.system(size: 13))
                            HStack {
                                Text("모집기간 : ").fontWeight(.semibold) + Text("2024.06.12")
                            }
                            .font(.system(size: 13))
                        }
                        .padding(.top, 5)
                        .padding(.leading, 13)
                        .padding(.bottom, 20)
                        
                        VStack(alignment: .leading) {
                            Text("행사 상세내용")
                                .font(.system(size: 19))
                                .fontWeight(.semibold)
                                .padding(.leading, 13)
                            Text("행사에 대한 상세한 내용이 표시됩니다.")
                                .font(.system(size: 16))
                                .foregroundStyle(.gray)
                                .padding(.top, -3)
                                .padding(.leading, 13)
                        }
                        
                    }
                }
            }
            .frame(height: 660)
            ZStack {
                Text("신청하러 가기")
                    .padding(.vertical, 20)
                    .padding(.horizontal, 60)
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.mainColor)
                    )
            }
            .padding(.bottom, 50)
        }
    }
}

struct keywordView:View {
    var keyword:String
    
    var body: some View {
        Text(keyword)
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .font(.system(size: 13))
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.keyWordBg)
            )
    }
}

#Preview {
    eventDetailView()
}
