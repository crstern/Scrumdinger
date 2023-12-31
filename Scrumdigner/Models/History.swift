//
//  History.swift
//  Scrumdigner
//
//  Created by Cristian Stern on 02.11.2023.
//

import Foundation

struct History: Identifiable, Codable{
    let id: UUID
    let date: Date
    let attendees: [DailyScrum.Attendee]
    
    init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendee]) {
        self.id = id
        self.date = date
        self.attendees = attendees
    }
}
