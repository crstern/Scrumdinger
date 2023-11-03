//
//  ThemePickerView.swift
//  Scrumdigner
//
//  Created by Cristian Stern on 25.10.2023.
//

import SwiftUI

struct ThemePickerView: View {
    @Binding var selection: Theme
    var body: some View {
        Picker("Theme", selection: $selection){
            ForEach(Theme.allCases){ theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }.pickerStyle(.navigationLink)
    }
}

#Preview {
    ThemePickerView(selection: .constant(.purple))
}
