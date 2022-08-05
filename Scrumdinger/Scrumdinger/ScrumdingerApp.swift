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
    @State private var errorWrapper: ErrorWrapper?;
    
    enum TestError: Error {
        case errorRequired
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $store.scrums) {
                    
                    Task {
                        do {
                            try await ScrumStore.save(scrums: store.scrums);
                        }
                        catch {
                            errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.");
                        }
                    }
                }
            }
            .task {
                do {
//                    throw TestError.errorRequired;
                    store.scrums = try await ScrumStore.load();
                }
                catch {
                    errorWrapper = ErrorWrapper(error: error, guidance: "Scrumdinger will load sample data and continue.");

                }
            }
            .sheet(item: $errorWrapper, onDismiss: {
                store.scrums = DailyScrum.sampleData;
            }) { wrapper in
                ErrorView(errorWrapper: wrapper)
            };
        }
    }
}
