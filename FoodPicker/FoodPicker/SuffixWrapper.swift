//
//  SuffixWrapper.swift
//  FoodPicker
//
//  Created by dreaMTank on 2024/01/07.
//



@propertyWrapper struct Suffix: Equatable{
    var wrappedValue: Double
    private let suffix: String
    
    init(wrappedValue: Double, _ suffix: String) {
        self.wrappedValue = wrappedValue
        self.suffix = suffix
    }
    
    var projectedValue: String {
        wrappedValue.formatted() + " \(suffix)"
    }
}
