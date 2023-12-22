//
//  ToDoListItemsView.swift
//  ToDo
//
//  Created by Влад Дихтярук on 11.12.2023.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button(action: {
                    viewModel.isShowingNewItem.toggle()
                }, label: {
                    Image(systemName: "plus")
                })
            }
            .sheet(isPresented: $viewModel.isShowingNewItem, content: {
                NewItemView( newItemPresented: $viewModel.isShowingNewItem)
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "")
}
