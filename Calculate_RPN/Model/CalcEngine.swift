
class CaclEngine {
 
    var current = [String]()
    var operandStack = [String]()
    var result = [String]()
    var priority: Int = 0
    
    func ExpressionToRPN(ex: String) -> [String] {
        let rpn = ex.components(separatedBy: " ")
        for item in rpn {
            priority = check(char: item)
            if priority == 0 {
                current.append(String(item))
            }
            if priority == 1 {
                operandStack.append(String(item))
            }
            if priority > 1 {

                while !operandStack.isEmpty {
                    if check(char:operandStack.last!) >= priority {
                        current.append(operandStack.popLast() ?? "error")
                    
                    } else {
                        break
                        
                    }
                }
                operandStack.append(String(item))
            }
            
            if priority == -1 {
                
                while (check(char: operandStack.popLast() ?? "") != 1 ) {
                    current.append(operandStack.popLast() ?? "error")
                }
                operandStack.removeLast()
            }
        }
        while !operandStack.isEmpty {
            
            current.append(operandStack.popLast() ?? "")
        }

        return current
    }
    private func check(char: String) -> Int {
        if char == "*" || char == "/" {
            return 3
        } else if char == "+" || char == "-" {
            return 2
        } else if char == "(" {
            return 1
        } else if char == ")" {
            return -1
        } else {
            return 0
        }
    }

    func RPN(result: [String]) -> Double {
        operandStack.removeAll()
        for item in result {
            if (Double(item) != nil) {
                operandStack.append(item)
            } else {
                let y = Double(operandStack.popLast() ?? "error") ?? 0.0
                let x = Double(operandStack.popLast() ?? "error") ?? 0.0
                
                switch item {
                case "+":
                        let res: Double = x + y
                   
                    operandStack.append(String(res))
                    print(x,item, y)
                 
                        
                case "-":
                    let res: Double = x - y
                    operandStack.append(String(res))
               
                  
                case "*":
                    let res: Double = x * y
                   
                    operandStack.append(String(res))
            
                    
                case "/":
                    let res: Double = x / y
                    operandStack.append(String(res))
                    
                    
                default:
                    break
                    
                }
            }
        }
        return Double(operandStack.popLast() ?? "") ?? 0.0
    }

    
}
