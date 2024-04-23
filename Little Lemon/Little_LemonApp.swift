//
//  Little_LemonApp.swift
//  Little Lemon
//
//  Created by Jonathan Cabral on 3/21/24.
//

import SwiftUI

@main
struct Little_LemonApp: App{
    
    @Environment(\.managedObjectContext) private var viewContext
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Onboarding()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}




