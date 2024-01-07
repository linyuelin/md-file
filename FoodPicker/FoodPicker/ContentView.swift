//
//  ContentView.swift
//  FoodPicker
//
//  Created by dreaMTank on 2024/01/03.
//

import SwiftUI


struct ContentView: View {
    @State private var selectFood: Food?
    
    @State private var shouldShowInfo: Bool = false
    
    let food = Food.examples
    
    
    
   
    var body: some View{
        ScrollView{
            VStack(spacing: 30) {
                
                foodImage
                Text("今日、何を食べよう") .bold()
                   
               
                selectedFoodInfoView
                
                Spacer().layoutPriority(1)
                
                selectFoodButton
                
                cancelButton
                
            }
            .frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.height - 100)
            .padding()
           
            .font(.title)
            .mainButtonStyle()
            .animation(.mySpring, value: shouldShowInfo)
            .animation(.myEase,value: selectFood)
        } .background(.bg2)
    }
}

//SubViews
private extension ContentView {
    var foodImage: some View {
        Group{
            if  let selectFood  {
                Text(selectFood.image)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.1)
                    .lineLimit(1)
                
            }else{
                Image("dinner")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                
            }
        } .frame(height: 250)
    }
    var foodNameView: some View {
        HStack{
            Text(selectFood!.name)
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.green)
                .id(selectFood!.name)
                .transition(.delayInsertionOpacity)
            Button{
                shouldShowInfo.toggle()
            } label: {
                Image(systemName: "info.circle.fill").foregroundColor(.secondary)
                    
            }.buttonStyle(.plain)
        }
    }
    
    var foodDetailView: some View {
        VStack{
            if shouldShowInfo{
                Grid(horizontalSpacing: 12 ,  verticalSpacing: 12){
                    
                    GridRow{
                        Text("蛋白質")
                        Text("脂肪")
                        Text("炭水化物")
                    }.frame(minWidth: 60)
                    
                    Divider()
                        .gridCellUnsizedAxes(.horizontal)
                        .padding(.horizontal, -10)
                    
                    GridRow{
                        Text(selectFood!.$protein)
                        Text(selectFood!.$fat)
                        Text(selectFood!.$carb)
                    }
                }
                .font(.title3)
                .padding(.horizontal)
                .padding()
                .roundedRectBackground()
                .transition(.moveUpWithOpacity)
                
            }
        }.frame(maxWidth: .infinity)
            .clipped()
        
    }
   
    @ViewBuilder var selectedFoodInfoView: some View{
        if let selectFood  {
            
            foodNameView
            
            Text("カロリ:\(selectFood.$calorie)").font(.title2)
            
            foodDetailView
        }
    }
    
    var selectFoodButton: some View {
        Button(role: .none){
            selectFood = food.shuffled().filter{
                $0 != selectFood}.first
        } label: {
            Text(selectFood == .none ? "教えてね" : "次へ" ).frame(width: 200)
                .animation( .none, value: selectFood)
                .transformEffect(.identity)
        }.font(.title)
        
            .padding(.bottom,-15)
        
    }
    
    var cancelButton: some View{
        Button(role: .none){
            selectFood = nil
            shouldShowInfo = false
        } label: {
            Text("リセット").frame(width: 200)
        }
        .buttonStyle(.bordered)
    }
    
}

extension ContentView{
    init(selectedFood: Food){
        _selectFood = State(wrappedValue: selectedFood)
    }
}

#Preview {
    ContentView(selectedFood: .examples.first!)
   
}
