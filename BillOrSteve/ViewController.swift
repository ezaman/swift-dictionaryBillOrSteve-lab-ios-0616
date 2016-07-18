//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var faceLabel: UILabel!
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var stevePic: UIButton!
    @IBOutlet weak var billPic: UIButton!

//When you click on either button, it checks to see if the randomized text matches the values in the dictionary associated with either tech guru
 
    @IBAction func steve(sender: UIButton) {
        if person == "Steve Jobs" {
            counter += 1
            scoreCounter.text = String(counter)
        }
        showFact()
    }
    
    @IBAction func bill(sender: UIButton) {
        if person == "Bill Gates" {
            counter += 1
            scoreCounter.text = String(counter)
        }
        showFact()
    }
    
    
//global variables assigned in functions in order to easily call on them when buttons are tapped.
    var billAndSteve:[String : [String]] = [:]
    var person = String()
    var counter = 0
    
    func createFacts ()  {
        
            billAndSteve["Steve Jobs"] =
                ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
                "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
                "He was a pescetarian, meaning he ate no meat except for fish."]
            
            billAndSteve["Bill Gates"] =
                ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
                "He scored 1590 (out of 1600) on his SATs.",
                "His foundation spends more on global health each year than the United Nation's World Health Organization.",
                "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
                "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        
    }
    
//function randomizes facts from Bill and Steve dictionary. Returns a tuple of the person and random fact associated with that person
    func getRandomFact () -> (String, String)? {
        let person = randomPerson()
        if let facts = billAndSteve[randomPerson()] {
            let number = randomNumberFromZeroTo(facts.count)
            return (person, facts[number])
        }
        return nil
    }
//Displays the random fact in the texal label. Allows us to seperate the randomfact tuple by giving value to the global variables.
    func showFact() {
        if let randomFact = getRandomFact() {
            
            person = randomFact.0
            faceLabel.text = randomFact.1
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
    }

    func randomNumberFromZeroTo(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }

}


