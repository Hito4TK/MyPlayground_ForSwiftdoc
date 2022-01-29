//: [Previous](@previous)


let names = ["Anna", "Alex", "Brian", "Jack"]

for name in names{
    print("Hello, \(name)!")
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animal,leg) in numberOfLegs {
    print("\(animal)s have \(leg) legs.")
}

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}


let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")


let minutes = 60
for tickMark in 0..<minutes {
    //print("\(tickMark)")
    // render the tick mark each minute (60 times)
}
let minuteInterval = 5
for tick in stride(from: 0, to: minutes, by: minuteInterval){
    print("\(tick)")
}



let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0
while square < finalSquare {
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // move by the rolled amount
    square += diceRoll
    if square < board.count {
        // if we're still on the board, move up or down for a snake or a ladder
        square += board[square]
        print(square)
    }
}
print("Game over!")
print(board[03])

//: [Next](@next)
