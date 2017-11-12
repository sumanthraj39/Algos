//: Playground - noun: a place where people can play

import UIKit

extension String {

    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
}
// Works only till n == 4 0 - 9999
func numberToWords(amount: String) -> String {
    
    var ones = ["0":"zero","1":" one", "2":" two", "3":" three", "4":" four", "5":" five", "6":" six", "7":" seven", "8":" eight", "9":" nine"]
    var twoDigits = ["10":" ten", "11":" eleven", "12":" twelve", "13":" thirteen", "14":" fourteen", "15":" fifteen", "16":" sixteen", "17":" seventeen", "18":" eighteen", "19":" nineteen"]
    var tens = ["20":" twenty", "30":" thirty", "40":" forty", "50":" fifty", "60":" sixty", "70":"  seventy", "80":" eighty", "90":" ninty"]
    var thirdDigit = [" hundred", " thousand"]
    
    if amount.characters.count < 0 {
        return ""
    }
    
    if amount.characters.count == 1 {
        return ones[amount[0]]!
    }
    var n = amount.characters.count
    var i = 0
    var resultString = ""
    
    while i < amount.characters.count - 1 {
        
        if (n >= 3) {
            if (amount[i] != "0") {
            resultString += ones[amount[i]]!
            resultString += ((n == 4) ? thirdDigit[1] : thirdDigit[0])
            }
            n -= 1
            
        }
        else {
            
            if amount[i] == "1" {
               let val =  amount[i] + amount[i + 1]
                resultString += twoDigits[val]!
            }
            else if (amount[i] != "0"){
                let val = Int(amount[i] + amount[i+1])!
                let remainder = Int(val) % 10
                let tens_unit = val - remainder
                resultString += tens[String(tens_unit)]!
                if remainder > 0 {
                    resultString += ones[String(remainder)]!
                }
            }
        }
        i += 1
    }
    
    return resultString
}

print(numberToWords(amount: "0"))

