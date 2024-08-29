//
//  LogoSubHeader.swift
//  OnBoardingRegistration
//
//  Created by shams on 7/21/24.
//

import SwiftUI

struct LogoSubHeader: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Chicago")
                .font(Font.custom("MarkaziText-Regular", size: 40))
                .foregroundColor(.white) 
        }
    }
}
#Preview {
    LogoSubHeader()
}
