//
//  EventCreationView.swift
//  BuBeeFinal
//
//  Created by 최주현 on 5/28/24.
//

import SwiftUI
import PhotosUI
import MobileCoreServices

struct EventCreationView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var title: String = ""
    @State private var eventPeriod: Date = Date()
    @State private var recruitmentPeriod: Date = Date()
    @State private var eventDescription: String = ""
    @State private var eventFiles: [URL] = []
    @State private var eventApplicationURL: String = ""
    @State private var selectedTags: [String] = []
    @State private var availableTags1: [String] = ["#only 신입생", "#only 재학생", "#신입생 환영", "#복전생 환영", "#외국인 유학생", "#only 학과생"]
    @State private var availableTags2: [String] = ["#개강총회", "#종강총회", "#학술대회", "#학과행사", "#간식행사"]
    @State private var availableTags3: [String] = ["#유쾌한", "#진지한", "#열정적인", "#활기찬", "#친근한", "#친목", "#소통하는"]
    @State private var showingFilePicker = false
    @State private var showingShareSheet = false
    @State private var savedFileURL: URL?
    @State private var showingEventDatePicker = false
    @State private var showingRecruitmentDatePicker = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    VStack (alignment:.leading, spacing: -6){
                        Text("게시글 제목")
                            .font(.headline)
                            .fontWeight(.bold)
                        TextField("게시글 제목", text: $title)
                            .padding(.vertical, 10)
                            .background(.filterBg)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding(.top)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("행사 기간")
                            .font(.headline)
                            .fontWeight(.bold)
                        Button(action: {
                            showingEventDatePicker = true
                        }) {
                            HStack {
                                Text("\(eventPeriod, formatter: dateFormatter)")
                                Spacer()
                                Image(systemName: "calendar")
                            }
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        }
                        
                        Text("모집 기간")
                            .font(.headline)
                            .fontWeight(.bold)
                        Button(action: {
                            showingRecruitmentDatePicker = true
                        }) {
                            HStack {
                                Text("\(recruitmentPeriod, formatter: dateFormatter)")
                                Spacer()
                                Image(systemName: "calendar")
                            }
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        }
                    }
                    VStack (alignment:.leading, spacing: 10){
                        Text("행사 내용")
                            .font(.headline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        TextField("행사 내용", text: $eventDescription)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    VStack(alignment: .leading) {
                        HStack{
                            Text("행사 이미지 첨부")
                                .font(.headline)
                                .fontWeight(.bold)
                            Text("(최대 4개)")
                                .font(.system(size:12))
                                .foregroundStyle(.gray)
                        }
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(eventFiles, id: \.self) { file in
                                    Text(file.lastPathComponent)
                                        .padding()
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(10)
                                }
                            }
                        }
                        if eventFiles.count < 4 {
                            Button(action: {
                                showingFilePicker = true
                            }) {
                                Text("파일 선택")
                                    .font(.subheadline)
                                    .padding(3)
                                    .background(.filterBg)
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    VStack(alignment: .leading){
                        Text("행사 신청 URL")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        Text("학생들이 해당 링크를 통해 행사에 참여 신청합니다!")
                            .font(.caption)
                    }
                    TextField("행사 신청 URL", text: $eventApplicationURL)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("해시태그")
                        .padding(.bottom,5)
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("참여 가능한 대상을 태그해주세요 (최대 2개)")
                        .padding(.bottom,5)
                        .font(.subheadline)
                        .fontWeight(.bold)
                    WrapTagsView(availableTags: availableTags1, selectedTags: $selectedTags)
                    Text("행사의 종류를 태그해주세요 (최대 1개)")
                        .padding(.bottom,5)
                        .font(.subheadline)
                        .fontWeight(.bold)
                    WrapTagsView(availableTags: availableTags2, selectedTags: $selectedTags)
                    Text("행사의 분위기를 태그해주세요 (최대 2개)")
                        .padding(.bottom,5)
                        .font(.subheadline)
                        .fontWeight(.bold)
                    WrapTagsView(availableTags: availableTags3, selectedTags: $selectedTags)
                    
                    
                    
                    HStack {
                        Button(action: {
                            saveDraft()
                        }) {
                            Text("임시저장")
                                .padding()
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            savePost()
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("게시하기")
                                .padding()
                                .background(Color.yellow)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.bottom)
                }
                .padding()
            }
            .navigationBarTitle("행사 작성", displayMode: .inline)
            .sheet(isPresented: $showingFilePicker) {
                DocumentPicker(fileURLs: $eventFiles, maxSelection: 4)
            }
            .sheet(isPresented: $showingShareSheet, content: {
                if let url = savedFileURL {
                    ShareSheet(activityItems: [url])
                }
            })
            .sheet(isPresented: $showingEventDatePicker) {
                DatePickerView(selectedDate: $eventPeriod, isPresented: $showingEventDatePicker)
            }
            .sheet(isPresented: $showingRecruitmentDatePicker) {
                DatePickerView(selectedDate: $recruitmentPeriod, isPresented: $showingRecruitmentDatePicker)
            }
        }
    }
    
    func saveDraft() {
        let draft = Event(title: title, eventPeriod: eventPeriod, recruitmentPeriod: recruitmentPeriod, eventDescription: eventDescription, eventFiles: eventFiles, eventApplicationURL: eventApplicationURL, selectedTags: selectedTags)
        appendToFile(event: draft, filename: "draft.json")
    }
    
    func savePost() {
        let post = Event(title: title, eventPeriod: eventPeriod, recruitmentPeriod: recruitmentPeriod, eventDescription: eventDescription, eventFiles: eventFiles, eventApplicationURL: eventApplicationURL, selectedTags: selectedTags)
        appendToFile(event: post, filename: "post.json")
    }
    
    func appendToFile(event: Event, filename: String) {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        // Get the current list of events
        var events = [Event]()
        if let url = getDocumentsDirectory()?.appendingPathComponent(filename),
           let data = try? Data(contentsOf: url),
           let decodedEvents = try? JSONDecoder().decode([Event].self, from: data) {
            events = decodedEvents
        }
        
        // Append the new event
        events.append(event)
        
        // Save the updated list
        if let data = try? encoder.encode(events),
           let url = getDocumentsDirectory()?.appendingPathComponent(filename) {
            do {
                try data.write(to: url)
                print("Saved to \(url)")
            } catch {
                print("Failed to write JSON data: \(error.localizedDescription)")
            }
        }
    }
    
    func getDocumentsDirectory() -> URL? {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths.first
    }
}

