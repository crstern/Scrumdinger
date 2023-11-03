//
//  ThemeView.swift
//  Scrumdigner
//
//  Created by Cristian Stern on 25.10.2023.
//

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    var body: some View {
        Text(theme.rawValue)
            .padding(4)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .foregroundColor(theme.accentColor)
            .background(theme.mainColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    ThemeView(theme: .purple)
}
