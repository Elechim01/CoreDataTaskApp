//
//  DateButton.swift
//  TaskApp
//
//  Created by Michele on 13/01/21.
//

import SwiftUI

struct DateButton: View {
    var title : String
    @ObservedObject var homeData : HomeViewModel
    var body: some View {
        Button(action: {
            homeData.updateDate(value: title)
        }, label: {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(homeData.CheckDate() == title ? .white : .gray)
                .padding(.vertical,10)
                .padding(.horizontal,20)
                .background(
                    homeData.CheckDate() == title ?
                    LinearGradient(gradient: .init(colors: [Color.red,Color.orange]), startPoint: .leading, endPoint: .trailing):
                        LinearGradient(gradient: .init(colors: [Color.white]), startPoint: .leading, endPoint: .trailing )
                )
                .cornerRadius(6)
        })
    }
}

struct DateButton_Previews: PreviewProvider {
    static var previews: some View {
        DateButton(title: "hola",homeData: HomeViewModel())
    }
}
