import Cocoa

var str = "Hello, Structures and Classes"


//1. Создайте структуру студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несколько экземпляров этой структуры и заполните их данными. Положите их всех в массив (журнал).

struct Student {
    let firstName: String
    let lastName: String
    let birthDate: Int
    var averageScore: Double
}

let student1 = Student(firstName: "Alex", lastName: "Holt", birthDate: 1995, averageScore: 4.0)
let student2 = Student(firstName: "Mariam", lastName: "Johnson", birthDate: 1990, averageScore: 3.0)
let student3 = Student(firstName: "Evie", lastName: "Brown", birthDate: 1997, averageScore: 5.0)
let student4 = Student(firstName: "Samantha", lastName: "Thompson", birthDate: 1992, averageScore: 2.5)

let journal = [student1, student2, student3, student4]

//2. Напишите функцию, которая принимает массив студентов и выводит в консоль данные каждого. Перед выводом каждого студента добавляйте порядковый номер в “журнале”, начиная с 1.

func rollCall (array: [Student]) {
    var number = 0
    for every in array {
        number += 1
        print("\(number): \(every.firstName) \(every.lastName), birth year: \(every.birthDate) and averege score:\(every.averageScore)")
    }
}

rollCall(array: journal)

//3. С помощью функции sorted отсортируйте массив по среднему баллу, по убыванию и распечатайте “журнал”.

var sortedArraybyScore = journal.sorted(by: {$0.averageScore < $1.averageScore})
print("\nSorted by Score")
rollCall(array: sortedArraybyScore)

//4. Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаковые, а вы сделайте так чтобы такое произошло, то сравниваются по имени. Распечатайте “журнал”.

let student5 = Student(firstName: "Tomy", lastName: "Thompson", birthDate: 1992, averageScore: 2.5)
let student6 = Student(firstName: "Bob", lastName: "Brown", birthDate: 1992, averageScore: 2.5)

let journal2 = [student1, student2, student3, student4, student5, student6]

var sortedArraybyName = journal2.sorted(by: {
    if $0.lastName == $1.lastName {
        return $0.firstName < $1.firstName
    }
    return $0.lastName < $1.lastName
})
print("\nSorted by Name")

rollCall(array: sortedArraybyName)


//5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.

var journalNew = journal2

journalNew[0].averageScore = 3.0
journalNew[1].averageScore = 3.1
journalNew[2].averageScore = 3.2
journalNew[3].averageScore = 3.3
journalNew[4].averageScore = 3.4
journalNew[5].averageScore = 3.5

print("\nJournal 2")
rollCall(array: journal2)
print("\nNew journal")
rollCall(array: journalNew)

//6. Теперь проделайте все тоже самое, но не для структуры Студент, а для класса. Какой результат в 5м задании? Что изменилось и почему?

//007. Уровень супермен. Выполните задание шахмат из урока по энумам используя структуры либо классы



