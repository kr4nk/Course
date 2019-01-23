import Cocoa

var str = "Hello, Methods"


//1. Создайте тип Комната. У комнаты есть размеры W на H. И создайте тип Персонаж. У него есть координата в комнате X и Y. Реализуйте функцию, которая красивенько текстом будет показывать положение персонажа в комнате
//2. Персонажу добавьте метод идти, который принимает энумчик лево, право, верх, вниз
//Этот метод должен передвигать персонажа. Реализуйте правило что персонаж не должен покинуть пределы комнаты. Подвигайте персонажа и покажите это графически
//3. Создать тип Ящик. У ящика также есть координата в комнате X и Y. Ящик также не может покидать пределы комнаты и ящик также должен быть распечатан вместе с персонажем в функции печати.
//4. Теперь самое интересное, персонаж может двигать ящик, если он стоит на том месте, куда персонаж хочет попасть. Главное что ни один объект не может покинуть пределы комнаты. Подвигайте ящик :)
//5. Добавьте точку в комнате, куда надо ящик передвинуть и двигайте :)


struct Point {
    var x: Int
    var y: Int
}

struct Room {
    var width: Int
    var height: Int
    var char: Point
    var box: Point
    var target: Point
    
    enum Moving {
        case up
        case down
        case left
        case right
    }
    
    func showRoom() {
        
        var cell = String()
        
        for w in 1...width {
            cell = ""
            for h in 1...height {
                
                if char.x == h && char.y == w {
                    cell += " 😁"
                } else if box.x == h && box.y == w {
                    cell += " 🔳"
                } else if target.x == h && target.y == w {
                    cell += " 💢"
                } else {
                    cell += " ⬜️"
                }
            }
            print(cell)
        }
        print("\n")
    }
    
    mutating func moveChar(direction: Moving) {
        switch direction {
        case .up:
            if char.y != 1 { char.y -= 1 }
        case .down:
            if char.y < height { char.y += 1 }
        case .left:
            if char.x != 1 { char.x -= 1 }
        case .right:
            if char.x < width { char.x += 1 }
        }
        
        if char.x == box.x && char.y == box.y {
            _ = moveBox(direction: direction)
        }
    }
    
    mutating func moveBox(direction: Moving) -> Bool {
        switch direction {
        case .up:
            if box.y != 1 { box.y -= 1 }
        case .down:
            if box.y < height { box.y += 1 }
        case .left:
            if box.x != 1 { box.x -= 1 }
        case .right:
            if box.x < width { box.x += 1 }
        }
    
        if target.x == box.x && target.y == box.y {
            print("you win")
        }
        if Point(x: box.x, y: box.y).x == box.x && Point(x: box.x, y: box.y).y == box.y {
            return false
        }
        return true
    }
}

var test1 = Room(width: 6, height: 6, char: Point(x: 3, y: 3), box: Point(x: 3, y: 4), target: Point(x: 2, y: 2))
test1.showRoom()
test1.moveChar(direction: .down)
test1.moveChar(direction: .down)
test1.moveChar(direction: .down)
test1.moveChar(direction: .up)


test1.showRoom()
