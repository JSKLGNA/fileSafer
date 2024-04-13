//
//  file.swift
//  fileSafer
//
//  Created by JSKLJN on 13.04.2024.
//

import SwiftUI

// Структура для представления документа
struct DocumentView: View {
    var document: Document
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(document.title)
                .font(.title)
            Text(document.content)
                .font(.body)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

// Структура для представления списка документов
struct DocumentListView: View {
    @StateObject var documentManager = DocumentManager()
    @State private var title = ""
    @State private var content = ""
    
    var body: some View {
            VStack {
                // Форма для добавления нового документа
                VStack {
                    TextField("Title", text: $title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    TextField("Content", text: $content)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button("Add Document") {
                        documentManager.addDocument(title: title, content: content)
                        title = ""
                        content = ""
                    }
                    .padding()
                }
                
                // Список добавленных документов
                List(documentManager.documents, id: \.title) { document in
                    DocumentView(document: document)
                }
            }
            .padding()
        }
    }

// Структура для представления приложения
//@main
//struct DocumentApp: App {
//    var body: some Scene {
//        WindowGroup {
//            DocumentListView()
//        }
//    }
//}

// Класс для хранения документов
class Document {
    var title: String
    var content: String
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
}

// Класс для управления документами
class DocumentManager: ObservableObject {
    @Published var documents: [Document] = []
    
    // Добавление документа
    func addDocument(title: String, content: String) {
        let newDocument = Document(title: title, content: content)
        documents.append(newDocument)
    }
}

struct View_Preview: PreviewProvider{
    static var previews: some View {
        DocumentListView()
    }
}
