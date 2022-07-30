//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Kyle Morton on 7/19/22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData;
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums);
            }
        }
    }
}
