//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
 
    var quizBrain = QuizBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUi()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
        let userAnswer = sender.currentTitle!
        
        let correctAnswer = quizBrain.checkAnswer(userAnswer)
        
        if correctAnswer {
            
            sender.backgroundColor = UIColor.green
            

            
        }else{
            
            sender.backgroundColor = UIColor.red
            
        }
        
        quizBrain.nextQuestion()
       
        
        Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(updateUi), userInfo: nil, repeats: true)
        //updateUi()
        
        
    }
    
    @objc func updateUi()
    {
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "score:\(quizBrain.getScore())"
        
    }
    
}

