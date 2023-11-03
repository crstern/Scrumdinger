//
//  ScrumView.swift
//  Scrumdigner
//
//  Created by Cristian Stern on 20.10.2023.
//

import SwiftUI

struct ScrumView: View {
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrumView = false
    let saveAction: ()->Void
    
    var body: some View {
        NavigationStack{
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)){
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily scrums")
            .toolbar {
                Button(action: {
                    isPresentingNewScrumView = true
                }){
                    Image(systemName: "plus")
                }
            }
            .accessibilityLabel("New scrum")
        }
        .sheet(isPresented: $isPresentingNewScrumView){
            NewScrumSheet(isPresentingNewSrumView: $isPresentingNewScrumView, scrums: $scrums)
        }
        .onChange(of: scenePhase) {
            if scenePhase == .inactive {self.saveAction()}
        }
    }
}

#Preview {
    ScrumView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
}
