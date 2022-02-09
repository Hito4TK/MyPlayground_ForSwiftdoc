//: [Previous](@previous)

import Foundation
import CoreGraphics

var greeting = "Hello, playground"

struct SampleViewModel {
    var fuga: String
    var nbnb: Int
}

class SampleViewController {
    private var hoge:String = "hogehoge" {
        didSet {
            print(hoge)
        }
    }
    
    var viewModel: SampleViewModel = SampleViewModel(fuga: "fugahoge",nbnb: 123) {
        didSet {
            print("called didSet so printing \(viewModel.fuga) and \(viewModel.nbnb) and \(hoge)")
            setHoge()
        }
    }
    
    func setHoge() {
        hoge = viewModel.fuga
    }
}

//var aaa = SampleViewModel(fuga: "fugafuga")
//print(aaa.fuga)

var svc = SampleViewController()

svc.viewModel.fuga = "asdfasdf"
svc.viewModel.nbnb = 456
//: [Next](@next)
