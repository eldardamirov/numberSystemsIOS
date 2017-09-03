//
//  settingsViewController.swift
//  Multi-HLOP number systems for IOS
//
//  Created by Эльдар Дамиров on 04.05.17.
//  Copyright © 2017 Эльдар Дамиров. All rights reserved.
//

import UIKit

class settingsViewController: UIViewController
    {

    override func viewDidLoad()
        {
        super.viewDidLoad()
        

        }

    override func didReceiveMemoryWarning()
        {
        super.didReceiveMemoryWarning()
        }


    @IBOutlet weak var optimizationSwitch: UISwitch!

    @IBOutlet weak var image: UIImageView!

    @IBAction func optimizationSwithAction(_ sender: Any)
        {
        optimizationSwitch.setOn ( true, animated: true )
        }

    @IBAction func turnOnMaximumEfficencyButtonAction(_ sender: Any)
        {

        
        let alert = UIAlertController ( title: "Warning!", message: "Do you really want to turn on maximum efficency?", preferredStyle: UIAlertControllerStyle.alert )
        alert.addAction(UIAlertAction ( title: "Yes, I am HLOP man!", style: UIAlertActionStyle.default, handler: { ( action: UIAlertAction! ) in CalculationAndTranslationViewController().showWarningLabel ( mode: 1 ) } ) )
        alert.addAction ( UIAlertAction ( title: "No, I am LLOP man...", style: UIAlertActionStyle.default, handler: nil ) )
        self.present(alert, animated: true, completion: nil)

        
        }

    }
