//
//  ToDoListViewViewModel.swift
//  ToDo
//
//  Created by Влад Дихтярук on 11.12.2023.
//

import Foundation
import FirebaseFirestore

class ToDoListViewViewModel: ObservableObject {
    @Published var isShowingNewItem = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete to do list item
    /// - Parameter id: item id to delete
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
