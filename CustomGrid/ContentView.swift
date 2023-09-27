//
//  ContentView.swift
//  CustomGrid
//
//  Created by Anand Upadhyay on 20/09/23.
//

import SwiftUI
import SwiftUI
import Combine

struct CustomGridData: Identifiable {
    let id = UUID()
    let title: String
    let list: [Any]
}

public extension Color {

    static func random(randomOpacity: Bool = false) -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            opacity: randomOpacity ? .random(in: 0...1) : 1
        )
    }
}

final class SomeData: ObservableObject {
    @Published var data: [CustomGridData] = [CustomGridData(title: "R. Martin",list: ["One","Two"]), CustomGridData(title: "McConell",list: ["A",["B","C"]]), CustomGridData(title: "London",list: ["Three","Four"]), CustomGridData(title: "London",list: ["D",["E","F"]])]
}

struct MyGridView: View{
    var body: some View {
        HStack{
            
        }.foregroundColor(.random())
//        Button("G"){
//
//        }.buttonStyle(.borderedProminent)
//            .controlSize(.large)
    }
}

struct CustomGridView: View {

    @EnvironmentObject var someData: SomeData
    @State private var searchedText = "One"
    private var filteredData: [CustomGridData] {
        return searchedText == "" ? someData.data : someData.data.filter { $0.title.contains(searchedText) }
    }

    
    var body: some View {

        List() {
            Section{
                
                ForEach(filteredData.indices, id: \.self) { rowIndex in
                    if(rowIndex%2==0){
                        HStack {
                            MyGridView()
//                            Text(self.filteredData[rowIndex].title)
//                            Spacer()
                            MyGridView()
                        }
                    }else{
                        HStack {
                            Text(self.filteredData[rowIndex].title)
                            Spacer()
                        }
                    }
                    
//                    .background(rowIndex % 2 == 1 ? Color.yellow : Color.clear)
                }
            } header: {
                Text("Grid View")
            }
        }.padding(10)
        
    }
}

struct HighlitedRowsInList_Previews: PreviewProvider {
    static var previews: some View {
        CustomGridView()
            .environmentObject(SomeData())
    }
}


//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
