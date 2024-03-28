@_private(sourceFile: "ContentView.swift") import FrontEnd
import SwiftUI
import SwiftUI

extension ContentView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/tiernanjesrani/Desktop/CalendarProject/FrontEnd/FrontEnd/ContentView.swift", line: 66)
        Group {
            ContentView()
            ContentView()
        }
    #sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/tiernanjesrani/Desktop/CalendarProject/FrontEnd/FrontEnd/ContentView.swift", line: 47)
        NavigationView {
            List {
                ForEach(viewModel.jsonTest, id: \.self) { i in
                    HStack{
                        Text(i.name)
                        Text(i.test)
                    }
                    
                }
            }
            .onAppear {
                viewModel.fetch()
            }
        }
    #sourceLocation()
    }
}

extension ViewModel {
    @_dynamicReplacement(for: fetch()) private func __preview__fetch() {
        #sourceLocation(file: "/Users/tiernanjesrani/Desktop/CalendarProject/FrontEnd/FrontEnd/ContentView.swift", line: 19)
        guard let url = URL(string: "http://127.0.0.1:5000") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data,
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
        
        task.resume()
    #sourceLocation()
    }
}

import struct FrontEnd.Testing
import class FrontEnd.ViewModel
import struct FrontEnd.ContentView
import struct FrontEnd.ContentView_Previews