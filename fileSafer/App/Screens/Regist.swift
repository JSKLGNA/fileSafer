//
//  Regist.swift
//  fileSafer
//
//  Created by JSKLJN on 13.04.2024.
//

import SwiftUI

struct Regist: View {
    var body: some View {
        ZStack{
            Color.black
            
            RoundedRectangle(cornerRadius: 30, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.linearGradient(colors: [.blue, .black], startPoint: <#T##UnitPoint#>, endPoint: <#T##UnitPoint#>))
        }
        .ignoresSafeArea()
    }
}

#Preview {
    Regist()
}
