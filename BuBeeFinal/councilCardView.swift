//
//  councilCardView.swift
//  BuBeeFinal
//
//  Created by 최주현 on 5/28/24.
//

import SwiftUI

struct councilCardView: View {
    var imageName: String
    var eventName: String
    var startDday: Int
    var recruitDday: Int
    var attendeeType: [String]
    var eventCharacter: [String]
    var likedNumber: Int
    @State var isLikeClicked: Bool
    
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.cardBg)
                    .frame(width: 350, height: 160)
                HStack {
                    Image(imageName)
                        .resizable()
                        .frame(width: 130, height: 160)
                        .padding(.leading, -20)
                    VStack {
                        Text(eventName)
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
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
                                                        .fill(.keyWordBg)
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
                                                        .fill(.keyWordBg)
                                                )
                                                .font(.system(size: 10))
                                        }
                                    }
                                }
                                .padding(.bottom, 10)
                                .padding(.leading, -40)
                        HStack {
                            Image(systemName: "trash.fill")
                            Image(systemName: "pencil.and.outline")
                        }
                        .padding(.leading, 150)
                    }

                }
            }
        .padding()
    }
}

#Preview {
    councilCardView(imageName: "eventSample", eventName: "컴퓨터공학과 2학기 종강총회", startDday: 13, recruitDday: 2, attendeeType: ["신입생 환영", "복전생 환영"], eventCharacter: ["유쾌한", "즐거운", "화목한"], likedNumber: 59, isLikeClicked: true)
}

