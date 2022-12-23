//
//  LoginView.swift
//  seccond_attempt
//
//  Created by Валик on 7/30/21.
//

import SwiftUI







struct LoginView: View {
    @State var user = ""
    @State var pass = ""
    @State var selection = 0
    @State var alert = false
    
    init() {
        //this changes the "thumb" that selects between items
        UISegmentedControl.appearance().selectedSegmentTintColor = .white
        //and this changes the color for the whole "bar" background
        UISegmentedControl.appearance().backgroundColor = UIColor(red: 139.0/255.0, green: 0.0, blue: 0.0, alpha: 1.0)
        


        //these lines change the text color for various states
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.white], for: .normal)
    }
    
    
    var body: some View {
        
        
        
        GeometryReader{ geo in
            
            VStack(alignment: .center){
                
                
                
                VStack{
                    
                    Image("Glass")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70, alignment: .center)
                    
                    
                    Picker(selection: $selection, label: Text(""), content: {
                        Text("Вход").tag(0)
                        Text("Регистрация").tag(1)
                    }).padding(.horizontal, 20)
                    .padding(.top, 20)
                    .pickerStyle(SegmentedPickerStyle())
                    
                    switch selection{
                    case 0:
                        Enter().padding(.vertical)
                            .padding(.horizontal,30)
                    
                    case 1:
                        Register().padding(.vertical)
                            .padding(.horizontal,30)
                    
                    
                    default:
                        Enter().padding(.vertical)
                            .padding(.horizontal,30)
                    }
                
                }.padding(.top,geo.size.height/6)
                
                
                Spacer()
            }.frame(width: geo.size.width, height: geo.size.height, alignment: .center)
            .onAppear{
                NotificationCenter.default.addObserver(forName: NSNotification.Name("switch"), object: nil, queue: .main){_ in
                    self.alert = true
                    self.selection = 0
                }
            }
            .alert(isPresented: self.$alert, content: {
                Alert(title: Text(""), message: Text("Спасибо за регистрацию!"), dismissButton: .default(Text("Ok")))
            })
            
        }
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


struct Enter: View{
    @State var user = ""
    @State var pass = ""
    @State var message = ""
    @State var alert = false
    
    var body: some View{
        VStack{
            HStack{
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20, alignment: .center)
                TextField("Email adress",text: self.$user)
                    
            }.padding(.vertical)
            
            HStack{
                Image(systemName: "eye")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20, alignment: .center)
                TextField("Пароль",text: self.$pass)
                    
            }.padding(.vertical)
            
           
            Button(action: {
                
            }, label: {
                Text("Войти")
            }).padding().alert(isPresented: $alert, content: {
                Alert(title: Text("Error"), message: Text(message), dismissButton: .default(Text("Ok")))
            })
            
            Spacer()
            
            VStack(spacing:10){
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 1)
                
                Text("или").foregroundColor(.gray)
                
                HStack(){
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/)
                    {
                        Image("apple")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 55, height: 55)
                    }.padding(.horizontal)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/)
                    {
                        Image("google")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 55, height: 55)
                    }.padding(.horizontal)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/)
                    {
                        Image("vk")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 55, height: 55)
                    }.padding(.horizontal)
                    
                }.padding(.top)
                
            }.padding(.top)
        }
    }
}






struct Register: View{
    @State var user = ""
    @State var pass = ""
    @State var second_pass = ""
    @State var message = ""
    @State var alert = false
    
    var body: some View{
        VStack{
            HStack{
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20, alignment: .center)
                TextField("Email adress",text: self.$user)
                    
            }.padding(.vertical)
            
            HStack{
                Image(systemName: "eye")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20, alignment: .center)
                TextField("Пароль",text: self.$pass)
                    
            }.padding(.vertical)
            
            HStack{
                Image(systemName: "eye")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20, alignment: .center)
                TextField("Повторите пароль",text: self.$second_pass)
                    
            }.padding(.vertical)
            
            
            
            Button(action: {
            }, label: {
                Text("Регистрация")
            }).padding()
            .alert(isPresented: $alert, content: {
                Alert(title: Text("Error"), message: Text(message), dismissButton: .default(Text("Ok")))
            })
        }
    }
}


