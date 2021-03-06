//
//  ListElement.swift
//  weekleat
//
//  Created by Philipp Jenny on 28.07.22.
//

import SwiftUI

struct ListElementLarge: View {
    @State var recipie: Recipie
    var body: some View {
        VStack{
            ZStack{
                Image("backgroundRedLarge")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("lasagneLarge")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            HStack{
                VStack(alignment: .leading, spacing: 3){
                    Text(recipie.wrappedTitle)
                        .font(.title3)
                        .fontWeight(.bold)
                    HStack{
                        TagView(tagName: String(recipie.portion), tagIcon: "portion.icon.black")
                   
                        ForEach(recipie.wrappedTags.components(separatedBy: ","), id: \.self){ tag in
                            TagView(tagName: tag, tagIcon: "rice.icon.black")
                        }
                    }
                   
                }.padding([.leading, .bottom])
                Spacer()
                Image(systemName: "chevron.forward")
                    .font(Font.system(size: 15, weight: .light))
                    .foregroundColor(.gray)
                    .padding()
            }
            .frame(height: 100)
            
        }
        .cornerRadius(5)
        .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray, lineWidth: 0.5)
            )
        .padding(.horizontal)
    }
}

//struct ListElementLarge_Previews: PreviewProvider {
//    static var previews: some View {
//        ListElementLarge()
//            .previewLayout(.sizeThatFits)
//    }
//}
