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
    struct BirthDate {
        var dayBirth: Int
        var monthBirth: Int
        var yearBirth: Int
    }
//   var age: Int {
        
   // }
    
    
}


print(Calendar.current.component(.day, from: Date()))
print(Calendar.current.component(.month, from: Date()))
print(Calendar.current.component(.year, from: Date()))
print(Calendar.current.component(.hour, from: Date()))

//Date.timeIntervalSince(Date())
