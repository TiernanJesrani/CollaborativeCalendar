@_private(sourceFile: "ContentView.swift") import FrontEnd
import SwiftUI
import SwiftUI

extension ContentView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/tiernanjesrani/Desktop/CalendarProject/FrontEnd/FrontEnd/ContentView.swift", line: 66)
        __designTimeSelection(Group {
            __designTimeSelection(ContentView(), "#2888.[4].[0].property.[0].[0].arg[0].value.[0]")
            __designTimeSelection(ContentView(), "#2888.[4].[0].property.[0].[0].arg[0].value.[1]")
        }, "#2888.[4].[0].property.[0].[0]")
    #sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/tiernanjesrani/Desktop/CalendarProject/FrontEnd/FrontEnd/ContentView.swift", line: 47)
        __designTimeSelection(NavigationView {
            __designTimeSelection(List {
                __designTimeSelection(ForEach(__designTimeSelection(viewModel.jsonTest, "#2888.[3].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value"), id: \.self) { i in
                    __designTimeSelection(HStack{
                        __designTimeSelection(Text(__designTimeSelection(i.name, "#2888.[3].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[0].arg[0].value")), "#2888.[3].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[0]")
                        __designTimeSelection(Text(__designTimeSelection(i.test, "#2888.[3].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[1].arg[0].value")), "#2888.[3].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.[1]")
                    }, "#2888.[3].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[2].value.[0]")
                    
                }, "#2888.[3].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[0]")
            }
            .onAppear {
                __designTimeSelection(viewModel.fetch(), "#2888.[3].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[0]")
            }, "#2888.[3].[1].property.[0].[0].arg[0].value.[0]")
        }, "#2888.[3].[1].property.[0].[0]")
    #sourceLocation()
    }
}

extension ViewModel {
    @_dynamicReplacement(for: fetch()) private func __preview__fetch() {
        #sourceLocation(file: "/Users/tiernanjesrani/Desktop/CalendarProject/FrontEnd/FrontEnd/ContentView.swift", line: 19)
        guard let url = URL(string: "http://127.0.0.1:5000") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: __designTimeSelection(url, "#2888.[2].[1].[1].value.modifier[0].arg[0].value")) { [weak self] data,
            _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let jsonTest = try JSONDecoder().decode([Testing].self, from: data)
                DispatchQueue.main.async {
                    self?.jsonTest = jsonTest
                }
            }
            catch {
                print(error)
            }
        }
        
        __designTimeSelection(task.resume(), "#2888.[2].[1].[2]")
    #sourceLocation()
    }
}

import struct FrontEnd.Testing
import class FrontEnd.ViewModel
import struct FrontEnd.ContentView
import struct FrontEnd.ContentView_Previews