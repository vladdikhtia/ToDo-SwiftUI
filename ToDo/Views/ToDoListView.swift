//
//  ToDoListItemsView.swift
//  ToDo
//
//  Created by Влад Дихтярук on 11.12.2023.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        // users/<id>/todos/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete"){
                                // Delete
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
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
    ToDoListView(userId: "vMQ2XhSFefXdMYieFalQRTlvZwX2")
}
