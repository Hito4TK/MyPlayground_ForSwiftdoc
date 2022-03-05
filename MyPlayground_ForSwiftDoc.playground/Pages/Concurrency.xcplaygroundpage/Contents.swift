//: [Previous](@previous)

import Foundation
import _Concurrency

var greeting = "Hello, playground"


func listPhotos(inGallery name: String) async throws -> [String] {
    try await Task.sleep(nanoseconds: 2 * 1_000_000_000)  // Two seconds
    return ["IMG001", "IMG99", "IMG0404", name]
}

func downloadPhoto(named namedesu: String) async throws -> String {
    try await Task.sleep(nanoseconds: 2 * 1_000_000_000)  // Two seconds
    return namedesu
}
Task {
    let photoNames = try await listPhotos(inGallery: "Summer Vacation")
    print("\(photoNames)")
    let sortedNames = photoNames.sorted()
    let name = sortedNames[0]
    let photo = try await downloadPhoto(named: name)
    print(photo)
    
    
    //let handle = FileHandle.standardInt
    /*
    for try await line in photoNames {
        print(line)
    }
    */
    
}

struct Countdown: Sequence, IteratorProtocol {
    var count: Int

    mutating func next() -> Int? {
        if count == 0 {
            return nil
        } else {
            defer { count -= 1 }
            return count
        }
    }
}


/*
class TryThis {
    func getSomethingLater(_ number: Double) async throws -> String {
        // test - sleep for 3 seconds, then return
        Thread.sleep(forTimeInterval: 3)
        print("hoge")
        try await Task.sleep(nanoseconds: 2 * 1_000_000_000)// Two seconds
        print("puga")
        return String(format: ">>>%8.2f<<<", number)
    }
}

let tryThis = TryThis()

Task { () -> Void in
    let result = try await tryThis.getSomethingLater(3.141592653589793238462)
    print("result: \(result)")
}
*/

//: [Next](@next)
