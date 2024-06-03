//
//  eventCardView.swift
//  BuBeeFinal
//
//  Created by 최주현 on 5/28/24.
//

import SwiftUI

struct eventCardView: View {
    var imageName: String
    var eventName: String
    var startDday: Int
    var recruitDday: Int
    var attendeeType: [String]
    var eventCharacter: [String]
    var likedNumber: Int
    var cardBg: Color
    var keywordBg: Color
    @State var isLikeClicked: Bool
    
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(cardBg)
                    .frame(width: 350, height: 160)
                HStack {
                    Image(imageName)
                        .resizable()
                        .frame(width: 130, height: 160)
                        .padding(.leading, -20)
                    VStack {
                        Text(eventName)
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .padding(.leading, -25)
                            .padding(.bottom, 15)
                        VStack(alignment: .leading) {
                            HStack {
                                Text("행사 시작까지 ") + Text("\(startDday)일").foregroundStyle(.black).fontWeight(.semibold) + Text(" 남았습니다.")
                            }
                                        .font(.system(size: 10))
                                        .foregroundColor(.secondary)
                                        HStack {
                                            Text("행사 모집 마감까지 ") + Text("\(recruitDday)일").foregroundStyle(.black).fontWeight(.semibold) + Text(" 남았습니다.")
                                        }
                                        .font(.system(size: 10))
                                        .foregroundColor(.secondary)
                                    }
                                    .padding(.leading, -50)
                                    .padding(.top, -20)
                                    .padding(.bottom, 10)
                                
                                VStack(alignment: .leading) {
                                    HStack {
                                        ForEach(attendeeType, id: \.self) {
                                            type in Text(type)
                                                .padding(.horizontal, 6)
                                                .padding(.vertical, 4)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 12)
                                                        .fill(keywordBg)
                                                )
                                                .font(.system(size: 10))
                                        }
                                    }
                                    HStack {
                                        ForEach(eventCharacter, id: \.self) {
                                            character in Text(character)
                                                .padding(.horizontal, 10)
                                                .padding(.vertical, 4)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 12)
                                                        .fill(keywordBg)
                                                )
                                                .font(.system(size: 10))
                                        }
                                    }
                                }
                                .padding(.bottom, 10)
                                .padding(.leading, -40)
                        HStack {
                            HStack {
                                Text("현재") + Text(" \(likedNumber)명이 ").fontWeight(.semibold).foregroundStyle(.black
                                ) + Text("관심행사로 등록했습니다!")
                            }
                            .foregroundStyle(.secondary)
                            .font(.system(size: 9))
                            .padding(.leading, -45)
                            Button(action: {
                                isLikeClicked.toggle()
                            }) {
                                Image(systemName: isLikeClicked ? "heart.fill" : "heart")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(isLikeClicked ? Color.mainColor : .black)
                                    .padding(.leading, 40)
                            }
                        }
                        .padding(.leading, 50)
                    }

                }
            }
            .padding()
    }
}

#Preview {
    eventCardView(imageName: "eventSample", eventName: "컴퓨터공학과 2학기 종강총회", startDday: 13, recruitDday: 2, attendeeType: ["신입생 환영", "복전생 환영"], eventCharacter: ["유쾌한", "즐거운", "화목한"], likedNumber: 59, cardBg: Color.light1, keywordBg: Color.light2, isLikeClicked: true)
}

