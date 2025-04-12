//
//  ToDoApp.swift
//  ToDo
//
//  Created by Ayush Bharsakle on 17/03/25.
//

import SwiftUI

@main
struct ToDoApp: App {
    //Initiate Global State and pass it down for read and write
    @ObservedObject var taskState = StateManager();
    
    //Runs on app startup (works like component onMount)
    init() {
        _ =  DataGateway(taskState: self.taskState);
    }
    
    //Main Body
    var body: some Scene {
        WindowGroup {
            ContentView(taskListState: taskState)
        }
    }
}
