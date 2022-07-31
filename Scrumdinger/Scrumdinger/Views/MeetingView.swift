//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Kyle Morton on 7/19/22.
//

import SwiftUI

struct MeetingView: View {
    @Binding var scrum: DailyScrum;
    @StateObject var scrumTimer = ScrumTimer();
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor);
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
                Circle()
                    .strokeBorder(lineWidth: 24)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker);
            }
        }
        .foregroundColor(scrum.theme.accentColor)
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            /// reset the timer as soon as the view appears, then start it up
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees);
            scrumTimer.startScrum();
        }
        .onDisappear {
            scrumTimer.stopScrum();
        };
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.sampleData[0]));
    }
}
