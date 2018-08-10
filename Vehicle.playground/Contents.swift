//: Playground - noun: a place where people can play

import UIKit

//MARK: Protocols:
protocol Vehicle{
    var type: String { get }
    var speed: Double { get }
    var duration : Double { get }
}

protocol HasWindows{
    var windows: Int { get }
}

protocol HasWheels{
    var wheels: Int { get }
}

protocol HasCapacity{
    var capacity: Int { get }
}

protocol HasLength{
    var length: Int { get }
}

//MARK: Protocol Composition


protocol isACar: Vehicle, HasWheels, HasWindows{
    
}

protocol isABus: isACar, HasCapacity{
    
}

protocol isAShip: Vehicle, HasLength{
    
}

protocol isAMotorcycle: Vehicle, HasWheels{
    
}

//MARK: Typealiases:
//typealias IsACar = Vehicle & HasWindows & HasWheels
//typealias IsABus = IsACar & HasCapacity
//typealias IsAShip = Vehicle & HasLength
//typealias IsAMotorcycle = Vehicle & HasWheels

//MARK: Structures:

class Car: isACar{
    let type: String
    let speed: Double
    let windows: Int
    let wheels: Int
    
    init() {
        self.type = "Car"
        self.speed = 100.0 //in km/h
        self.windows = 6
        self.wheels = 4
    }
    
    init(type: String, speed: Double, windows: Int, wheels: Int) {
        self.type = type
        self.speed = speed
        self.windows = windows
        self.wheels = wheels
    }
    
    var duration: Double{
        return ( 50.0 / self.speed )*60
    }
    
}

class Bus: isABus{
    let type: String
    let speed: Double
    let wheels: Int
    let windows: Int
    let capacity: Int
    
    init(type: String,speed: Double, wheels: Int, windows: Int, capacity: Int) {
        self.type = type
        self.speed = speed
        self.wheels = wheels
        self.windows = windows
        self.capacity = capacity
    }
    
    init(){
        self.type = "Bus"
        self.speed = 80.0 //in km/h
        self.wheels = 6
        self.windows = 12
        self.capacity = 20
    }
    
    var duration: Double{
        return ( 50.0 / self.speed )*60
    }
}

class ContainterShip: isAShip{
    let type: String
    let speed: Double
    let length: Int

    init(type: String, speed: Double, length: Int) {
        self.type = type
        self.speed = speed
        self.length = length
    }
    
    init(){
        self.type = "Containter Ship"
        self.speed = 55.0 //in km/h
        self.length = 550 //in meters
    }
    
    var duration: Double{
        return ( 50.0 / self.speed )*60
    }
}

class Boat: isAShip{
    let type: String
    let speed: Double
    let length: Int
    
    init(type: String,speed: Double, length: Int) {
        self.type = type
        self.speed = speed
        self.length = length
    }
    
    init(){
        self.type = "Boat"
        self.speed = 80.0
        self.length = 350
    }
    
    var duration: Double{
        return ( 50.0 / self.speed )*60
    }
}

class Motorcycle: isAMotorcycle{
    let type: String
    let speed: Double
    let wheels: Int
    
    init(type: String, speed: Double, wheels: Int) {
        self.type = type
        self.speed = speed
        self.wheels = wheels
    }

    init(){
        self.type = "Motorcycle"
        self.speed = 130.0 //in km/h
        self.wheels = 2
    }

    var duration: Double{
        return ( 50.0 / self.speed )*60
    }
}

//MARK: Creating objects

let Lambo = Car()
print(Lambo.duration)

let Masa = Car(type: "Masarati", speed: 250, windows: 6, wheels: 4)
print("Duration: \(Masa.duration)")
Masa.type

let School = Bus()
School.duration

let FEDEX = ContainterShip()
print(round(FEDEX.duration))

let Myrel = Boat()
print(round(Myrel.duration))

let Davidson = Motorcycle()
print(round(Davidson.duration))


let benz = Car(type: "Benz", speed: 200, windows: 4, wheels: 4)
print(benz.duration)
