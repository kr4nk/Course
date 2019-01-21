import Cocoa

var str = "Hello, Methods"


//1. Создайте тип Комната. У комнаты есть размеры W на H. И создайте тип Персонаж. У него есть координата в комнате X и Y. Реализуйте функцию, которая красивенько текстом будет показывать положение персонажа в комнате

struct Point {
    var x: Int
    var y: Int
}

struct Room {
    var width: Int
    var height: Int
    var char: Point
    
    enum Moving {
        case forward
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
                } else {
                    cell += " ⬜️"
                }
            }
            print(cell)
        }
    }
    
    mutating func moveChar(movingEnum: Moving) {
        
        switch movingEnum {
        case .forward:
            char.y -= 1
        case .down:
            if char.y < height {
                char.y += 1
            }
        case .left:
            char.x -= 1
        case .right:
            if char.x < width {
            char.x += 1
            }
        }
    }
}

var test1 = Room(width: 6, height: 6, char: Point(x: 3, y: 3))
test1.showRoom()
test1.moveChar(movingEnum: .forward)
test1.showRoom()
test1.moveChar(movingEnum: .forward)
test1.showRoom()


//2. Персонажу добавьте метод идти, который принимает энумчик лево, право, верх, вниз
//Этот метод должен передвигать персонажа. Реализуйте правило что персонаж не должен покинуть пределы комнаты. Подвигайте персонажа и покажите это графически




//3. Создать тип Ящик. У ящика также есть координата в комнате X и Y. Ящик также не может покидать пределы комнаты и ящик также должен быть распечатан вместе с персонажем в функции печати.




//4. Теперь самое интересное, персонаж может двигать ящик, если он стоит на том месте, куда персонаж хочет попасть. Главное что ни один объект не может покинуть пределы комнаты. Подвигайте ящик :)




//5. Добавьте точку в комнате, куда надо ящик передвинуть и двигайте :)




//Для суперменов: можете добавить массив ящиков и можете сделать консольное приложение
