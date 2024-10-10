//
//  main.swift
//  WordleCL2
//
//  Created by Marcus Westbrooks on 9/30/24.
//

import Foundation

//Must find 5 letter word
///If wrong letter and letter is not in word, give it red
///If wrong letter and letter is just in wrong place, give it Yellow
///If right letter in right place, give it Green

let red = "\u{001B}[31m"
let green = "\u{001B}[32m"
let yellow = "\u{001B}[33m"
let blue = "\u{001B}[34m"
let reset = "\u{001B}[0m"


let fiveLetterWords = ["apple", "brick", "chair", "dance", "eagle", "flame", "grain", "horse", "jelly", "knife", "lemon", "magic", "novel", "ocean", "peach", "quiet", "razor", "shine", "tiger", "unity", "adore", "angle", "beach", "blend", "bliss", "bloom", "boost", "breeze", "bride", "brush", "burst", "carry", "catch", "cease", "charm", "claim", "clash", "climb", "clown", "couch", "crane", "craze", "cream", "creep", "crown", "curve", "dealt", "doubt", "draft", "drift", "elbow", "enter", "faint", "ferry", "fiber", "flock", "focus", "forge", "frame", "gauge", "giant", "glare", "glide", "grape", "grasp", "grill", "grove", "habit", "hatch", "haven", "hinge", "hover", "icing", "index", "input", "irony", "jolly", "latch", "liver", "lobby", "lodge", "loyal", "march", "medal", "merit", "meter", "might", "mirth", "mixer", "model", "motel", "motto", "noble", "orbit", "panel", "parry", "pause", "phase", "plush", "pride", "prize", "quilt", "reach", "rebel", "reign", "renew", "rigid", "river", "roast", "scent", "scout", "shear", "shelf", "shift", "slide", "spine", "spoon", "stack", "stalk", "stare", "straw", "stunt", "swirl", "toast",
    "track", "trail", "vivid", "whale", "wrath", "yield"]





var alphaArr = [["a", "b", "c", "d", "e"], ["f", "g", "h", "i", "j", ],["k", "l", "m", "n", "o",], ["p", "q", "r", "s", "t",],  ["u", "v", "w", "x", "y", "z"]]

var usedChar:Set<String> = []


var gameBoard:[[String]] = []

func printBoard() {
    for piece in gameBoard {
        var rowString = ""
        for char in piece {
            
            rowString+=char
        }
        
        print(rowString)
    }
    
}



func printKeys() {
    
    for block in alphaArr {
        
        var rowString = ""
        
        for char in block {
            
            if usedChar.contains(char) {
                
                rowString += red + char + reset
            }
            
            else {
                
                rowString += char
            }
            
            
        }
        
        print(rowString)
        
    }
    
}

var gameOver = false
var answerWord = "apple"
var userInput = ""
var NumOfTries = 0

let random = Int.random(in: 0...fiveLetterWords.count)

answerWord = fiveLetterWords[random]





while NumOfTries < 6 {
    
    if NumOfTries == 5 {
        print()
        print("Aww, you ran out of guesses! The word was \(answerWord)  Game Oooooovvvveerrrrrr")
        break
        
    }
    
    print()
    print("Guess the 5 letter word")
    
    print()
    print("Available Letters in white")
    print()
    printKeys()
    
    print()
    //Take the users guess
    if var guess = readLine() {
        print("Your guess was \(blue)\(guess)\(reset)")
        
        print()
        
        if guess.count < 5 {
            
       let num = 5 - guess.count
            
            for _ in 0..<num {
                
                guess+="."
            }
        
        }
        userInput = guess
        let startIndex = userInput.startIndex
        let endIndex = userInput.index(startIndex, offsetBy: 4)
        let substring = userInput[startIndex...endIndex]
        userInput = String(substring)
        var stringsArray = userInput.split(separator: "").map{String($0)}
        
        gameBoard.append(stringsArray)
        
        print()
        
        printBoard()
        
        print()
    }
    
    
    if userInput == answerWord {
       
        print("Congratulations!  You've guessed the word!")
        break
    }
    
    else {
        //Do user input to answerWord comparison,Converting strings to arrays
    let inputArray = Array(userInput)
    let answerArray = Array(answerWord)
        
        inputArray.enumerated().forEach { (index, name) in
            
            usedChar.insert(String(name))
            
            //If characters match
            if inputArray[index] == answerArray[index] {
                
                print()
                print("\(green)\(name)\(reset)")
                print("Correct letter in correct place")
                print()
            }
            
            else if
            
                //If characters don't match but character is found in word
             inputArray[index] != answerArray[index]  && answerArray.contains(name) == true {
                print()
                print("\(yellow)\(name)\(reset)")
                print("\(name) is found in word but in the wrong space")
                print()
                
            } else {
                print()
                print("\(red)\(name)\(reset)")
                print("Letter is not found in word")
                print()
            }
        }
        NumOfTries += 1
    }
}





