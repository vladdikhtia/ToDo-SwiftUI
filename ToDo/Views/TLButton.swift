//
//  TLButton.swift
//  ToDo
//
//  Created by Vladyslav Dikhtiaruk on 22/12/2023.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            // Action
            action()
        }, label: {
            ZStack{
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(background)
                Text(title)
                    .foregroundStyle(.white)
                    .bold()
            }
        })
        
    }
}

#Preview {
    TLButton(title: "Button", background: .green){
        //Action
    }
}
