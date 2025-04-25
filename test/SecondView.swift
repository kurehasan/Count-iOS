//
//  SecondView.swift
//  test
//
//  Created by 浅沼紅葉 on 2025/04/07.
//

import SwiftUI

struct SecondView: View {
    @State var data: String
    @State var countNumber: Int
    @Environment(\.dismiss) var dismiss
    @State private var countName: [String] = []
    @State private var countNunber: [Int] = []
    @StateObject var viewModel: ViewModel
    @State var editMode: EditMode = .inactive
    
    var body: some View {
        NavigationView {
            List {
                Section{
                    ForEach(viewModel.CountInfos) { info in
                        Text("\(info.name) : \(info.number)")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundColor(.indigo)
                    }.onDelete(perform: {indexSet in
                        viewModel.CountInfos.remove(atOffsets: indexSet)
                    }).onMove(perform:  {indices, newOffset in
                        self.viewModel.CountInfos.move(fromOffsets: indices, toOffset: newOffset)
                    })
                }
                //            header: {
                //                Text("Timer History")
                //                    .font(.largeTitle)
                //                    .fontWeight(.bold)
                //                    .foregroundColor(.black)
            }
            .navigationBarTitle("Counter History", displayMode: .inline)
            .navigationBarItems(trailing: Button.init(action: { self.editMode = self.editMode.isEditing ? .inactive : .active }, label: {
                if self.editMode.isEditing {
                    Image.init(systemName: "checkmark")
                } else {
                    Image.init(systemName: "pencil")
                }
            }))
            .environment(\.editMode, self.$editMode)
        }
}
//        .onAppear {
//            countName.append(data)
//            countNunber.append(countNumber)
//        }
    }


//#Preview {
//    SecondView(data: "test", countNumber: 6, viewModel: ViewModel())
//}
