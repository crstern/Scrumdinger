//
//  ScrumStore.swift
//  Scrumdigner
//
//  Created by Cristian Stern on 02.11.2023.
//

import Foundation
import SwiftUI

@MainActor
class ScrumStore: ObservableObject{
    @Published var scrums: [DailyScrum] = []
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathExtension("scrums.data")
    }
    
    func load() async throws{
        let task = Task<[DailyScrum], Error> {
            let url = try Self.fileURL()
            guard let data = try? Data(contentsOf: url) else {return [] }
            let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: data)
            return dailyScrums
        }
        let scrums = try await task.value
        self.scrums = scrums
    }
    
    func save(scrums: [DailyScrum]) async throws{
        let task = Task{
            let url = try Self.fileURL()
            let encodedData = try JSONEncoder().encode(self.scrums)
            try encodedData.write(to: url)
        }
        _ = try await task.value
    }
}
