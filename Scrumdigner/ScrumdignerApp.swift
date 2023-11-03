//
//  ScrumdignerApp.swift
//  Scrumdigner
//
//  Created by Cristian Stern on 18.10.2023.
//

import SwiftUI

@main
struct ScrumdignerApp: App {
    @StateObject private var store = ScrumStore()
    
    var body: some Scene {
        WindowGroup {
            ScrumView(scrums: $store.scrums){
                Task {
                    do{
                        try await store.save(scrums: store.scrums)
                    }catch{
                        fatalError(error.localizedDescription)
                    }
                }
            }
                .task{
                    do{
                        try await store.load()
                    }catch{
                        fatalError(error.localizedDescription)
                    }
                }
        }
    }
}
