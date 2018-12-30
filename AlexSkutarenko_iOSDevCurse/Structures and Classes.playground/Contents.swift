import Cocoa

var str = "Hello, Structures and Classes"


//1. Создайте структуру студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несколько экземпляров этой структуры и заполните их данными. Положите их всех в массив (журнал).

struct Student {
    let firstName: String
    let lastName: String
    let birthDate: Int
    let averageScore: Double
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
/*
var sortedArraybyName = journal.sorted(by: {$0.lastName < $1.lastName})
print("\nSorted by Name")
rollCall(array: sortedArraybyName)
*/

//5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.

//6. Теперь проделайте все тоже самое, но не для структуры Студент, а для класса. Какой результат в 5м задании? Что изменилось и почему?




