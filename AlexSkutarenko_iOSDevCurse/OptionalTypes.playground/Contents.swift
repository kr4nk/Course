import Cocoa

var str = "Optional types"

//Домашнее задание:

//1. Создать пять строковых констант
//Одни константы это только цифры, другие содержат еще и буквы
//Найти сумму всех этих констант приведя их к Int
//(Используйте и optional binding и forced unwrapping)

let first = "1th"
let second = "2"
let third = "3"
let fourth = "4"
let fifth = "5 constant"

var sum = 0

//optional binding

if let firstInt = Int(first) {
    sum += firstInt
}

if let secondInt = Int(second) {
   sum += secondInt
}

if let fifth = Int(fifth) {
   sum += fifth
}

//forced unwrapping

let thirdInt = Int(third)
if thirdInt != nil {
    sum += thirdInt!
}

let fourthInt = Int(fourth)
if fourthInt != nil {
    sum += fourthInt!
}

sum

//2. С сервера к нам приходит тюпл с тремя параметрами:
//statusCode, message, errorMessage (число, строка и строка) в этом тюпле statusCode всегда содержит данные, но сама строка приходит только в одном поле
//если statusCode от 200 до 300 исключительно, то выводите message, в противном случает выводите errorMessage
//После этого проделайте тоже самое только без участия statusCode

let headersHTTP: (statusCode:Int, message:String?, errorMessage:String?)

headersHTTP.statusCode = 200
headersHTTP.message = "OK"
headersHTTP.errorMessage = "Error"

let code = headersHTTP.statusCode
if code >= 200 && code < 300 {
    if headersHTTP.message != nil {
        print(headersHTTP.message!)
    } else {
        print("Header undefined")
    }
} else if headersHTTP.errorMessage != nil {
        print(headersHTTP.errorMessage!)
    } else {
         print("Header undefined")
    }

let messegasHeaders: (message:String?, errorMessage:String?)
//
messegasHeaders.0 = "nil"
messegasHeaders.1 = "Error message"

if messegasHeaders.0 != nil {
    print(messegasHeaders.1)
} else {
    print("Message \(messegasHeaders.0)")
}

//3. Создайте 5 тюплов с тремя параметрами:
//имя, номер машины, оценка за контрольную при создании этих тюплов не должно быть никаких данных
//после создания каждому студенту установите имя некоторым установите номер машины, некоторым установите результат контрольной
//выведите в консоль:
//- имена студента
//- есть ли у него машина
//- если да, то какой номер
//- был ли на контрольной
//- если да, то какая оценка

var tuple1: (name:String?, numberPlate:Int?, mark:Int?)
var tuple2: (name:String?, numberPlate:Int?, mark:Int?)
var tuple3: (name:String?, numberPlate:Int?, mark:Int?)
var tuple4: (name:String?, numberPlate:Int?, mark:Int?)
var tuple5: (name:String?, numberPlate:Int?, mark:Int?)

tuple1.name = "Student.A"
tuple2.name = "Student.B"
tuple3.name = "Student.C"
tuple4.name = "Student.D"
tuple5.name = "Student.E"

tuple1.numberPlate = nil
tuple2.numberPlate = nil
tuple3.numberPlate = 263
tuple4.numberPlate = nil
tuple5.numberPlate = 222

tuple1.mark = 5
tuple2.mark = 2
tuple3.mark = 3
tuple4.mark = nil
tuple5.mark = 5

if tuple1.name != nil {
    if tuple1.numberPlate != nil {
        print("\n \n\(tuple1.name!) have car with plate \(tuple1.numberPlate!)")
    } else {
        print("\n\(tuple1.name!) don't have a car")
    }
    if tuple1.mark != nil {
         print("and exam mark is \(tuple1.mark!)")
    } else {
        print("\(tuple1.name!) don't have a mark for exam")
    }
} else {
    print("Student dont have name")
}
if tuple2.name != nil {
    if tuple2.numberPlate != nil {
        print("\n\(tuple2.name!) have car with plate \(tuple2.numberPlate!)")
    } else {
        print("\n\(tuple2.name!) don't have a car")
    }
    if tuple2.mark != nil {
        print("and exam mark is \(tuple2.mark!)")
    } else {
        print("\(tuple2.name!) don't have a mark for exam")
    }
} else {
    print("Student dont have name")
}

if tuple3.name != nil {
    if tuple3.numberPlate != nil {
        print("\n\(tuple3.name!) have car with plate \(tuple3.numberPlate!)")
    } else {
        print("\n\(tuple3.name!) don't have a car")
    }
    if tuple3.mark != nil {
        print("and exam mark is \(tuple3.mark!)")
    } else {
        print("\(tuple3.name!) don't have a mark for exam")
    }
} else {
    print("Student dont have name")
}

if tuple4.name != nil {
    if tuple4.numberPlate != nil {
        print("\n\(tuple4.name!) have car with plate \(tuple4.numberPlate!)")
    } else {
        print("\n\(tuple4.name!) don't have a car")
    }
    if tuple4.mark != nil {
        print("and exam mark is \(tuple4.mark!)")
    } else {
        print("\(tuple4.name!) don't have a mark for exam")
    }
} else {
    print("Student dont have name")
}

if tuple5.name != nil {
    if tuple5.numberPlate != nil {
        print("\n\(tuple5.name!) have car with plate \(tuple5.numberPlate!)")
    } else {
        print("\n\(tuple5.name!) don't have a car")
    }
    if tuple5.mark != nil {
        print("and exam mark is \(tuple5.mark!)")
    } else {
        print("\(tuple5.name!) don't have a mark for exam")
    }
} else {
    print("Student dont have name")
}
