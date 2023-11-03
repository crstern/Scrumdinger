//
//  MeetingHeaderView.swift
//  Scrumdigner
//
//  Created by Cristian Stern on 30.10.2023.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    let theme: Theme
    
    private var totalSeconds: Int{
        return secondsElapsed + secondsRemaining
    }
    private var progressValue: Double {
        guard totalSeconds > 0 else { return 1 }
        
        if totalSeconds < 0 { return 1 }
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    private var minutesRemaining: Int{
        return secondsRemaining / 60
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progressValue)
                .progressViewStyle(ScrumProgressViewStyle(theme:theme))
            
            HStack{
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed").font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining").font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.bottomhalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
        }
        .accessibilityElement(children: /*@START_MENU_TOKEN@*/.ignore/*@END_MENU_TOKEN@*/)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
        .padding([.top, .horizontal])
    }
}

#Preview {
    MeetingHeaderView(secondsElapsed: 300, secondsRemaining: 600, theme: .bubblegum)
        .previewLayout(.sizeThatFits)
}
