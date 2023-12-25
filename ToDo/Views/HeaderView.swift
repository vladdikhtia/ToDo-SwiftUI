//
//  HeaderView.swift
//  ToDo
//
//  Created by Влад Дихтярук on 11.12.2023.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subTitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(background)
                .rotationEffect(.degrees(angle))
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                    .bold()
                Text(subTitle)
                    .font(.system(size: 30))
                    .foregroundStyle(.white)
            }
            .padding(.top, 80)
        }
        .frame(
            width: UIScreen.main.bounds.width * 3,
            height: 350
        )
        .offset(y: -150)
    }
}

#Preview {
    HeaderView(title: "Example", subTitle: "sub example", angle: 15, background: .blue)
}
