


struct Food: Equatable {
    var name: String
    var image: String
    var calorie: Double
    var carb: Double
    var fat: Double
    var protein: Double
    
    static let examples = [
        Food(name: "ハンバーガー", image: "🍔", calorie: 294, carb: 14, fat: 24, protein: 17),
        Food(name: "サラダ", image: "🥗", calorie: 89, carb: 20, fat: 0, protein: 1.8),
        Food(name: "ピザ", image: "🍕", calorie: 266, carb: 33, fat: 10, protein: 11),
        Food(name: "パスタ", image: "🍝", calorie: 339, carb: 74, fat: 1.1, protein: 12),
        Food(name: "鶏ももにく弁当", image: "🍗🍱", calorie: 191, carb: 19, fat: 8.1, protein: 11.7),
        Food(name: "ラーメン", image: "🍜", calorie: 256, carb: 56, fat: 1, protein: 8),
        Food(name: "火鍋", image: "🍲", calorie: 233, carb: 26.5, fat: 17, protein: 22),
        Food(name: "牛肉ラーメン", image: "🐄🍜", calorie: 219, carb: 33, fat: 5, protein: 9),
        Food(name: "おでん", image: "🥘", calorie: 80, carb: 4, fat: 4, protein: 6),
    ]
}
