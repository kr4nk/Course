import Cocoa

var str = "Hello, Switch"


//1. Создать строку произвольного текста, минимум 200 символов. Используя цикл и оператор свитч посчитать количество гласных, согласных, цифр и символов.

let string = "A string is a series of characters, such as \"Swift\", that forms a collection. Strings in Swift are Unicode correct and locale insensitive, and are designed to be efficient. The String type bridges with the Objective-C class NSString and offers interoperability with C functions that works with strings. 123 123 123"

var vowels = 0
var consonant = 0
var symbols = 0
var digit = 0

for char in string.lowercased() {
    
    switch char {
    case "a", "e", "i", "o", "u" : vowels += 1
    case "b", "c", "d", "f", "g", "h", "j",
         "k", "l", "m", "n", "p", "q", "r",
         "s", "t", "v", "w", "x", "y", "z" : consonant += 1
    case "0"..."9" : digit += 1
    default: symbols += 1
    }
}

print("Vowels = \(vowels)\nConsonants = \(consonant)\nDigits = \(digit)\nSymbols = \(symbols)\n\n")


//2. Создайте свитч который принимает возраст человека и выводит описание жизненного этапа

var age = 9//Int()

switch age {
case 1...3: print("Baby")
case 4...11: print("Kid")
case 12...17: print("Teenager")
default:
    print("Age not found")
}


//3. У вас есть имя отчество и фамилия студента (русские буквы). Имя начинается с А или О, то обращайтесь к студенту по имени, если же нет, то если у него отчество начинается на В или Д, то обращайтесь к нему по имени и отчеству, если же опять нет, то в случае если фамилия начинается с Е или З, то обращайтесь к нему только по фамилии. В противном случае обращайтесь к нему по полному имени.

let firstName = "Galileo"
let lastName = "Scaramouch"
let patronymic = "Bismillah"
var fullName = (firstName, lastName, patronymic)

switch fullName {

case (let name, _, _) where name.hasPrefix("A"): fallthrough
case (let name, _, _) where name.hasPrefix("O"): print("Hi \(firstName)")
case (_, _, let father) where father.hasPrefix("V"): fallthrough
case (_, _, let father) where father.hasPrefix("D"): print("Hi \(firstName) \(lastName)")
case (_, let lname, _) where lname.hasPrefix("E"): fallthrough
case (_, let lname, _) where lname.hasPrefix("Z"): print("Hi \(firstName) \(patronymic)")

default:
    print("Hi \(firstName) \(patronymic) \(lastName)")
}


//4. Представьте что вы играете в морской бои и у вас осталось некоторое количество кораблей на поле 10Х10 (можно буквы и цифры, а можно только цифры). Вы должны создать свитч, который примет тюпл с координатой и выдаст один из вариантов: мимо, ранил, убил.

let ship1 = (x:7, y:5)

switch ship1 {
case (1...5, 5):
    print("\nHit")
case (5, 5...10):
    print("\nHit")
case (5, 5):
    print("\nKilled")
default:
    print("\nMiss")
}

let ship2 = (x:3, y:5)

switch ship2 {
case (1...5, 5):
    print("\nHit")
case (5, 5...10):
    print("\nHit")
case (3, 3):
    print("\nKilled")
default:
    print("\nMiss")
}

