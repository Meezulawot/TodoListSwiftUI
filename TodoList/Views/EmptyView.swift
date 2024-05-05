//
//  EmptyView.swift
//  TodoList
//
//  Created by Meezu Lawot on 23/08/2023.
//

import SwiftUI

struct EmptyView: View {
    
    @State var animate: Bool = false
    @State var showBottomSheet: Bool = false
    
    var body: some View {
        VStack{
            Text("There are no items!")
                .font(.title)
                .fontWeight(.semibold)
            Text("Click add button and add a bunch of items to your todo list !!")
                .padding(.top, 4)
            
            Button(action: {
                showBottomSheet.toggle()
            }, label: {
                Text("Add todos")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                
                Image(systemName: "plus")
                    .foregroundColor(.white)
                
            })
            .sheet(isPresented: $showBottomSheet, content: {
                AddToDoView()
                    .presentationDetents([.medium, .large])
            })
            .padding()
            .background(Color.blue)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10)
            
        }
        .multilineTextAlignment(.center)
        .padding(40)
        .onAppear(perform: addAnimation)
    }
    
    func addAnimation(){
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            withAnimation(.easeInOut(duration: 1.5)){
                animate.toggle()
            }
        })
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
