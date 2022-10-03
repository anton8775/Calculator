//
//  ViewController.swift
//  Calculator
//
//  Created by Антон Яценко on 20.09.2022.
//

import UIKit

class ViewController: UIViewController {

    var numberFromScreen:Double = 0;
    var firstNum:Double = 0;
    var mathSign:Bool = false;
    var operation:Int = 0;
    
    @IBOutlet weak var result: UILabel!
    
    
    
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true{
            result.text = String(sender.tag)
            mathSign = false
        }else {
            result.text = result.text! + String(sender.tag)
        }
        numberFromScreen = Double(result.text!)!
    }
    
    @IBAction func buttons(_ sender: Any) {
        if result.text != "" && (sender as AnyObject).tag != 10 && (sender as AnyObject).tag != 15 {
            firstNum = Double(result.text!)!
            
            if (sender as AnyObject).tag == 11{
                result.text = "÷";
            }
            else if (sender as AnyObject).tag == 12{
               result.text = "x";
        }
            else if (sender as AnyObject).tag == 13{
                result.text = "-";
            }
            else if (sender as AnyObject).tag == 14{
                result.text = "+";
                
            }
            operation = (sender as AnyObject).tag
            mathSign = true;
        }
        else if (sender as AnyObject).tag == 15{
            if operation == 11{
                result.text = String(firstNum / numberFromScreen)
            }
            else  if operation == 12{
                result.text = String(firstNum * numberFromScreen)
            }
            else  if operation == 13{
                result.text = String(firstNum - numberFromScreen)
            }
            else if operation == 14{
                result.text = String(firstNum + numberFromScreen)
            }
        }
        else if (sender as AnyObject).tag == 10{
            result.text = " "
            firstNum = 0
            numberFromScreen = 0
            operation = 0
        }
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

