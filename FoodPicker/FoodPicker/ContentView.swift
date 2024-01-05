//
//  ContentView.swift
//  FoodPicker
//
//  Created by dreaMTank on 2024/01/03.
//

import SwiftUI

struct ContentView: View {
    
    let food = Food.examples
    
    @State private var selectFood: Food?
    
    var body: some View{
        VStack(spacing: 30) {
            Group{
                if selectFood != nil {
                    Text(selectFood!.image)
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.1)
                        .lineLimit(1)
                        
                }else{
                    Image("dinner")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                      
                }
            } .frame(height: 250)
               
            Text("今日、何を食べよう")
                .bold()
            if selectFood != nil {
                Text(selectFood!.name)
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.green)
                    .id(selectFood!.name)
                    .transition(.asymmetric(insertion: .opacity.animation(.easeInOut(duration :0.5).delay(0.2)), removal: .opacity.animation(.easeInOut(duration: 0.4))))
            }
            
            
            Spacer()
            Button(role: .none){
                selectFood = food.shuffled().filter{
                    $0 != selectFood}.first
            } label: {
                Text(selectFood == .none ? "教えてね" : "次へ" ).frame(width: 200)
                    .animation( .none, value: selectFood)
                    .transformEffect(.identity)
            }.font(.title)
                
                .padding(.bottom,-15)
            
            Button(role: .none){
                selectFood = nil
            } label: {
                Text("リセット").frame(width: 200)
            }
                .buttonStyle(.bordered)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color(.secondarySystemBackground))
        .font(.title)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .animation(.easeInOut(duration: 0.6),value: selectFood)
    }
}

#Preview {
    ContentView()
}
