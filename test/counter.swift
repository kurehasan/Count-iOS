import SwiftUI

struct counterView: View {
    @State private var count = 0
    @State private var nameField: String = ""
    @State var isPresented = false
    @StateObject var viewModel: ViewModel
    @Binding var section: Int

    var body: some View {
        NavigationStack{
            VStack{
                TextField("Title", text: $nameField)
                    .padding(.horizontal, 40)
                
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
                    .frame(width: 350, height: 2)
                
                Spacer()
                    .frame(height: 50)
                
                ZStack {
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .cornerRadius(25)
                        .frame(width: 280, height: 200)
                    VStack {
                        Text("\(count)")
                            .font(.largeTitle)
                            .cornerRadius(10)
                            .foregroundColor(.black)
                            .padding()
                        
                        HStack {
                            Button(action: {
                                count += 1
                            }) {
                                Image(systemName: "plus")
                                    .font(.title)
                                    .frame(width: 60, height: 60)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .clipShape(.circle)
                            }
                            
                            Spacer()
                                .frame(width: 80)
                            
                            Button(action: {
                                count -= 1
                            }) {
                                Image(systemName: "minus")
                                    .font(.title)
                                    .frame(width: 60, height: 60)
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .clipShape(.circle)
                            }
                        }
                    }
                    .padding()
                }
                
                Spacer()
                    .frame(height: 50)
                
                Button(action: {
                    let countInfo = CountInfo(name: nameField, number: count)
                    viewModel.CountInfos.append(countInfo)
                    section = 1
                    // isPresented.toggle()
                })
                {
                    Text("Save")
                        .font(.largeTitle)
                }
            }
            .navigationDestination(isPresented: $isPresented) {
                SecondView(data: nameField, countNumber: count, viewModel: viewModel)
            }
        }
    }
}

//#Preview {
//    counterView(viewModel: ViewModel())
//}

