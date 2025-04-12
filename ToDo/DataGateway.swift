//
//  DataGateway.swift
//  ToDo
//
//  Created by Ayush Bharsakle on 17/03/25.
//

import Foundation


class DataGateway{
    var classState :StateManager;
    
    init(taskState : StateManager){
        print("Init")
        self.classState = taskState;
        readData();
    }
    
    func writeData(_ totals: [Task]) -> Void {
        do {
            let fileURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("pastData.json")
            
            try JSONEncoder()
                .encode(totals)
                .write(to: fileURL)
        } catch {
            print("error writing data")
        }
    }
    
    
    func readData() -> Void {
        do {
            print("Reading Data")
            let fileURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("pastData.json")
            
            let data = try Data(contentsOf: fileURL)
            let pastData = try JSONDecoder().decode([Task].self, from: data)
            print(pastData)
            classState.taskList = pastData
        } catch {
            print("error reading data")
        }
    }
}


