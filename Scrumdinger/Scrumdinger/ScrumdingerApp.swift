//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Kyle Morton on 7/19/22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore();
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $store.scrums) {
                    /// when scene becomes inactive, save scrums to local file
                    ScrumStore.save(scrums: store.scrums) { result in
                        if case .failure(let error) = result {
                            fatalError(error.localizedDescription);
                        }
                    }
                }
            }
            .onAppear {
                /// whenever the initial view loads up, pull in scrums from local file
                ScrumStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription);
                    case .success(let scrums):
                        store.scrums = scrums;
                    }
                }
            }
        }
    }
}
