//
//  DetailVIew.swift
//  Scrumdinger
//
//  Created by Kyle Morton on 7/26/22.
//

import SwiftUI

struct DetailVIew: View {
    @State private var isPresentingEditView = false;
    let scrum: DailyScrum;
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView()) {
                    Label("Start meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor);
                }
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
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true;
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView()
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false;
                            }
                        };
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false;
                            }
                        }
                    };
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
