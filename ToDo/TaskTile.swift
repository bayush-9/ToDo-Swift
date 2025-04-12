//
//  TaskTile.swift
//  ToDo
//
//  Created by Ayush Bharsakle on 20/03/25.
//

import SwiftUI

let colorCombinations = [
    [Color(red: 0.051, green: 0.196, blue: 0.302), Color(red: 0.498, green: 0.353, blue: 0.514)],
    [Color(red: 0.137, green: 0.2, blue: 0.1608), Color(red: 0.3882, green: 0.8314, blue: 0.4431)],
    [Color(red: 0.6549, green: 0.1137, blue: 0.1922), Color(red: 0.247, green: 0.051, blue: 0.0706)],
    [Color(red: 0.1569, green: 0.1922, blue: 0.2314), Color(red: 0.2824, green: 0.3294, blue: 0.3804)],
    [Color(red: 0.1647, green: 0.3294, blue: 0.4392), Color(red: 0.298, green: 0.2549, blue: 0.4667)],
    [Color(red: 0.1176, green: 0.2314, blue: 0.4392), Color(red: 0.1608, green: 0.3255, blue: 0.6078)],
    [Color(red: 0.0, green: 0.0, blue: 0.0), Color(red: 0.5725, green: 0.2353, blue: 0.7098)],
    [Color(red: 0.1725, green: 0.2431, blue: 0.3137), Color(red: 0.0, green: 0.0, blue: 0.0)],
    [Color(red: 0.0, green: 0.0, blue: 0.0), Color(red: 0.647, green: 0.3608, blue: 0.1059)],
    [Color(red: 0.0, green: 0.0, blue: 0.0), Color(red: 0.9098, green: 0.2627, blue: 0.5765)],
    [Color(red: 0.5843, green: 0.5569, blue: 0.4118), Color(red: 0.0, green: 0.0, blue: 0.0)],
    [Color(red: 0.0, green: 0.0, blue: 0.0), Color(red: 0.0745, green: 0.0588, blue: 0.251)]
]



func backgroundGradient() -> LinearGradient {
    let colorIndex : Int = Int.random(in: 0..<12);
    let gradient = LinearGradient(
        colors: colorCombinations[colorIndex],
        startPoint: .topLeading, endPoint: .bottomTrailing);
    return gradient;
}

func deleteTodo(){
    
}

struct TaskTile: View {
    let task : Task;
    
    var body: some View {
        HStack {
            VStack {
                VStack(alignment: .leading){
                    Text(task.title).font(.system(size: 80, weight: .light, design: .rounded))
                    
                    Spacer().frame(maxHeight: 30)
                    Text(task.description)
                    task.tag == .important ? Text("Important") : Text("Not Important")
                }.frame(maxWidth: .infinity, alignment: .leading).padding(20)
               
                
            }
        }
        .background(backgroundGradient()).cornerRadius(40.0)
    }
    
}
