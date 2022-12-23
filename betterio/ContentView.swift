//
//  ContentView.swift
//  seccond_attempt
//
//  Created by Валик on 7/29/21.
//

import SwiftUI



struct ContentView: View {
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
        
        let registed = RegistedView()
        let login = LoginView()
        
        
        VStack{
            if status{
                registed
            }
            else{
                login
            }
        }.onAppear{
            NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main){ _ in
                let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                self.status = status
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

