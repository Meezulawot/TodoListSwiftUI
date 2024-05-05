//
//  AddToDoView.swift
//  TodoList
//
//  Created by Meezu Lawot on 22/08/2023.
//

import SwiftUI

struct AddToDoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var lisViewModel: ListViewModel
    @State var textField: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                
                HStack{
                    Text("Add reminders 🖋️")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                    })
                    
                    
                }
                
                
                TextField("Type something here...", text: $textField)
                    .frame(height: 90)
                    .background(Color.yellow.opacity(0.2))
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    if textIsAppropriate(){
                        saveToDoItem()
                    }
                        
                    }, label: {
                        Text("save".uppercased())
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                            .padding(.top, 8)
                    }
                )
                .alert(isPresented: $showAlert, content: getAlert)
                .disabled(!textIsAppropriate())

            }
            .padding()
            .padding(.top, 20)
            
        }
    }
    
    func saveToDoItem(){
        if textIsAppropriate(){
            lisViewModel.addItem(title: textField)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool{
        if textField.count < 3{
            alertTitle = "Enter valid 3 character long text!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
}

struct AddToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddToDoView()
        }
        .environmentObject(ListViewModel())
    }
}
