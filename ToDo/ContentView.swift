//
//  ContentView.swift
//  ToDo
//
//  Created by Ayush Bharsakle on 17/03/25.
//

import SwiftUI
import BottomSheet

struct ContentView: View {
    
    @ObservedObject var taskListState : StateManager;
    @State var bottomSheetPosition: BottomSheetPosition = .hidden //1
    @State var isPresented: Bool = false
    
    // Open Form
    func showBottomSheet(){
        bottomSheetPosition = .dynamic;
    }
    
    func deleteItem(itemId : Int){
        // Need a dataGateway instance
        let dataGateway = DataGateway(taskState:taskListState);
        taskListState.taskList.removeAll(){
            task in  task.id == itemId
        }
        let oldArray = taskListState.taskList
        
        // Write option
        dataGateway.writeData(oldArray)
    }
    
    
    var body: some View {
        //        Zstack for the floating action button
        ZStack(alignment: .bottomTrailing){
            List{
                ForEach(taskListState.taskList){
                    todo in TaskTile(task: todo).swipeActions(edge: .leading) {
                        Button(action: {deleteItem(itemId: todo.id)}) {
                            Label("Mark Complete", systemImage: "checkmark")
                        }
                        
                    }
                    .listRowSeparator(.hidden)
                }
            }.listStyle(.plain).frame(maxWidth: .infinity)
            
            Button(action :showBottomSheet,
                   label: {
                Image(systemName: "plus").font(.title.weight(.semibold))
                    .padding()
                    .background(backgroundGradient())
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            ).padding()
        }.bottomSheet(
            bottomSheetPosition: $bottomSheetPosition,
            switchablePositions: [ .dynamicBottom,
                                   .absolute(325)],
            title: "Add your task"
        ){
            ToDoForm(taskListState: taskListState,bottomSheetPosition: $bottomSheetPosition)
        }
        .enableContentDrag()
        .showCloseButton()
        .enableSwipeToDismiss()
        .enableTapToDismiss()
    }
    
}
