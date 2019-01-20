import Cocoa

var str = "Hello, Type Properties"
/*
1. Создать структуру “Описание файла” содержащую свойства:
- путь к файлу
- имя файла
- максимальный размер файла на диске
- путь к папке, содержащей этот файл
- тип файла (скрытый или нет)
- содержимое файла (можно просто симулировать контент)
*/

struct FileDescription {
    var filePath: String {
        get {
            return filePathToFolder + "/" + fileName + fileContent
        }
    }
    var fileName: String
    static let fileMaxSizeKB = 1024.00 * 10 // 10MB
    var fileSize: Double {
        didSet {
        if self.fileSize > FileDescription.fileMaxSizeKB {
            return fileSize = oldValue
            }
        }
    }
    var filePathToFolder: String
    var fileHidenType: Bool
    var fileContent: String
}

var fileLesson = FileDescription(fileName: "Properties_lesson", fileSize: 3075, filePathToFolder: "mac/‎⁨iCloud Drive⁩/Documents⁩/swift⁩/Course⁩/AlexSkutarenko_iOSDevCurse", fileHidenType: true, fileContent: ".swift")

fileLesson.fileName
fileLesson.filePathToFolder
fileLesson.filePath


//2. Создайте энум, который будет представлять некую цветовую гамму. Этот энум должен быть типа Int и как raw значение должен иметь соответствующее 3 байтное представление цвета. Добавьте в этот энум 3 свойства типа: количество цветов в гамме, начальный цвет и конечный цвет.

enum Color: Int {
    case red = 0xFF0000
    case green = 0x008000
    case blue = 0x000080
    
    static let colorCount = 3
    /*static let colorCount: Int = {
        var max: Int = 0
        while Color(rawValue: max) != .none { max += 1}
            return max
        }()*/
    static let firstColor = Color.red
    static let lastColor = Color.blue
}


/*
3. Создайте класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавьте несколько свойств непосредственно этому классу чтобы контролировать:
- минимальный и максимальный возраст каждого объекта
- минимальную и максимальную длину имени и фамилии
- минимально возможный рост и вес
- самое интересное, создайте свойство, которое будет содержать количество созданных объектов этого класса
*/

let minAge = 1
let maxAge = 200
let minName = 3
let maxName = 20
let minHeight = 50.0
let minWeight = 7.0

class Human {
    
    var firstName: String {
        didSet {
            if firstName.count > maxName || firstName.count < minName {
                firstName = oldValue
                print("Error: Name to long or to short")
            }
        }
    }
    
    var lastName: String {
        didSet {
            if lastName.count > maxName || lastName.count < minName {
                lastName = oldValue
                print("Error: Last name to long or to short")
            }
        }
    }
    
    var age: Int {
        didSet {
            if age < minAge || age > maxAge {
                age = oldValue
            }
        }
    }
    
    var height: Double {
        didSet {
            if height < minHeight {
                height = oldValue
            }
        }
    }
    
    var weight: Double {
        didSet {
            if weight < minWeight {
                weight = oldValue
            }
        }
    }
    
    struct counter { static var count = 0 }
    
    init(firstName: String, lastName: String, age: Int, height: Double, weight: Double) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.height = height
        self.weight = weight
        
        Human.counter.count += 1
    }
}

var humanOne = Human(firstName: "OrdinaryName", lastName: "OrdinaryLastName", age: 15, height: 170, weight: 60)
humanOne.age
humanOne.firstName
humanOne.lastName
humanOne.height
humanOne.weight

Human.counter.count

var humanTwo = Human(firstName: "LongName", lastName: "ShortLastName", age: 1, height: 70, weight: 8)

humanTwo.age
humanTwo.age = 0
humanTwo.age

humanTwo.firstName
humanTwo.firstName.count
humanTwo.firstName = "VeryVeryVeryVeryVeryVeryLongName"
humanTwo.lastName = "SN"
humanTwo.lastName
humanTwo.height = 20
humanTwo.height
humanTwo.weight = 5
humanTwo.weight

Human.counter.count
