import Cocoa

var str = "Hello, Enumerations"

//1. Создать энум с шахматными фигруами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур
//2. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.
enum Chess {
    case Piece(name: ChessPiece, color: Color, col: String, row: Int)
    
    enum ChessPiece: String {
        case King   = "King"
        case Queen  = "Queen"
        case Rook   = "Rook"
        case Bishop = "Bishop"
        case Knight = "Knight"
        case Pawn   = "Pawn"
    }
        
    enum Color: String {
            case black = "Black"
            case white = "White"
    }
}

var chessman1 = Chess.Piece(name: .King, color: .black, col: "H", row: 8)
var chessman2 = Chess.Piece(name: .Rook, color: .black, col: "E", row: 5)
var chessman3 = Chess.Piece(name: .King, color: .white, col: "G", row: 4)
var chessman4 = Chess.Piece(name: .Rook, color: .white, col: "C", row: 7)
var chessman5 = Chess.Piece(name: .Knight, color: .white, col: "F", row: 6)

var arabicMate = [chessman1, chessman2, chessman3, chessman4, chessman5]

func printChessMove(chessMove: Chess) {
    switch chessMove {
    case .Piece(let name, let color, let lett, let num):
        print("\(color) \(name) - \(lett)\(num)")
//    case .King(color: let color, position: (let col, let row)):
//        print("\(color) \(PieceNames.King), \(col, row)")
//    case .Rook(color: let color, position: (let col, let row)):
//        print("\(color) \(PieceNames.Rook), \(col, row)")
//    case .Queen(color: let color, position: (let col, let row)):
//        print("\(color) \(PieceNames.Queen), \(col, row)")
//    case .Bishop(color: let color, position: (let col, let row)):
//        print("\(color) \(PieceNames.Bishop), \(col, row)")
//    case .Pawn(color: let color, position: (let col, let row)):
//        print("\(color) \(PieceNames.Pawn), \(col, row)")
//    case .Knight(color: let color, position: (let col, let row)):
//        print("\(color) \(PieceNames.Knight), \(col, row)")
    }
}

func arrayToPrint(array: [Chess]) {
    for piece in array {
        printChessMove(chessMove: piece)
    }
}

arrayToPrint(array: arabicMate)

//3. Используя красивые юникодовые представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает)

func unicodeBoard (piece: Chess) -> String {
    let white = ["King": "♚", "Queen": "♛", "Bishop": "♝", "Knight":"♞", "Rook": "♜", "Pawn": "♟"]
    let black = ["King": "♔", "Queen": "♕", "Bishop": "♗", "Knight":"♘", "Rook": "♖", "Pawn": "♙"]
    
    switch piece {
    case .Piece(let name, let color, _, _):
        return color == .white ? white[name.rawValue]! : black[name.rawValue]!
    }
}

func printChessboard(chess: [Chess]) {
    let col = ["A", "B", "C", "D", "E", "F", "G", "H"]
    let bCell = "◼️"//\u{2b1b}"
    let wCell = "◽️"//\u{2b1c}"
    for row in 1...8 {
        var line = ""
        line += "\(9 - row) "
        for (index, column) in col.enumerated() {
            var isEmpty = true
            for piece in chess {
                switch piece {
                case .Piece(_, _, let l, let n) where l == column && n == (9 - row):
                    line.append(unicodeBoard(piece: piece))
                    isEmpty = false
                default:
                    break
                }
            }
            if isEmpty {
                (row + index) % 2 != 0 ? line.append(wCell) : line.append(bCell)
            }
        }
        print(line)
    }
    print("   A B C D E F G H")
}
printChessboard(chess: arabicMate)
    

//4. Создайте функцию, которая будет принимать шахматную фигуру и тюпл новой позиции. Эта функция должна передвигать фигуру на новую позицию, причем перемещение должно быть легальным: нельзя передвинуть фигуру за пределы поля и нельзя двигать фигуры так, как нельзя их двигать в реальных шахматах (для мегамонстров программирования). Вызовите эту функцию для нескольких фигур и распечатайте поле снова.