struct DatePickerView: View {
    @Binding var selectedDate: Date
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            
            Button("Done") {
                isPresented = false
            }
            .padding()
        }
    }
}

struct WrapTagsView: View {
    let availableTags: [String]
    @Binding var selectedTags: [String]
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: 3) {
            ForEach(availableTags, id: \.self) { tag in
                Button(action: {
                    toggleTagSelection(tag: tag)
                }) {
                    Text(tag)
                        .font(.footnote)
                        .padding(7)
                        .background(selectedTags.contains(tag) ? Color.keyWordBg : Color.clear)
                        .foregroundColor(.black)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(selectedTags.contains(tag) ? Color.clear : Color.keyWordBg, lineWidth: 2)
                        )
                }
                .padding(4)
            }
        }
    }
    
    func toggleTagSelection(tag: String) {
        if selectedTags.contains(tag) {
            selectedTags.removeAll { $0 == tag }
        } else {
            selectedTags.append(tag)
        }
    }
}

struct Event: Identifiable, Codable {
    let id = UUID()
    let title: String
    let eventPeriod: Date
    let recruitmentPeriod: Date
    let eventDescription: String
    let eventFileURLs: [URL]
    let eventApplicationURL: String
    let selectedTags: [String]
    
    init(title: String, eventPeriod: Date, recruitmentPeriod: Date, eventDescription: String, eventFiles: [URL], eventApplicationURL: String, selectedTags: [String]) {
        self.title = title
        self.eventPeriod = eventPeriod
        self.recruitmentPeriod = recruitmentPeriod
        self.eventDescription = eventDescription
        self.eventFileURLs = eventFiles
        self.eventApplicationURL = eventApplicationURL
        self.selectedTags = selectedTags
    }
}

struct DocumentPicker: UIViewControllerRepresentable {
    @Binding var fileURLs: [URL]
    var maxSelection: Int
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.item], asCopy: true)
        picker.delegate = context.coordinator
        picker.allowsMultipleSelection = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}
    
    class Coordinator: NSObject, UIDocumentPickerDelegate {
        var parent: DocumentPicker
        
        init(_ parent: DocumentPicker) {
            self.parent = parent
        }
        
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            parent.fileURLs.append(contentsOf: urls.prefix(parent.maxSelection - parent.fileURLs.count))
        }
        
        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {}
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

extension DateFormatter {
    static let shortDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
}()


#Preview{
    EventCreationView()
}
