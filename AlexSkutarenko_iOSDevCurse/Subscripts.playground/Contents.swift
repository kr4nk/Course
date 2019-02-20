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

struct Chessboard {
    
    enum Color: String {
        case white = "White", black = "Black"
    }
    
    var board = [String: String]()
    
    func keyForCell(column: String, andRow row: Int) -> String {
        return column + String(row)
    }
    
    init(array: [String]) {
        let count = array.count
        for letter in 1...count {
            for figure in 1...count {
                board[keyForCell(column:array[letter - 1], andRow: figure)] = (letter + figure) % 2 == 0 ? Color.black.rawValue : Color.white.rawValue
            }
        }
    }
    
    subscript(column: String, row: Int) -> String? {
        return board[keyForCell(column: column, andRow: row)]
    }
}

let array8 = ["a", "b", "c", "d", "f", "g", "h"]

let chessbrd = Chessboard(array: array8)

chessbrd["b", 2]
chessbrd["a", 1]
chessbrd["c", 6]
chessbrd["c", 9]

//Крестики нолики (Средний уровень)
//1. Создать тип, представляющий собой поле для игры в крестики нолики
//На каждой клетке может быть только одно из значений: Пусто, Крестик, Нолик
//Добавьте возможность красиво распечатывать поле
//2. Добавьте сабскрипт, который устанавливает значение клетки по ряду и столбцу,
//причем вы должны следить за тем, чтобы программа не падала если будет введен не существующий ряд или столбец.
//3. Также следите за тем, чтобы нельзя было устанавливать крестик либо нолик туда, где они уже что-то есть. Добавьте метод очистки поля.

struct TicTacToe {
    
    let rows: Int
    let col: Int
    var cells: [[Icons]]
    
    enum Icons: String {
        case x = " ❌"
        case o = " ⭕️"
        case empty = " ⬜️"
    }
    
    init(rows: Int, col: Int) {
        self.rows = rows
        self.col = col
        cells = [Array](repeating: Array(repeating: Icons.empty, count: col), count: rows)
    }
    
    func fieldPrint() {
        for line in cells {
            for row in line {
                print(terminator: "")
                switch row {
                case Icons.empty: print(Icons.empty.rawValue, terminator: "")
                case Icons.x: print(Icons.x.rawValue, terminator: "")
                case Icons.o: print(Icons.o.rawValue, terminator: "")
                }
            }
            print()
        }
        print("\n")
    }
    
    mutating func fieldClean() {
        cells = [Array](repeating: Array(repeating: Icons.empty, count: col), count: rows)
        fieldPrint()
    }
    
    subscript(x: Int, y: Int) -> Icons {
        get {
            return cells[x - 1][y - 1]
        }
        
        set {
            if cells[x - 1][y - 1] == Icons.empty && 1...rows ~= x && 1...col ~= y {
                cells[x - 1][y - 1] = newValue
                fieldPrint()
            }
        }
    }
}

var player = TicTacToe(rows: 3, col: 3)

player[2, 2] = .x
player[2, 3] = .o
player[1, 2] = .x
player[3, 1] = .o
player[3, 2] = .x


//4. Если хотите, добавте алгоритм, который вычислит победителя
