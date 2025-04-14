//
//  ToDoForm.swift
//  ToDo
//
//  Created by Ayush Bharsakle on 10/04/25.
//

import SwiftUI
import BottomSheet

struct ToDoForm: View {
    @ObservedObject var taskListState : StateManager;
    @Binding var bottomSheetPosition: BottomSheetPosition;
    @State private var id: Int = 0
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var isImportant: Bool = false
    @FocusState private var isFocused: Bool
    
    func writeData(){
        let dataGateway = DataGateway(taskState:taskListState);
        id = taskListState.taskList.count + 1;
        
        let tag = isImportant == true ? Importance.important : Importance.unimportant;
        let newTask = Task(id: id, title: title, description: description, tag: tag  )
        var oldArray = taskListState.taskList
        oldArray.append(newTask)
        taskListState.taskList = oldArray
        
    
        dataGateway.writeData(oldArray)
        
        bottomSheetPosition = .hidden;
        isFocused = false;
    }
    
    
    var body: some View {
        
        VStack {
            TextField("Task title", text: $title ).textFieldStyle(.roundedBorder).padding(.horizontal).font(.title2)
            TextField("Task description", text: $description, axis: Axis.vertical).focused($isFocused).textFieldStyle(.roundedBorder).padding(.horizontal).font(.title2)
            Toggle(isOn: $isImportant) {
                Text("Is Important")
            }.padding(.horizontal)
            Button(action :writeData){
                Text("Write").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ )
            }.padding().buttonStyle(.borderedProminent)
        }.padding(5).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
}
