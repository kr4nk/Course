import Cocoa

var str = "Hello, Function"

//1. Создайте пару функций с короткими именами, которые возвращают строку с классным символом или символами. Например heart() возвращает сердце и т.п. Вызовите все эти функции внутри принта для вывода строки этих символов путем конкатенации.

func heart() -> String {
    let emoji = "♥️"
    return emoji
}

func blueBCirlce() -> String {
    let emoji = "🔵"
    return emoji
}

func okSign() -> String {
    let emoji = "🆗"
    return emoji
}

print("\(heart())\t\(blueBCirlce()) \n\t\(okSign())\n")
//2. Опять шахматные клетки. Реализовать функцию, которая принимает букву и символ и возвращает строку “белая” или “черная”. Строку потом распечатайте в консоль

func chessDesk(letterRow: Character, numberColumn: Int) -> String {
    let row = ["A", "B", "C", "D", "F", "G", "H"]
    return ((row.count) % 2 == numberColumn % 2) ? "Black ⬛️" : "White ⬜️"
}

print("A1 = \(chessDesk(letterRow: "A", numberColumn: 1))")
print("B2 = \(chessDesk(letterRow: "B", numberColumn: 2))")
print("C3 = \(chessDesk(letterRow: "C", numberColumn: 3))")

//3. Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке. Можете создать еще одну, которая принимает последовательность и возвращает массив в обратном порядке. Чтобы не дублировать код, сделайте так, чтобы функция с последовательностью вызывала первую.

func arrayRevers(array: [Any]) -> [Any] {
    return array.reversed()
}

var arrayInt = [1,2,3,4,5]
var arrayString = ["a", "b", "c", "d", "e"]

print("\n")
print(arrayRevers(array: arrayInt))
print(arrayRevers(array: arrayString))
print("\n")

//4. Разберитесь с inout самостоятельно и выполните задание номер 3 так, чтобы функция не возвращала перевернутый массив, но меняла элементы в существующем. Что будет если убрать inout?

func arrayInsert(array: inout [Int]) {
    let temp = array.count
    array.insert(temp, at: 0)
}

arrayInsert(array: &arrayInt)


//5. Создайте функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные большими буквами, согласные маленькими, а цифры меняет на соответствующие слова (9 -> nine и тд)

func stringM (someText: String) -> String {
    
//    let numbers = [0:"zero", 1:"one", 2:"two", 3:"three", 4:"four", 5:"five", 6:"six", 7:"seven", 8:"eight", 9:"nine", 10:"ten"]
    var resultString = ""
    
    for char in someText.lowercased() {
        
        let char = String(char)
        
        switch char {
            
        case " ":
            resultString += " "
            
//        case [0:"zero", 1:"one", 2:"two", 3:"three", 4:"four", 5:"five", 6:"six", 7:"seven", 8:"eight", 9:"nine", 10:"ten"]:
            
            
        case "b"..."z":
            resultString += char
            
        case "a", "e", "u", "o":
            resultString += char.uppercased()
            
        default:
            break
        }
    }
    return resultString
}

let text = stringM(someText: "in this case, 3 to the power of 10). It multiplies a starting value of 1 (that is, 3 to the power of 0) by 3, ten times, using a closed range that starts with 1 and ends with 10. For this calculation, the individual counter values each time through the loop are unnecessary—the code simply 101")

print(text)

