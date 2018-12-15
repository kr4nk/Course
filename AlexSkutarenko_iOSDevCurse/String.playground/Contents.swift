import Cocoa

var str = "String"

//1. Выполните задание #1 урока о базовых операторах: "Создать пять строковых констант. Одни константы это только цифры, другие содержат еще и буквы. Найти сумму всех этих констант приведя их к Int"
//только вместо forced unwrapping и optional binding используйте оператор ??

let first = "1th"
let second = "2"
let third = "3"
let fourth = "4"
let fifth = "5 constant"

let v1 = (Int(first) ?? 0)
let v2 = (Int(second) ?? 0)
let v3 = (Int(third) ?? 0)
let v4 = (Int(fourth) ?? 0)
let v5 = (Int(fifth) ?? 0)

let sum = v1 + v2 + v3 + v4 + v5

//Когда посчитаете сумму, то представьте свое выражение в виде строки
//Например: 5 + nil + 2 + 3 + nil = 10. но в первом случае используйте интерполяцию строк, а во втором конкатенацию

var stringInterpolation = (v1 > 0 ? "\(v1)" : "nil") + " + "
stringInterpolation +=    (v2 > 0 ? "\(v2)" : "nil") + " + "
stringInterpolation +=    (v3 > 0 ? "\(v3)" : "nil") + " + "
stringInterpolation +=    (v4 > 0 ? "\(v4)" : "nil") + " + "
stringInterpolation +=    (v5 > 0 ? "\(v5)" : "nil") + " ="
print(stringInterpolation,"\(sum)")

var stringConcatenation = (v1 > 0 ? String(v1) : "nil") + " + "
stringConcatenation +=    (v2 > 0 ? String(v2) : "nil") + " + "
stringConcatenation +=    (v3 > 0 ? String(v3) : "nil") + " + "
stringConcatenation +=    (v4 > 0 ? String(v4) : "nil") + " + "
stringConcatenation +=    (v5 > 0 ? String(v5) : "nil") + " ="
print(stringConcatenation,"\(sum)")

//2. Поиграйтесь с юникодом и создайте строку из 5 самых классных по вашему мнению символов, можно использовать составные символы. Посчитайте длину строки методом SWIFT и Obj-C

let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // , Unicode scalar U+1F496
let enclosedEAcute: Character = "\u{E9}\u{20DD}" // enclosedEAcute равен é⃝
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"

let symbolString = "\(dollarSign)\(blackHeart)\(sparklingHeart)\(enclosedEAcute)\(regionalIndicatorForUS)"
    
print(symbolString.count)

//3. Создайте строку английский алфавит, все буквы малые от a до z, задайте константу - один из символов этого алфавита. Используя цикл for определите под каким индексов в строке находится этот символ

let alphabet = "abcdefghijklmnopqrstuvwxyz"
let p: Character = "p"

var index = 0

for i in alphabet {
    if p == i {
        print("index = \(index)")
    }
    index += 1
}
