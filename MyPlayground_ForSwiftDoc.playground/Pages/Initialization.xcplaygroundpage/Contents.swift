//: [Previous](@previous)

import Foundation

//var greeting = "Hello, playground"

/*
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
*/
struct Fahrenheit {
    var temperature = 32.0
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")


struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
print(boilingPointOfWater.temperatureInCelsius)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
print(freezingPointOfWater.temperatureInCelsius)
let bodyTemperature = Celsius(37.0)
print(bodyTemperature.temperatureInCelsius)


struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
print(magenta)
let halfGray = Color(white: 0.5)
print(halfGray)
//let veryGreen = Color(0.0, 1.0, 0.0)


class SurveyQuestion {
    let text: String//var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese."
print(cheeseQuestion.response!)

/*
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
*/
var item = ShoppingListItem()
print(item.quantity)

struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)
print(twoByTwo)
let hoge = Size()
print(hoge)
let zeroByTwo = Size(height: 2.0)
print(zeroByTwo.width, zeroByTwo.height)
let zeroByZero = Size()
print(zeroByZero.width, zeroByZero.height)


struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
let basicRect = Rect()
print(basicRect)
let originRect = Rect(origin: Point(x: 2.0, y: 2.0),
                      size: Size(width: 5.0, height: 5.0))
print(originRect)
let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))
print(centerRect)



class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}
let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")

class Bicycle: Vehicle {
    
    var hoge: String
    override init() {
        //super.init()
        hoge = "hogehoge"
        //numberOfWheels = 2
    }
}
let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")

class Hoverboard: Vehicle {
    var color: String
    init(color: String) {
        self.color = color
        //super.init()
        //numberOfWheels = 5
        // super.init() implicitly called here
    }
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}

let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")



class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}
let namedMeat = Food(name: "Bacon")
print(namedMeat.name)
let mysteryMeat = Food()
print(mysteryMeat.name)

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}
let oneMysteryItem = RecipeIngredient()
print(oneMysteryItem.name,oneMysteryItem.quantity)
let oneBacon = RecipeIngredient(name: "Bacon")
print(oneBacon.name,oneBacon.quantity)
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
print(sixEggs.name,sixEggs.quantity)



class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}



let wholeNumber: Double = 12345.0
let pi = 3.14159

if let valueMaintained = Int(exactly: wholeNumber) {
    print("\(wholeNumber) conversion to Int maintains value of \(valueMaintained)")
}
let valueChanged = Int(exactly: pi)
//print(valueChanged!)
if valueChanged == nil {
    print("\(pi) conversion to Int doesn't maintain value")
}



struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}
let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}
let anonymousCreature = Animal(species: "")
if anonymousCreature == nil {
    print("The anonymous creature couldn't be initialized")
}

enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}
let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("This isn't a defined temperature unit, so initialization failed.")
}

enum TemperatureUnithoge: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}

let fahrenheitUnithoge = TemperatureUnithoge(rawValue: "F")
if fahrenheitUnithoge != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}
let unknownUnithoge = TemperatureUnithoge(rawValue: "X")
if unknownUnithoge == nil {
    print("This isn't a defined temperature unit, so initialization failed.")
}



class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}
if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zero shirts")
}
if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize one unnamed product")
}


class Document {
    var name: String?
    // this initializer creates a document with a nil name value
    init() {}
    // this initializer creates a document with a nonempty name value
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}
class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}
class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}


class SomeClass {
    required init() {
        // initializer implementation goes here
    }
}
class SomeSubclass: SomeClass {
    required init() {
        // subclass implementation of the required initializer goes here
    }
}

class OtherClass: SomeSubclass {
    required init() {
        print("hoge")
    }
}


struct Chessboard {
    let boardColors: [Bool] = {
        var temporaryBoard: [Bool] = []
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}
let board = Chessboard()
print(board.squareIsBlackAt(row: 0, column: 1))
print(board.squareIsBlackAt(row: 7, column: 7))


//: [Next](@next)

