//
//  InputFile.swift
//  FrontEnd
//
//  Created by Tiernan Jesrani on 12/29/23.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
            
            if isSecureField {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
            }
            
            Divider()
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(text: .constant(""), title: "Username", placeholder: "abc")
    }
}
