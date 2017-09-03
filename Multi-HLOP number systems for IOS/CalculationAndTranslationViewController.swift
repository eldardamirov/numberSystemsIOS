//
//  CalculationAndTranslationViewController.swift
//  Multi-HLOP number systems for IOS
//
//  Created by Эльдар Дамиров on 04.05.17.
//  Copyright © 2017 Эльдар Дамиров. All rights reserved.
//

import UIKit

class CalculationAndTranslationViewController: UIViewController
    {
    //var isUserHLOPMan = false

    var downloadedImage = UIImage ()

    override func viewDidLoad()
        {
        super.viewDidLoad()
        //showWarningLabel()


        let imageURL = URL ( string: "https://www.materialui.co/materialIcons/alert/warning_amber_384x384.png" )!
        let task = URLSession.shared.dataTask (with: imageURL )
            {
            ( data, response, error ) in
                if ( error == nil )
                    {
                    //downloadedImage = UIImage ( data: data! )

                    performUIUpdatesOnMain
                        {
                        //self.image.image = downloadedImage
                        }
                    }
                else
                    {
                    self.image.image = nil
                    }
            }

        //task.resume()




        self.hideKeyboardWhenTappedAround()
        }

    override func didReceiveMemoryWarning()
        {
        super.didReceiveMemoryWarning()


        // JUST IGNORE
        }

    //private func downloadAndShow


    
    
    @IBOutlet weak var image: UIImageView!

    /*
    public func showWarningLabel ( mode: Int )
        {
        if ( mode == 0 )
            {
            isUserHLOPMan = false

            }
        else
            {
            isUserHLOPMan = true
            print ( "I was here!" )
            }

        }
    */

    public func showWarningLabel ( mode: Int )
        {
        let imageURL = URL ( string: "https://www.materialui.co/materialIcons/alert/warning_amber_384x384.png" )!
        let task = URLSession.shared.dataTask (with: imageURL )
            {
            ( data, response, error ) in
                //if ( error == nil && self.isUserHLOPMan == true )
                if ( error == nil )
                    {
                    let downloadedImage = UIImage ( data: data! )

                    performUIUpdatesOnMain
                        {
                        self.image.image = downloadedImage
                        }
                    }
                else
                    {
                    self.image.image = nil
                    }
            }

        task.resume()
        }


    var currentAd = 0 // current number of ad that must be shown
    let adQuantity = 4  // total quantity of ads

    var currentCalculatonMode = 0


    @IBOutlet weak var initialNumberSystemForTranslate: UITextField!
    @IBOutlet weak var finalNumberSystemForTranslate: UITextField!
    @IBOutlet weak var numberForTranslate: UITextField!
    @IBOutlet weak var resultForTranslate: UILabel!


    @IBAction func translateButton(_ sender: Any)
        {
        let initialSys = fromStringToNumber ( figure: initialNumberSystemForTranslate.text! )
        let finalSys = fromStringToNumber ( figure: finalNumberSystemForTranslate.text! )

        //var num = fromStringToInt ( figure: number.text! )

        resultForTranslate.text = ( fromTenth ( finalSystem: finalSys, number: fromIntToString ( number: inTenthSystem ( initialSystem: Int ( initialSys ), number: numberForTranslate.text! ), mode: 0 ) ) )

        }



    @IBOutlet weak var firstNumberForCalculate: UITextField!
    @IBOutlet weak var secondNumberForTranslate: UITextField!
    @IBOutlet weak var numberSystemForTranslate: UITextField!
    @IBOutlet weak var resultForCalculate: UILabel!
    @IBOutlet weak var operatorButtonLabel: UIButton!



    @IBAction func calculateButton(_ sender: Any)
        {
        let initialSys = Int ( numberSystemForTranslate.text! )

        if ( currentCalculatonMode == 1 )
            {
            resultForCalculate.text = addition ( initialSystem: initialSys!, number1: firstNumberForCalculate.text!, number2: secondNumberForTranslate.text! )
            }
        /*
        if ( currentCalculatonMode == 1 )
            {
            //resultForCalculate.text = convertToNegativeNumbers ( number: Int ( firstNumberForCalculate.text! )! )
            resultForCalculate.text = "Hello!"
            }
        */

        }


    @IBAction func operatorButtonChange(_ sender: Any)
        {
        let operatorsForCalculation = [ "+", "-", "*", "/" ]

        currentCalculatonMode = currentCalculatonMode + 1
        currentCalculatonMode = currentCalculatonMode % 4

        operatorButtonLabel.setTitle ( operatorsForCalculation [ currentCalculatonMode ], for: .normal )
        }




    }
