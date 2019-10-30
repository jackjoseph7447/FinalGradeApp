//
//  ViewController.swift
//  FinalGradeApp
//
//  Created by  on 3/11/19.
//  Copyright © 2019 Jack'sApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var qOneGrade: UITextField!
    @IBOutlet weak var qTwoGrade: UITextField!
    @IBOutlet weak var desiredGrade: UITextField!
    @IBOutlet weak var finalGrade: UILabel!
    @IBOutlet weak var indicateText: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var midtermGrade: UITextField!
    //@IBOutlet weak var weightOfMidterm: UISegmentedControl!
    @IBOutlet weak var finalWeight: UITextField!
    @IBOutlet weak var weightMidterm: UITextField!
    
    
    var Q1 : Double = 0
    var Q2 : Double = 0
    var Dgrade : Double = 0
    var midtermWeightPercent : Double = 0
    var finalWeightPercent : Double = 0
    
    
    
    @IBAction func calculateButton(_ sender: Any)
    {
     
        if desiredGrade.text == ""
        {
           errorWarning()
        }
        else
        {
            calculateGrades()
        }
        
        
        
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl)
    {

        switch sender.selectedSegmentIndex
        {
        case 0:
            defaultA()
        case 1:
            defaultB()
        case 2:
            defaultC()
        case 3:
            defaultD()
        case 4:
            defaultF()
        default:
            break
        }
        
    }
    
    
    func computeExamGrade (desiredGrade : Double)
    {
        Q1 = Double (qOneGrade.text ?? "") ?? 0
        Q2 = Double (qTwoGrade.text ?? "") ?? 0
        midtermWeightPercent = Double (midtermGrade.text ?? "") ?? 0
        finalWeightPercent = Double (finalWeight.text ?? "") ?? 0
        
        if qOneGrade.text == "" || qTwoGrade.text == ""
        {
            self.errorWarning()
        }
        else
        {
        Dgrade = Double (desiredGrade)
        let examEquation : Double = (5 * (Dgrade - (0.4) * Q1 - (0.4) * Q2))
        
        finalGrade.text = String (format : "%.1f" ,examEquation)
        finalGrade.textColor = UIColor.black
        
        if examEquation > Double(100.0)
        {
            view.backgroundColor = UIColor.red
            indicateText.text = "Ask teacher for extra credit"
            indicateText.textColor = UIColor.black
            gradeAlert()
        }
            
        if examEquation < 0
        {
            view.backgroundColor = UIColor.blue
            indicateText.text = " "
            overGradeAlert()
        }
        
            
        else if examEquation <= 100
        {
            view.backgroundColor = UIColor.green
            indicateText.text = " "
        }
        
    }
        }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.8483077237, green: 0.8807682966, blue: 0.1136337713, alpha: 1)
 
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        finalGrade.text = ""
        
        quarterOneDesign()
        quarterTwoDesign()
        desiredGradeDesign()
        midtermDesign()
        midtermWeightDesign()
        finalDesign()
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    func calculateGrades()
    {
        computeExamGrade (desiredGrade: Double (desiredGrade.text!)!)
        self.view.endEditing(true)
    }
    
    func gradeAlert()
    {
         let myAlert = UIAlertController(title: "You must get above a 100% to recieve that grade", message: "" , preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
    myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    
    }
    
    func overGradeAlert()
    {
        let myAlert = UIAlertController(title: "You do not need to take the final to have this grade", message: "The decision is yours" , preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
        
    }

    
 
    func errorWarning()
    {
        let myAlert = UIAlertController(title: "Please fill out all areas to continue", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    func defaultA()
    {
        if qOneGrade.text == "" || qTwoGrade.text == "" || desiredGrade.text == ""
        {
            self.errorWarning()
        }
        else
        {
            computeExamGrade (desiredGrade: 93.0)
            self.view.endEditing(true)
        }
    }
    
    func defaultB()
    {
        if qOneGrade.text == "" || qTwoGrade.text == "" || desiredGrade.text == ""
        {
            self.errorWarning()
        }
        else
        {
            computeExamGrade (desiredGrade: 83.0)
            self.view.endEditing(true)
        }
    }
    
    func defaultC()
    {
        if qOneGrade.text == "" || qTwoGrade.text == "" || desiredGrade.text == ""
        {
            self.errorWarning()
        }
        else
        {
            computeExamGrade (desiredGrade: 73.0)
            self.view.endEditing(true)
        }
    }
    
    func defaultD()
    {
        if qOneGrade.text == "" || qTwoGrade.text == "" || desiredGrade.text == ""
        {
            self.errorWarning()
        }
        else
        {
            computeExamGrade (desiredGrade: 63.0)
            self.view.endEditing(true)
        }
    }

    func defaultF()
    {
        if qOneGrade.text == "" || qTwoGrade.text == "" || desiredGrade.text == ""
        {
            self.errorWarning()
        }
        else
        {
            computeExamGrade (desiredGrade: 59.0)
            self.view.endEditing(true)
        }
    }

    func quarterOneDesign()
    {
        qOneGrade.layer.borderColor = UIColor.red.cgColor
        qOneGrade.layer.borderWidth = 3.0
        qOneGrade.layer.cornerRadius = 5.0
    }
    
    func quarterTwoDesign()
    {
        qTwoGrade.layer.borderColor = UIColor.red.cgColor
        qTwoGrade.layer.borderWidth = 3.0
        qTwoGrade.layer.cornerRadius = 5.0
    }

    func desiredGradeDesign()
    {
        desiredGrade.layer.borderColor = UIColor.red.cgColor
        desiredGrade.layer.borderWidth = 3.0
        desiredGrade.layer.cornerRadius = 5.0
    }

    func midtermDesign()
    {
        midtermGrade.layer.borderColor = UIColor.red.cgColor
        midtermGrade.layer.borderWidth = 3.0
        midtermGrade.layer.cornerRadius = 5.0
    }
    
    func midtermWeightDesign()
    {
        weightMidterm.layer.borderColor = UIColor.red.cgColor
        weightMidterm.layer.borderWidth = 3.0
        weightMidterm.layer.cornerRadius = 5.0
    }
    
    func finalDesign()
    {
        finalWeight.layer.borderColor = UIColor.red.cgColor
        finalWeight.layer.borderWidth = 3.0
        finalWeight.layer.cornerRadius = 5.0
    }
    
}

