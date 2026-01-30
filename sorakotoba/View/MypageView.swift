import SwiftUI

struct MypageView: View {
    var body: some View {
        ZStack{
            VStack{
                Text("MyPage")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "#D1E4FF").ignoresSafeArea())
            VStack{
                Spacer()
                HStack{
                    Spacer()
//                    if let condition = viewModel.skyCondition {
//                        NavigationLink(
//                            destination: CreateView(skyCondition: condition)
//                        ) {
//                            PlusButton()
//                        }
//                    }
                }
            }
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 20))
        }
        
    }
}

