import Cocoa

var str = "Hello, Closures"


//1. Написать функцию, которая ничего не возвращает и принимает только один клоужер, который ничего не принимает и ничего не возвращает . Функция должна просто посчитать от 1 до 10 в цикле и после этого вызвать клоужер. Добавьте println в каждый виток цикла и в клоужер и проследите за очередностью выполнения команд.

func countingToTen (closure: () -> ()) {
    var count = 0
    
    for i in 1...10 {
        count += 1
        closure()
        print(i)
    }
}

countingToTen {
    print("+1")
}

//2. Используя метод массивов sorted, отсортируйте массив интов по возрастанию и убыванию. Пример показан в методичке.

let array1 = [1,2,3,4,5,6]

var reversedArray = array1.sorted(by: >)

//3. Напишите функцию, которая принимает массив интов и клоужер и возвращает инт. Клоужер должен принимать 2 инта (один опшинал) и возвращать да или нет. В самой функции создайте опшинал переменную. Вы должны пройтись в цикле по массиву интов и сравнивать элементы с переменной используя клоужер. Если клоужер возвращает да, то вы записываете значение массива в переменную. в конце функции возвращайте переменную.

func closureBoolFunc (array: [Int], closure:(Int?, Int) -> Bool) -> Int {
    var storage: Int?

    for i in array {
        if closure(storage, i) {
            storage = i
        }
    }
    return storage ?? 0
}

//используя этот метод и этот клоужер найдите максимальный и минимальный элементы массива.

let maximumValue = closureBoolFunc(array: array1) {$0 == nil || $0! < $1}

print("\nMaximum value in array \(array1) = \(maximumValue)")

let minimumValue = closureBoolFunc(array: array1) {$0 == nil || $0! > $1}

print("Minimum value in array \(array1) = \(minimumValue)")

//4. Создайте произвольную строку. Преобразуйте ее в массив букв. Используя метод массивов sorted отсортируйте строку так, чтобы вначале шли гласные в алфавитном порядке, потом согласные, потом цифры, а потом символы

var arrayCharacters = [String]()

for char in str {
    arrayCharacters.append(String(char))
}
arrayCharacters

func priority(string:String) -> Int {
    switch (string.lowercased()) {
    case "a", "e", "i", "o", "u", "y":
        return 0
    case "a"..."z":
        return 1
    case "0"..."9":
        return 2
    default:
        return 3
    }
}

let sortedArray =
    arrayCharacters.sorted {
        switch (priority(string:$0), priority(string:$1)) {
        case let(x,y) where x < y:
            return true
        case let(x,y) where x > y:
            return false
        default:
            return $0.lowercased() <= $1.lowercased()
        }
}
print(sortedArray)

//5. Проделайте задание №3 но для нахождения минимальной и максимальной буквы из массива букв (соответственно скалярному значению)

func closureBoolFuncChar (array: String, closure:(Character?, Character) -> Bool) -> String {
    var storage: Character?
    
    for i in array {
        if closure(storage, i) {
            storage = i
        }
    }
    return String(storage!)
}

let maxChar = closureBoolFuncChar(array: str) {$0 == nil || $0! < $1}
print(maxChar)

let minChar = closureBoolFuncChar(array: str) {$0 == nil || $0! > $1}
print(minChar)
