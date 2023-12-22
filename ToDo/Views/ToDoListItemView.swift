//
//  ToDoListItemView.swift
//  ToDo
//
//  Created by Влад Дихтярук on 11.12.2023.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    var item: ToDoListItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(uiColor: .secondaryLabel))
            }
    
            Spacer()
            
            Button(action: {
                viewModel.toggleIsDone(item: item)
            }, label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            })
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(id: "123", title: "Buy food", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
