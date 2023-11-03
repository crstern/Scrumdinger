//
//  NewScrumSheet.swift
//  Scrumdigner
//
//  Created by Cristian Stern on 02.11.2023.
//

import SwiftUI

struct NewScrumSheet: View {
    @Binding var isPresentingNewSrumView: Bool
    @Binding var scrums: [DailyScrum]
    @State private var newScrum = DailyScrum.emptyScrum
    
    
    var body: some View {
        NavigationStack{
            DetailEditView(scrum: $newScrum)
                .toolbar{
                    ToolbarItem(placement: .cancellationAction){
                        Button("Dismiss") {
                            isPresentingNewSrumView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction){
                        Button("Add") {
                            isPresentingNewSrumView = false
                            scrums.append(newScrum)
                        }
                    }
                }
        }
    }
}

#Preview {
    NewScrumSheet(isPresentingNewSrumView: .constant(true),scrums: .constant(DailyScrum.sampleData))
}
