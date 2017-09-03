//
//  worker.swift
//  Multi-HLOP number systems for IOS
//
//  Created by Эльдар Дамиров on 03.05.17.
//  Copyright © 2017 Эльдар Дамиров. All rights reserved.
//

import Foundation


let asciiZero = 48
let asciiA = 65
let asciiSeven = 55



func fromIntToString ( number: Int, mode: Int ) -> String
    {
    var temp = ""
    var tempNumber = number
    if ( mode == -1 && number == 0 )
        {
        return "0"
        }
    
    while ( tempNumber > 0 )
        {
        assert ( tempNumber > 0 )
        temp += String(tempNumber % 10)
        
        tempNumber /= 10

        }

    temp = stringReverse(input: temp)
    
    return temp
    }


func stringReverse ( input: String ) -> String
    {
    let tempString = input
    var reverse = ""

    for character in tempString.characters 
        {
        let asString = "\(character)"
        reverse = asString + reverse
        }
        
    return reverse
    }
    
func fromStringToInt( figure: String ) -> Int
    {
    var temp = 0
    
    if ( Int(( figure.unicodeScalars.first?.value )!) - asciiZero < 10 )
        {
        temp = Int(( figure.unicodeScalars.first?.value )!) - asciiZero
        }
    else
        {
        temp = Int(( figure.unicodeScalars.first?.value )!) - ( asciiA - 10 );  // - asciiSeven
        }

        return temp;
    }


func fromStringToNumber ( figure: String ) -> Int
    {
    var temp = 0
    var tempChar = ""
    let tempString = figure

    

    for char in tempString.characters
        {
        tempChar = String(char)
        temp *= 10
        temp = temp + fromStringToInt(figure: tempChar)
        }

    //( tempChar.unicodeScalars.first?.value )!
    return temp
    }


func fromTenth ( finalSystem: Int, number: String ) -> String
    {
    var temp = ""
    var result = fromStringToNumber ( figure: number )
    
    while ( result != 0 )
        {
        if ( result % finalSystem > 9 )
            {
            temp = temp + String ( Character ( UnicodeScalar ( asciiSeven + result % finalSystem )! ) )
            }
        else
            {
            temp = temp + String ( Character ( UnicodeScalar ( asciiZero + result % finalSystem )! ) )
            }
            
        result = result / finalSystem
        }
        
    temp = stringReverse ( input: temp )
    
    return temp
    }
    
func inTenthSystem ( initialSystem: Int, number: String ) -> Int
    {
    var answer = 0
    var tempString = number
    
    for char in tempString.characters
        {
        answer = ( answer + fromStringToInt ( figure: String ( char ) ) ) * initialSystem 
        }
        
    answer = answer / initialSystem
    
    return answer
    }

func convertToNegativeNumbers ( number: Int ) -> String
    {
    //var result: UInt8
    var answer = ""
    var tempNumber: UInt8 = UInt8 ( String ( number, radix: 2 ) )!


    if ( number > 0 )
        {
        tempNumber = (~tempNumber)|128 + 1
        //print ( String ( tempNumber, radix: 2 ) )
        }

    /*
    if ( number > 0 )
        {
        //result = UInt8(( -(~number|128 )) + 1)
        result = UInt8( -(~number|128 )) + 1
        }

    print ( UInt8(( -(~number|128 )) + 1) )
    */

    answer = String ( tempNumber, radix: 2 )

    return answer
    }


 
func addition ( initialSystem: Int, number1: String, number2: String ) -> String
    {
    var minimum = 0, maximum = 0
    var result = ""
    var flag = 0, temp = 0, tempPresent = 0
    var biggestNumber = ""

    let number2Size = number2.characters.count
    let number1Size = number1.characters.count

    //print ( "number2Size: \(number2Size)" )


    if ( number1.characters.count >= number2.characters.count )
        {
        minimum = Int ( number2Size )
        maximum = Int ( number1Size )
        biggestNumber = number1
        }
    else
        {
        minimum = Int ( number1Size )
        maximum = Int ( number2Size )
        biggestNumber = number2
        }

   // var i = 0

    for i in 1...minimum
        {
        if ( i >= 1 && i <= minimum )
            {
            let tempIndex1 = number1.index ( number1.startIndex, offsetBy: ( number1.characters.count - i ) )
            let tempIndex2 = number2.index ( number2.startIndex, offsetBy: ( number2.characters.count - i ) )

            let tempChar1 =  ( number1 [ tempIndex1 ] )
            let tempChar2 =  ( number2 [ tempIndex2 ] )
            temp = fromStringToInt ( figure: String ( tempChar1 ) ) + fromStringToInt ( figure: String ( tempChar2 ) )
            }

        if ( flag == 1 )
            {
            temp = temp + 1
            flag = 0
            }

        tempPresent = Int ( temp % initialSystem )

        result = result + fromIntToString ( number: tempPresent, mode: -1 )

        if ( temp / initialSystem == 1 )
            {
            flag = 1
            }


        }

    if ( minimum != maximum )
        {
        for i in ( minimum + 1 )...maximum
            {
            temp = fromStringToInt ( figure: String ( biggestNumber [ biggestNumber.index ( biggestNumber.startIndex, offsetBy: maximum - i ) ] ) )

            if ( flag == 1 )
                {
                temp = temp + 1
                flag = 0
                }

            result = result + fromIntToString ( number: ( temp % initialSystem ), mode: -1 )

            if ( temp / initialSystem == 1 )
                {
                flag = 1
                }

            }
        }

    if ( flag == 1 )
        {
        result = result + "1"
        }


    result = stringReverse ( input: result )
    //print( result )


    return result
    }











