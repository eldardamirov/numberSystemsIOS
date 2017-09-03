//
//  ViewController.swift
//  Multi-HLOP number systems for IOS
//
//  Created by Эльдар Дамиров on 03.05.17.
//  Copyright © 2017 Эльдар Дамиров. All rights reserved.
//

import UIKit


////////////////////////// EXTENSIONS

extension UIViewController
    {
    func hideKeyboardWhenTappedAround()
        {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer ( target: self, action: #selector ( UIViewController.dismissKeyboard ) )
        tap.cancelsTouchesInView = false            
        view.addGestureRecognizer ( tap )
        }

    func dismissKeyboard()
        {
        view.endEditing ( true )
        }
    }


//////////////////////////




final class MasterViewController: UIViewController
    {

    //@IBOutlet weak var segmentedControllerButton: UISegmentedControl!
    @IBOutlet var segmentedControllerButton: UISegmentedControl!
    


    override func viewDidLoad()
        {
        super.viewDidLoad()

        setupView()

        self.hideKeyboardWhenTappedAround()
        //currentCalculatorLabelState.setTitle ( "+", for: .normal )
        }

    override func didReceiveMemoryWarning()
        {
        super.didReceiveMemoryWarning()

        }

    private func setupView()
        {
        setupSegmentedControllerButton()

        updateView()
        }

    private func setupSegmentedControllerButton()
        {
        segmentedControllerButton.removeAllSegments()
        segmentedControllerButton.insertSegment ( withTitle: "C&T", at: 0, animated: true )
        segmentedControllerButton.insertSegment ( withTitle: "Setting" , at: 1, animated: true )
        segmentedControllerButton.addTarget ( self, action: #selector ( selectionDidChange( _: ) ), for: .valueChanged )

        segmentedControllerButton.selectedSegmentIndex = 0
        }

    func selectionDidChange ( _ sender: UISegmentedControl )
    //func selectionDidChange ()
        {
        updateView()
        }

    private lazy var CalculationAndTranslationViewController: CalculationAndTranslationViewController =
        {
        let storyboard = UIStoryboard ( name: "Main", bundle: Bundle.main )  // setting storyboard

        var viewController = storyboard.instantiateViewController ( withIdentifier: "CalculationAndTranslationViewController" ) as! CalculationAndTranslationViewController // instiating viewController

        self.add ( asChildViewController: viewController )

        return viewController
        }()

    private lazy var settingsViewController: settingsViewController =
        {
        let storyboard = UIStoryboard ( name: "Main", bundle: Bundle.main )  // setting storyboard

        var viewController = storyboard.instantiateViewController ( withIdentifier: "settingsViewController" ) as! settingsViewController // instiating viewController

        self.add ( asChildViewController: viewController )

        return viewController
        }()


    private func add ( asChildViewController viewController: UIViewController )
        {
        addChildViewController ( viewController )

        view.addSubview ( viewController.view )

        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [ .flexibleWidth, .flexibleHeight ]


        viewController.didMove ( toParentViewController: self )
        }

    private func remove ( asChildViewController viewController: UIViewController )
        {
        viewController.willMove ( toParentViewController: nil ) // Notyfing viewController

        viewController.view.removeFromSuperview() // removing child from superView

        viewController.removeFromParentViewController()  // Notify Child ViewController
        }


    private func updateView()
        {
        if ( segmentedControllerButton.selectedSegmentIndex == 0 )
            {
            remove ( asChildViewController: settingsViewController )
            add ( asChildViewController: CalculationAndTranslationViewController )
            }
        else
            {
            remove ( asChildViewController: CalculationAndTranslationViewController )
            add ( asChildViewController: settingsViewController )
            }
        }

    






    

    @IBOutlet weak var initialSystem: UITextField!
    @IBOutlet weak var finalSystem: UITextField!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var translationResult: UILabel!


    @IBAction func translateButton(_ sender: Any)
        {
        let initialSys = Int(fromStringToNumber ( figure: initialSystem.text! ))
        let finalSys = fromStringToNumber ( figure: finalSystem.text! )

        //var num = fromStringToInt ( figure: number.text! )

        translationResult.text = (fromTenth(finalSystem: finalSys, number: fromIntToString(number: inTenthSystem(initialSystem: Int(initialSys), number: number.text!), mode: 0)))

        }


    @IBOutlet weak var firstNumber: UITextField!
    @IBOutlet weak var secondNumber: UITextField!
    @IBOutlet weak var calculationResult: UILabel!
    





    }

