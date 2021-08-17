//
//  main.swift
//  01_可选链
//
//  Created by XFB on 2021/8/17.
//

// 可选链 Optional Chaining
class Car { var price = 0 }
class Dog { var weight = 0 }
class Person {
    var name: String = ""
    var dog: Dog = Dog()
    var car: Car? = Car()
    func age() -> Int { 18 }
    func eat() { print("Person eat!!!") }
    subscript(index: Int) -> Int { index }
}

var person: Person? = Person()
//var age1 = person!.age()
//var age2 = person?.age()
//var name = person?.name
//var index = person?[6]
//func getName() -> String { "Jack" }
//person?.name = getName()

if let age = person?.age() {
    print("调用age成功", age)
} else {
    print("调用age失败")
}


var scores = [
    "Jack": [88, 87, 86],
    "James": [90, 98, 95]
]
var score = scores["Jack"]
score?[0] = 100

scores["Jack"]?[0] = 100
scores["Jordan"]?[2] += 100


var num1: Int? = 5
num1? = 10

var num2: Int? = nil
// num2 == nil 后面的赋值操作没有意义
// num2 依然是nil
num2? = 10


// 语法糖
var dic: [String : (Int, Int) -> Int] = [
    "sum" : (+),
    "difference" : (-)
]
var result = dic["sum"]?(10, 20)
print(result) // Optional(30)

// 如果可选项为nil，调用方法、下标、属性失败，结果为nil
// 如果可选项不为nil，调用方法、下标、属性成功，结果会被包装成可选项
// 如果结果本来是可选项，不会进行再次包装


