import Cocoa

var str = "Hello, Subscripts"

struct Family {
    var father = "Daddy"
    var mother = "Mommy"
    var kids = ["Kid1", "Kid2", "Kid3"]
    
    var count: Int {
        return 2 + kids.count
    }
    
    subscript(index: Int) -> String? {
        get {
            switch(index) {
            case 0: return father
            case 1: return mother
            case 2..<(2 + kids.count): return kids[index - 2]
            default:
                return nil
            }
        }
        set {
            let value = newValue ?? ""
            
            switch(index) {
            case 0: return father = value
            case 1: return mother = value
            case 2..<(2 + kids.count): kids[index - 2] =
                value
            default: break
            }
        }
    }
    subscript(index: Int, suffix: String) -> String? {
        var name = self[index] ?? ""
        name += " " + suffix
        return name
    }
    
}


var family = Family()
family.father
family.kids[1]
family[0]
family[2]
family[4, "the youngest"]


struct Field {
    
    var dict = [String: String]()
    
    func keyForColumn(column: String, andRow row: Int) -> String {
        return column + String(row) + "a"
    }
    
    subscript(column: String, row: Int) -> String? {
        get {
            return dict[keyForColumn(column: column, andRow: row)]
        }
        set {
            dict[keyForColumn(column: column, andRow: row)] = newValue
        }
    }
}

var field = Field()

field["a", 1]
field["a", 1] = "F"
field["a", 1]

//1. Создайте тип шахматная доска.
//2. Добавьте сабскрипт, который выдает цвет клетки по координате клетки (буква и цифра).
//3. Если юзер ошибся координатами - выдавайте нил
//Крестики нолики (Средний уровень)
//1. Создать тип, представляющий собой поле для игры в крестики нолики
//На каждой клетке может быть только одно из значений: Пусто, Крестик, Нолик
//Добавьте возможность красиво распечатывать поле
//2. Добавьте сабскрипт, который устанавливает значение клетки по ряду и столбцу,
//причем вы должны следить за тем, чтобы программа не падала если будет введен не существующий ряд или столбец.
//3. Также следите за тем, чтобы нельзя было устанавливать крестик либо нолик туда, где они уже что-то есть. Добавьте метод очистки поля.
//4. Если хотите, добавте алгоритм, который вычислит победителя
