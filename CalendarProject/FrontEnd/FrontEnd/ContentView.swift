//
//  ContentView.swift
//  FrontEnd
//
//  Created by Tiernan Jesrani on 12/27/23.
//

import SwiftUI

struct ContentView: View {
    let tokInst = SendToken()
    @State var isValidToken: Bool?
    
    var body: some View {
        Group {
            if isValidToken == true {
                CalendarOverviews()
            }
            else if isValidToken == false {
                LoginPage()
            }
            else {
                Text("Checking Token")
                    .onAppear() {
                        tokInst.send() { result in
                            switch result {
                                case .success(let message):
                                    print(message)
                                    isValidToken = true
                                    
                                case .failure(let error):
                                    print(error.localizedDescription)
                                    isValidToken = false
                            }
                        }
                    }
            }
        }
    }
    
    
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
