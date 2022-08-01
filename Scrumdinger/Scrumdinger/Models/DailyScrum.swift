//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Kyle Morton on 7/23/22.
//

import Foundation

struct DailyScrum : Identifiable, Codable {
    var id: UUID;
    var title: String;
    var attendees: [Attendee];
    var lengthInMinutes: Int;
    var theme: Theme;
    var history: [History] = [];
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id;
        self.title = title;
        self.attendees = attendees.map { Attendee(name: $0) };
        self.lengthInMinutes = lengthInMinutes;
        self.theme = theme;
    }
}

extension DailyScrum {
    struct Attendee: Identifiable, Codable {
        let id: UUID;
        var name: String;
        
        init(id: UUID = UUID(), name: String) {
            self.id = id;
            self.name = name;
        }
    }
    
    struct Data {
        var title: String = "";
        var attendees: [Attendee] = [];
        var lengthInMinutes: Double = 5;
        var theme: Theme = .seafoam;
    }
    
    var data: Data {
        Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), theme: theme);
    }
    
    mutating func update(from data: Data) {
        title = data.title;
        attendees = data.attendees;
        lengthInMinutes = Int(data.lengthInMinutes);
        theme = data.theme;
    }
    
    init(data: Data) {
        id = UUID()
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        theme = data.theme
    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 1, theme: .yellow),
        DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 1, theme: .orange),
        DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 1, theme: .poppy)
    ];
}
