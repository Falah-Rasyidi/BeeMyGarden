//
//  BeeMyGardenApp.swift
//  BeeMyGarden
//
//  Created by Falah Rasyidi on 13/7/2025.
//

import SwiftUI

@main
struct BeeMyGardenApp: App {

    @State private var appModel = AppModel()
    @State private var appState = AppState()
    @State private var modelLoader = ModelLoader()

    var body: some Scene {
        WindowGroup {
            ContentView(
                appState: appState,
                plants: plantChoices
            )
                .environment(appModel)
                .task {
                    await modelLoader.loadObjects()
                    appState.setPlaceableObjects(modelLoader.placeableObjects)
                }
        }

        ImmersiveSpace(id: appModel.immersiveSpaceID) {
            ImmersiveView()
                .environment(appModel)
                .onAppear {
                    appModel.immersiveSpaceState = .open
                }
                .onDisappear {
                    appModel.immersiveSpaceState = .closed
                }
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
     }
}
