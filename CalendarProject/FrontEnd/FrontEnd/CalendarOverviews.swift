//
//  CalendarOverviews.swift
//  FrontEnd
//
//  Created by Tiernan Jesrani on 1/9/24.
//

import SwiftUI

struct Token: Hashable, Codable {
    let token: String
}

class ViewModel: ObservableObject {
    @Published var jsonTest: [Token] = []
    
    func fetch() {
        guard let url = URL(string: "http://127.0.0.1:5000") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data,
            _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                guard !data.isEmpty else {
                                    print("Empty data received")
                                    return
                                }
                
                let jsonTest = try JSONDecoder().decode([Token].self, from: data)
                DispatchQueue.main.async {
                    self?.jsonTest = jsonTest
                }
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
    }
}

struct CalendarOverviews: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.jsonTest, id: \.self) { token in
                Text(token.token)
            }
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

struct CalendarOverviews_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CalendarOverviews()
            CalendarOverviews()
        }
    }
}
