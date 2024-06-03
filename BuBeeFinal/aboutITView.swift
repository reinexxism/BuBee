//
//  aboutITView.swift
//  BuBeeFinal
//
//  Created by 최주현 on 5/28/24.
//

import SwiftUI

struct aboutITView: View {
    @State private var selectedMajor: String = "전체"
    
    var body: some View {
        NavigationView {
            VStack() {
                Text("지금, 디지털미디어 - IT대학에서는?")
                    .font(.system(size: 21))
                    .fontWeight(.semibold)
                    .padding(.bottom, 15)
                    .padding(.leading, -50)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        majorKeywordView(majorName: "전체", selectedMajor: "전체")
                        majorKeywordView(majorName: "영상컨텐츠융합전공", selectedMajor: "영컨")
                        majorKeywordView(majorName: "글로벌웹툰콘텐츠전공", selectedMajor: "글로벌웹툰")
                        majorKeywordView(majorName: "컴퓨터공학전공", selectedMajor: "컴공")
                        majorKeywordView(majorName: "소프트웨어전공", selectedMajor: "소프트웨어")
                        majorKeywordView(majorName: "빅데이터전공", selectedMajor: "빅데")
                        majorKeywordView(majorName: "스마트융합보안전공", selectedMajor: "스융")
                        majorKeywordView(majorName: "전자-인공지능융합전공", selectedMajor: "전자인공")
                        majorKeywordView(majorName: "스마트에너지-환경전공", selectedMajor: "스마트에너")
                    }
                }
                .frame(width: 350)
                .padding(.bottom, 15)
                RoundedRectangle(cornerRadius: 0)
                    .fill(Color.secondary)
                    .frame(width: 350, height: 2)
                    .padding(.bottom, 5)
                
                ScrollView() {
                    VStack(spacing: -20) {
    //                    여기에 학과별 event-card 삽입
                        NavigationLink(destination: eventDetailView()) {
                            eventCardView(imageName: "", eventName: "컴퓨터공학과 2학기 종강총회", startDday: 13, recruitDday: 5, attendeeType: ["신입생 환영", "재학생 환영"], eventCharacter: ["유쾌한", "친근한", "즐거운"], likedNumber: 23, cardBg: Color.light1, keywordBg: Color.light2, isLikeClicked: false)
                                .foregroundStyle(.black)
                        }
                        eventCardView(imageName: "", eventName: "컴퓨터공학과 2학기 종강총회", startDday: 13, recruitDday: 5, attendeeType: ["신입생 환영", "재학생 환영"], eventCharacter: ["유쾌한", "친근한", "즐거운"], likedNumber: 23, cardBg: Color.light2, keywordBg: Color.light1, isLikeClicked: false)
                        eventCardView(imageName: "", eventName: "컴퓨터공학과 2학기 종강총회", startDday: 13, recruitDday: 5, attendeeType: ["신입생 환영", "재학생 환영"], eventCharacter: ["유쾌한", "친근한", "즐거운"], likedNumber: 23, cardBg: Color.light1, keywordBg: Color.light2, isLikeClicked: false)
                        eventCardView(imageName: "", eventName: "컴퓨터공학과 2학기 종강총회", startDday: 13, recruitDday: 5, attendeeType: ["신입생 환영", "재학생 환영"], eventCharacter: ["유쾌한", "친근한", "즐거운"], likedNumber: 23, cardBg: Color.light2, keywordBg: Color.light1, isLikeClicked: false)
                    }
                }
            }
            .padding()
        }
    }
}

struct majorKeywordView: View {
    var majorName: String
    @State var isClicked: Bool = false
    var selectedMajor: String
    
    var body: some View {
        Button(action: {
            isClicked.toggle()
        }) {
            Text(majorName)
                .foregroundStyle(isClicked ? Color.black : Color.gray)
                .font(.system(size: 15))
                .padding(.horizontal, 15)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(isClicked ? Color.mainColor : Color.clear)
                )
                .padding(.trailing, -3)
        }
    }
}

#Preview {
    aboutITView()
}
