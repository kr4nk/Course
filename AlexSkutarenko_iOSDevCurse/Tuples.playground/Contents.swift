import Cocoa

var str = "Tuples"
//Домашнее задание:
//
//1. Создать тюпл с тремя параметрами:
//- максимальное количество отжиманий
//- максимальное количество подтягиваний
//- максимальное количество приседаний
//Заполните его своими достижениями :)
//Распечатайте его через println()
//2. Также сделайте три отдельных вывода в консоль для каждого параметра
//При том одни значения доставайте по индексу, а другие по параметру
//3. Создайте такой же тюпл для другого человека (супруги или друга)
//с такими же параметрами, но с другими значениями
//Используйте промежуточную переменную чтобы поменять соответствующие значения
//первого тюпла на значения второго
//4. Создайте третий тюпл с теми же параметрами, но значения это разница
//между соответствующими значениями первого и второго тюплов
//Результат выведите в консоль

//1.
let myResults = (squats:50, pushups:30, pullups:15)

print("My results in squatting, pushups, pull-ups is \(myResults)")

//2.
print("Quantity squats = \(myResults.0)")
print("Quantity pushing up = \(myResults.1)")
print("Quantity pulling up = \(myResults.pullups)")

//3.
var mySuperResult = myResults

mySuperResult

let superSquats = 100
let superPushups = 50
let superPullups = 30

mySuperResult = (superSquats, superPushups, superPullups)
mySuperResult

//4.
let diff = (mySuperResult.squats - myResults.squats,
            mySuperResult.pushups - myResults.pushups,
            mySuperResult.pullups - myResults.pullups)
diff

print("Differens between mySuperResults and My results =\nsquats: \(diff.0)\npush ups: \(diff.1)\npullups: \(diff.2)")
