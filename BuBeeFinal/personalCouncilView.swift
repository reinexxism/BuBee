//
//  personalCouncilView.swift
//  BuBeeFinal
//
//  Created by 최주현 on 5/28/24.
//

import SwiftUI

struct Personal_StudentCouncil: View {
    @State private var selectedCategory: Category = .ongoing
    @State private var isPresentingEventCreationView = false
    
    var body: some View {
        NavigationView {
            VStack {
                UserInfoView()
                    .padding(.top,13)
                HStack{
                    Text("내가 작성한 글")
                        .multilineTextAlignment(.trailing)
                        .padding(.leading, 30)
                        .fontWeight(.bold)
                    Spacer()
                }
                CategorySelector(selectedCategory: $selectedCategory)
                PostListView(selectedCategory: selectedCategory)
            }
                        .sheet(isPresented: $isPresentingEventCreationView) {
                            EventCreationView()
                        }
                        .overlay(
                            Button(action: {
                                isPresentingEventCreationView = true
                            }) {
                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .padding()
                                    .background(Color.yellow)
                                    .foregroundColor(.black)
                                    .clipShape(Circle())
                                    .shadow(radius: 4)
                            }
                            .padding()
                            .position(x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 180),
                            alignment: .bottomTrailing
                        )
        }
    }
}

enum Category: String {
    case ongoing = "진행 중인 행사 보기"
    case upcoming = "예정 중인 행사 보기"
    case completed = "종료된 행사 보기"
}

struct UserInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("컴퓨터공학과,").fontWeight(.bold) + Text("안녕하세요!")
            }
                .font(.system(size: 20))
                .padding(.leading, 13)
                .padding(.top, 15)
                .padding(.bottom, 35)
            
            HStack {
                Text("유저 ID")
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .padding(.leading, 15)
                Text("2039850123AB3")
                    .font(.system(size: 13))
                Spacer()
                Button(action: {
                    // action for 비밀번호 변경하기
                }) {
                    Text("비밀번호 변경하기")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                        .padding(.trailing, 10)
                }
            }
            .font(.subheadline)
            .foregroundColor(.gray)
            
        }
        .padding()
    }
}

struct CategorySelector: View {
    @Binding var selectedCategory: Category
    
    var body: some View {
        HStack {
            CategoryButton(title: Category.ongoing.rawValue, isSelected: selectedCategory == .ongoing) {
                selectedCategory = .ongoing
            }
            Spacer()
            CategoryButton(title: Category.upcoming.rawValue, isSelected: selectedCategory == .upcoming) {
                selectedCategory = .upcoming
            }
            Spacer()
            CategoryButton(title: Category.completed.rawValue, isSelected: selectedCategory == .completed) {
                selectedCategory = .completed
            }
        }
        .frame(width: 330)
    }
}

struct CategoryButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.caption2)
                .fontWeight(isSelected ? .semibold : .regular)
                .foregroundStyle(isSelected ? Color.black : Color.gray)
                .padding(.horizontal, 10)
                .padding(.vertical, 7)
                .background(isSelected ? Color.yellow : Color.white.opacity(0.2))
                .cornerRadius(40)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(isSelected ? Color.clear : Color.mainColor)
                )
        }
    }
}

struct PostListView: View {
    var selectedCategory: Category
    
    var body: some View {
        List {
            ForEach(getPosts(for: selectedCategory)) { post in
                PostRow(post: post)
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(PlainListStyle())
    }
    
    func getPosts(for category: Category) -> [Post] {
        let ongoingPosts = [
            Post(id: 1, title: "컴퓨터공학과 2학기 종강총회", date: "12월 15일 오후 7시", type: "유형: 오프라인", organizer: "주최: 학과"),
            Post(id: 2, title: "컴퓨터공학과 2학기 종강총회", date: "12월 15일 오후 7시", type: "유형: 오프라인", organizer: "주최: 학과"),
            Post(id: 3, title: "컴퓨터공학과 2학기 종강총회", date: "12월 15일 오후 7시", type: "유형: 오프라인", organizer: "주최: 학과")
        ]
        let upcomingPosts = [
            Post(id: 4, title: "컴퓨터공학과 신입생 환영회", date: "1월 10일 오후 5시", type: "유형: 온라인", organizer: "주최: 학생회"),
            Post(id: 5, title: "컴퓨터공학과 동문과의 만남", date: "1월 20일 오후 2시", type: "유형: 오프라인", organizer: "주최: 학과"),
            Post(id: 6, title: "컴퓨터공학과 기술 세미나", date: "2월 5일 오후 3시", type: "유형: 온라인", organizer: "주최: 학과")
        ]
            
        let completedPosts = [
            Post(id: 7, title: "컴퓨터공학과 봄학기 개강총회", date: "3월 5일 오후 7시", type: "유형: 오프라인", organizer: "주최: 학과"),
            Post(id: 8, title: "컴퓨터공학과 여름캠프", date: "6월 20일 오전 10시", type: "유형: 오프라인", organizer: "주최: 학생회"),
            Post(id: 9, title: "컴퓨터공학과 가을축제", date: "10월 15일 오후 6시", type: "유형: 오프라인", organizer: "주최: 학과"),
            Post(id: 10, title: "컴퓨터공학과 기술 세미나", date: "2월 5일 오후 3시", type: "유형: 온라인", organizer: "주최: 학과")
        ]
        
        switch category {
        case .ongoing:
            return ongoingPosts
        case .upcoming:
            return upcomingPosts
        case .completed:
            return completedPosts
        }
        
    }
}

struct Post: Identifiable {
    let id: Int
    let title: String
    let date: String
    let type: String
    let organizer: String
}

struct PostRow: View {
    var post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(post.title)
                .font(.headline)
            Text(post.date)
                .font(.subheadline)
                .foregroundColor(.gray)
            HStack {
                Text(post.type)
                Text(post.organizer)
            }
            .font(.footnote)
            .foregroundColor(.gray)
            HStack {
                Spacer()
                Button(action: {}) {
                    Image(systemName: "trash.fill")
                        .foregroundColor(.blue)
                }
                Button(action: {}) {
                    Image(systemName: "pencil.and.outline")
                        .foregroundColor(.blue)
                }
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}


#Preview {
    Personal_StudentCouncil()
}
