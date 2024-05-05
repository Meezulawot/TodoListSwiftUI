//
//  ListRowView.swift
//  TodoList
//
//  Created by Meezu Lawot on 22/08/2023.
//

import SwiftUI

struct ListRowView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    let itemModel: ItemModel
    @State var showBottomSheet: Bool = false
    
    var itemIndex : Int{
        listViewModel.items.firstIndex(where: {$0.id == itemModel.id}) ?? 0
    }
    
    var body: some View {
        HStack{
            Image(systemName: itemModel.isCompleted ? "checkmark.square": "square")
                .foregroundColor(itemModel.isCompleted ? .green:.gray)
            Text(itemModel.title)
            Spacer()
            
//            Button(action: {
//                showBottomSheet.toggle()
//            }, label: {
//                Image(systemName: "ellipsis")
//            })
//            .padding()
//            .sheet(isPresented: $showBottomSheet, content: {
//                AddToDoView()
//                    .presentationDetents([.medium])
//            })
            
        }
        .font(.title3)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "First Item", isCompleted: true)
    static var item2 = ItemModel(title: "Second Item", isCompleted: false)
    
    static var previews: some View {
        Group{
            ListRowView(itemModel: item1)
            ListRowView(itemModel: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
