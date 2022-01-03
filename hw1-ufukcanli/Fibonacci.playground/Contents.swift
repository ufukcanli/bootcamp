import Foundation

func printFibonacciNumbers(between min: Int, and max: Int) {
    var num1 = 1
    var num2 = 1
    var aux = num1 + num2
    
    while aux < min {
        num1 = num2
        num2 = aux
        aux = num1 + num2
    }
    
    while aux <= max {
        print(aux, terminator: " ")
        num1 = num2
        num2 = aux
        aux = num1 + num2
    }
}

printFibonacciNumbers(between: 750, and: 1000)
