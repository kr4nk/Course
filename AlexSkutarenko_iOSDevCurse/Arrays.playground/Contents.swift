import Cocoa

var str = "Hello, Arrays"

//1. создать массив "дни в месяцах"
//12 элементов содержащих количество дней в соответствующем месяце
//используя цикл for и этот массив
//- выведите количество дней в каждом месяце (без имен месяцев)

let daysInMonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

for days in daysInMonths {
    print(days)
}

//- используйте еще один массив с именами месяцев чтобы вывести название месяца + количество дней

let monthsName = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]

for mounth in 0..<monthsName.count {
    print("\(monthsName[mounth]) \(daysInMonths[mounth])")
}

//- сделайте тоже самое, но используя массив тюплов с параметрами (имя месяца, кол-во дней)

var yearTuple = [(String, Int)]()
for i in 0..<daysInMonths.count {
    let month = (month:monthsName[i], day:daysInMonths[i])
    yearTuple.append(month)
}
yearTuple

for (month, days) in yearTuple {
    print("\(month): \(days)")
}

//- сделайте тоже самое, только выводите дни в обратном порядке (порядок в массиве не меняется)
print("\n---reversed---\n")

for (month, days) in yearTuple.reversed() {
    print("\(month): \(days)")
}

//- для произвольно выбранной даты (месяц и день) посчитайте количество дней до этой даты от начала года
let currentDay = (month:9, day:13)

var days = 0
for i in 0..<(currentDay.month - 1) {
    days += daysInMonths[i]
}

days += currentDay.day

//2. Сделайте первое задание к уроку номер 4 используя массивы:
//(создайте массив опшинал интов и посчитайте сумму)

let optArray: [Int?] = [1, 2, nil, nil, 32]

//- в одном случае используйте optional binding

var sumOpt = 0

for value in optArray {
    if let value = value {
        sumOpt += value
    }
}
sumOpt

//- в другом forced unwrapping

var sumForce = 0

for value in optArray {
    if value != nil {
    sumForce += value!
    }
}
sumForce

//- а в третьем оператор ??

var sumThree = 0

for value in optArray {
    sumThree += value ?? 0
}
sumThree

//3. создайте строку алфавит и пустой массив строк в цикле пройдитесь по всем символам строки попорядку, преобразовывайте каждый в строку и добавляйте в массив, причем так, чтобы на выходе получился массив с алфавитом задом-наперед

let alphabet = "abcdefghijklmnopqrstuvwxyz"

var array = [String]()

for i in alphabet {
    array.insert(String(i), at: 0)
}

array
