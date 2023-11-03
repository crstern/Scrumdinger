//
//  MeetingFooterView.swift
//  Scrumdigner
//
//  Created by Cristian Stern on 01.11.2023.
//

import SwiftUI

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    var skipAction: () -> Void
    private var speakerNumber: Int?{
        guard let index = speakers.firstIndex(where: {$0.isCompleted}) else { return nil }
        return index + 1
    }
    private var isLastSpeakerTalking: Bool{
        return speakers.dropLast().allSatisfy {$0.isCompleted}
    }
    private var speakerInfo: String{
        guard let speakerNumber = speakerNumber else { return "No more speakers"}
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    
    var body: some View {
        VStack {
            HStack {
                if isLastSpeakerTalking{
                    Text("Last speaker")
                }else{
                    Text(speakerInfo)
                    
                    Spacer()
                    Button(action: skipAction, label: {
                        Image(systemName: "forward.fill")
                    }).accessibilityLabel("Next speaker")
                }
            }
        }.padding([.bottom, .horizontal])
    }
}

#Preview {
    MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
        .previewLayout(.sizeThatFits)
}
