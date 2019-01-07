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

