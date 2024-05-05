//
//  TodoListApp.swift
//  TodoList
//
//  Created by Meezu Lawot on 22/08/2023.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                
                ListView()
                
            }.environmentObject(listViewModel)
        }
    }
}
