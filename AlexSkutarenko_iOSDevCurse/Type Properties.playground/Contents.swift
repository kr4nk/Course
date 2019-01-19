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

enum color {
    case color
    
}


/*
3. Создайте класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавьте несколько свойств непосредственно этому классу чтобы контролировать:
- минимальный и максимальный возраст каждого объекта
- минимальную и максимальную длину имени и фамилии
- минимально возможный рост и вес
- самое интересное, создайте свойство, которое будет содержать количество созданных объектов этого класса
*/
