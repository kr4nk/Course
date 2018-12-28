import Cocoa

var str = "Hello, Enumerations"

//1. Создать энум с шахматными фигруами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур

enum ChessPiece {
    case King(color:Color, position: (String, Int))
    case Queen(color:Color, position: (String, Int))
    case Rook(color:Color, position: (String, Int))
    case Bishop(color:Color, position: (String, Int))
    case Knight(color:Color, position: (String, Int))
    case Pawn(color:Color, position: (String, Int))

    enum Color: String {
        case black = "Black"
        case white = "White"
    }
}

var chessman1 = ChessPiece.King(color: .black, position: ("H",8))
var chessman2 = ChessPiece.Rook(color: .black, position: ("E",5))
var chessman3 = ChessPiece.King(color: .white, position: ("G",4))
var chessman4 = ChessPiece.Rook(color: .white, position: ("C",7))
var chessman5 = ChessPiece.Knight(color: .white, position: ("F",6))

var arabicMate = [chessman1, chessman2, chessman3, chessman4, chessman5]



//2. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.

enum PieceNames: String {
    case King = "King"
    case Queen = "Queen"
    case Rook = "Rook"
    case Bishop = "Bishop"
    case Knight = "Knight"
    case Pawn = "Pawn"
}

func printChessMove(chessMove: ChessPiece) {
    switch chessMove {
    case .King(color: let color, position: (let col, let row)): print("\(color) \(PieceNames.King), \(col, row)")
    case .Rook(color: let color, position: (let col, let row)): print("\(color) \(PieceNames.Rook), \(col, row)")
    case .Queen(color: let color, position: (let col, let row)): print("\(color) \(PieceNames.Queen), \(col, row)")
    case .Bishop(color: let color, position: (let col, let row)): print("\(color) \(PieceNames.Bishop), \(col, row)")
    case .Pawn(color: let color, position: (let col, let row)): print("\(color) \(PieceNames.Pawn), \(col, row)")
    case .Knight(color: let color, position: (let col, let row)): print("\(color) \(PieceNames.Knight), \(col, row)")
    }
}

func arrayToPrint(array: [ChessPiece]) {
    for piece in array {
        printChessMove(chessMove: piece)
    }
}

arrayToPrint(array: arabicMate)

//3. Используя красивые юникодовые представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает)



//4. Создайте функцию, которая будет принимать шахматную фигуру и тюпл новой позиции. Эта функция должна передвигать фигуру на новую позицию, причем перемещение должно быть легальным: нельзя передвинуть фигуру за пределы поля и нельзя двигать фигуры так, как нельзя их двигать в реальных шахматах (для мегамонстров программирования). Вызовите эту функцию для нескольких фигур и распечатайте поле снова.
