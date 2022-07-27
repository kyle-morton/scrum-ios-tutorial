//
//  DetailVIew.swift
//  Scrumdinger
//
//  Created by Kyle Morton on 7/26/22.
//

import SwiftUI

struct DetailVIew: View {
    let scrum: DailyScrum;
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                Label("Start meeting", systemImage: "timer")
                    .font(.headline)
                    .foregroundColor(.accentColor);
                HStack {
                    Label("Length", systemImage: "clock");
                    Spacer();
                    Text("\(scrum.lengthInMinutes) minutes");
                }
                .accessibilityElement(children: .combine);
                HStack {
                    Label("Theme", systemImage: "paintpalette");
                    Spacer();
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4);
                }
                .accessibilityElement(children: .combine);
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person");
                }
            }
        };
    }
}

struct DetailVIew_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailVIew(scrum: DailyScrum.sampleData[0]);
        }
    }
}
