import Cocoa

var str = "Basic Operators"

//1. Посчитать количество секунд от начала года до вашего дня рождения. Игнорируйте високосный год и переходы на летнее и зимнее время. Но если хотите - не игнорируйте :)

let second = 60
let secondInHour = 60 * second
let secondInDay = 24 * secondInHour

let year = (january: 31, february: 28,
            march: 31, april: 30, may: 31,
            june: 30, july: 31, august: 31,
            september: 30, october: 31,
            november: 30, december: 31)
let birthDay = 22
let dayToBirthDay = year.0 + year.1 + year.2 + year.3 + birthDay
dayToBirthDay

let secondToBirthDay = dayToBirthDay * secondInDay

//2. Посчитайте в каком квартале вы родились

let firstQuarter = year.january + year.february + year.march
let secondQuartet = year.april + year.may + year.june
let thirdQuarter = year.july + year.august + year.september
let fourthQuarter = year.october + year.november + year.december

if dayToBirthDay < firstQuarter {
    print("You were born in 1 quarter")
} else if dayToBirthDay < firstQuarter + secondQuartet {
    print("You were born in 2 quarter")
} else if dayToBirthDay < firstQuarter + secondQuartet + thirdQuarter {
    print("You were born in 3 quarter")
} else if dayToBirthDay < firstQuarter + secondQuartet + thirdQuarter + fourthQuarter {
    print("You were born in 4 quarter")
}


//3. Шахматная доска 8х8. Каждое значение в диапазоне 1…8. При заданных двух значениях по вертикали и горизонтали определите цвет поля. Если хотите усложнить задачу, то вместо цифр на горизонтальной оси используйте буквы a,b,c,d,e,f,g,h

var (hor, ver) = (4, 3)
let color = (hor + ver) % 2 > 0 ? "white" : "black"

//chessboard

for y in 1...8 {
    print("\(9 - y)",terminator:" ")
    for x in 1...8 {
        let cell = ((9 - x + y) % 2 > 0) ? "⬜️" : "⬛️"
        print(cell, terminator:"");
    }
    print()
}
print("   a b c d e f g h")

