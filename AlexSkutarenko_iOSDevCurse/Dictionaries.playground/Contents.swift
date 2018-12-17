import Cocoa

var str = "Hello, Dictionaries"

//1. Создайте дикшинари как журнал студентов, где имя и фамилия студента это ключ, а оценка за контрольную значение. Некоторым студентам повысьте оценки - они пересдали. Потом добавьте парочку студентов, так как их только что перевели к вам в группу. А потом несколько удалите, так как они от вас ушли :(

var students = ["Bob Marley": 2, "Billy Bob": 3, "Elvis Prasly": 4, "Jack Black": 5]

students.updateValue(4, forKey: "Bob Marley")
students.updateValue(4, forKey: "Billy Bob")

students["Iggy Pop"] = 2
students["Franky"] = 4

students.removeValue(forKey: "Jack Black")
students.removeValue(forKey: "Bob Marley")

print(students)

//После всех этих перетрубаций посчитайте общий бал группы и средний бал

var sums     = 0
var average  = 0.0

for mark in students.values {
    sums += mark
    average = Double(sums / students.count)
}

sums
average

//2. Создать дикшинари дни в месяцах, где месяц это ключ, а количество дней - значение.

let year = ["january"   : 31,
            "february"  : 28,
            "march"     : 31,
            "april"     : 30,
            "may"       : 31,
            "june"      : 30,
            "july"      : 31,
            "august"    : 31,
            "september" : 30,
            "october"   : 31,
            "november"  : 30,
            "december"  : 31]

//В цикле выведите ключ-значение попарно, причем один раз выведите через тюплы, а другой раз пройдитесь по массиву ключей и для каждого из них доставайте значения.

for (key, value) in year {
    print("\(key) - \(value)")
}

for value in year.keys {
    print("\(year[value]!) - \(value)")
}

//3. Создать дикшинари , в которой ключ это адрес шахматной клетки (пример: a5, b3, g8), а значение это Bool. Если у клетки белый цвет, то значение true, а если черный - false. Выведите дикшинари в печать и убедитесь что все правильно.


var chessDesk = [String: Bool]()

let letters = ["a", "b", "c"]//"abcdefghijklmnopqrstuvwxyz"

var posDict = [String: Int]()

var index = 1

for char in letters {
    posDict[String(char)] = index
    index += 1
}

for letter in 0..<letters.count {
    for number in 0..<index {
        chessDesk["\(letters[letter])\(index)"] = (letter % 2 != number % 2) ? true : false
    }
}

print(chessDesk)
