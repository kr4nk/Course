import Cocoa

var str = "Hello, properties"

/////
/// Stored Properties & Computed Properties
/////

struct Student {
    var firstName: String {
        
        willSet(newFirstName) {
            print("will set " + newFirstName + " instead of " + firstName)
        }
        didSet {
            print("will set " + firstName + " instead of " + oldValue)
            
            firstName = firstName.capitalized
        }
    }
    
    var lastName: String {
        
        didSet {
            lastName = lastName.capitalized
        }
        
    }
    
    var fullName: String {
        
        get {
            return firstName + " " + lastName
        }
        set {
            print("Full name wants to be set to " + newValue)
            
            let words = newValue.components(separatedBy: " ")
            
            if words.count > 0 {
                firstName = words[0]
            }
            
            if words.count > 1 {
                lastName = words[1]
            }
        }
    }
}

var student = Student(firstName: "Evgeny", lastName: "Kirichenko")

student.firstName
student.lastName
student.fullName

student.firstName = "Fred"

student.firstName

student.firstName = "greg"

student.fullName

student.fullName = "Serg Bobov"
student.fullName
//===============================
/*
 2. Добавить студенту property «Дата рождения» (пусть это будет еще одна структура, содержащая день, месяц, год) и два computed property: первое — вычисляющее его возраст, второе — вычисляющее, сколько лет он учился (считать, что он учился в школе с 6 лет, если студенту меньше 6 лет — возвращать 0)
*/
let date = Date()
let currentYear = Calendar.current.component(.year, from: date)
let currentMonth = Calendar.current.component(.month, from: date)
let currentDay = Calendar.current.component(.day, from: date)

struct Student2 {
    var firstName: String
    var lastName: String
    var fullName: String {
        get {
            return firstName + " " + lastName
        }
        set {
            print("Full name wants to be set to " + newValue)
            
            let words = newValue.components(separatedBy: " ")
            
            if words.count > 0 {
                firstName = words[0]
            }
            
            if words.count > 1 {
                lastName = words[1]
            }
        }
    }
    
    var birthDate: BirthDate
    
    struct BirthDate {
        var dayBirth: Int
        var monthBirth: Int
        var yearBirth: Int
        
        var age: Int {
            get {
                return currentYear - yearBirth
            }
        }
        
        var yearsStudy: Int {
            get {
                return age > 6 ? age - 6 : 0
            }
        }
    }
}

var student2 = Student2(firstName: "Max", lastName: "Black", birthDate: Student2.BirthDate.init(dayBirth: 1, monthBirth: 10, yearBirth: 1989))

print("\nStudent \nName: \(student2.fullName), \nAge:\(student2.birthDate.age),\nYears study:\(student2.birthDate.yearsStudy)")

//print(Calendar.current.component(.day, from: Date()))
//print(Calendar.current.component(.month, from: Date()))
//print(Calendar.current.component(.year, from: Date()))
//print(Calendar.current.component(.hour, from: Date()))


//3. Создать структуру «Отрезок», содержащую две внутренние структуры «Точки». Структуру «Точка» создать самостоятельно, несмотря на уже имеющуюся в Swift’е. Таким образом, структура «Отрезок» содержит две структуры «Точки» — точки A и B (stored properties). Добавить два computed properties: « середина отрезка» и «длина» (считать математическими функциями)

struct Section {
    struct Point {
        var x, y: Double
    }
    
    var a, b: Point
    var midSection: Point {
        get {
            let midX = (a.x + b.x)/2
            let midY = (a.y + b.y)/2
            return Point(x: midX, y: midY)
        }
        set {
            a.x += newValue.x - midSection.x
            a.y += newValue.y - midSection.y
            b.x += newValue.x - midSection.x
            b.y += newValue.y - midSection.y
        }
    }
    var lenghtSection: Double {
        get {
            if a.x != b.x && a.y != b.y {
                return sqrt(pow(b.x - a.x, 2) + pow(b.y - a.y, 2))
            }
            if a.x == b.x {
                return b.y - a.y
            }
            return b.x - a.x
        }
        set {
            //TODO: make setter
        }
    }
}

var triang = Section(a: Section.Point(x: 0, y: 0), b: Section.Point(x: 5, y: 10))

print(triang.midSection)
print(triang.lenghtSection)

//4. При изменении середины отрезка должно меняться положение точек A и B. При изменении длины, меняется положение точки B
triang.midSection = Section.Point(x: 3, y: 3)
print(triang.a)
print(triang.b)

triang.lenghtSection = 14.0

//3. Создать структуру "отрезок", у которой два свойства - точка "А" и точка "В", которые в свою очередь тоже структуры (не стандартные, а наши собственные)
//Также отрезок имеет вычисляемые свойства (они изменяют точки "А" и "В", если мы изменяем следующие свойства):
//-midPoint - середина отрезка (при её изменении, отрезок смещается на параллельную прямую, проходящую через наш midPoint?)
//-длина отрезка (при изменении, точка "А" остается, а точка "В" движется)
