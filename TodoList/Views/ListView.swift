//
//  ListView.swift
//  TodoList
//
//  Created by Meezu Lawot on 22/08/2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State var showBottomSheet: Bool = false
    
    var body: some View {
        
        ZStack{
            if listViewModel.items.isEmpty{
                EmptyView()
            }else{
                List{
                    ForEach(listViewModel.items, content: { item in
                        ListRowView(itemModel: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    })
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(.plain)
                
            }
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
//                NavigationLink(destination: {
//                    AddToDoView()
//                }, label: {
//                    Image(systemName: "plus")
//                })
            
            Button(action: {
                showBottomSheet.toggle()
            }, label: {
                
                Image(systemName: "plus")
                    .foregroundColor(.blue)
                
            })
            .sheet(isPresented: $showBottomSheet, content: {
                AddToDoView()
                    .presentationDetents([.medium])
            })
        )
        
    }
    
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


