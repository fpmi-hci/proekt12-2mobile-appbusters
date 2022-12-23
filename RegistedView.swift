//
//  RegistedView.swift
//  seccond_attempt
//
//  Created by Валик on 7/30/21.
//

import SwiftUI





struct RegistedView: View{

    
    var body: some View {
        
        VStack{
            TabView{
                Text("Меню")
                    .tabItem
                    {
                        Image(systemName: "flame")
                        Text("Top")
                    }
                Text("Настройки")
                    .tabItem
                    {
                        Image(systemName: "gearshape")
                        Text("Настройки")
                    }
            }
        }
    }
}

struct RegistedView_Previews: PreviewProvider {
    static var previews: some View {
        RegistedView()
    }
}
