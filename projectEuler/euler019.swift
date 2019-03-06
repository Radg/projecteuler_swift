//
//  euler019.swift
//  projectEuler
//
//  Created by Radic on 06/03/2019.
//  Copyright © 2019 Radic. All rights reserved.
//

/*
You are given the following information, but you may prefer to do some research for yourself.

1 Jan 1900 was a Monday.
Thirty days has September,
April, June and November.
All the rest have thirty-one,
Saving February alone,
Which has twenty-eight, rain or shine.
And on leap years, twenty-nine.
A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
*/

/*
 Дана следующая информация (однако, вы можете проверить ее самостоятельно):
 
 1 января 1900 года - понедельник.
 В апреле, июне, сентябре и ноябре 30 дней.
 В феврале 28 дней, в високосный год - 29.
 В остальных месяцах по 31 дню.
 Високосный год - любой год, делящийся нацело на 4, однако последний год века (ХХ00) является високосным в том и только том случае, если делится на 400.
 Сколько воскресений выпадает на первое число месяца в двадцатом веке (с 1 января 1901 года до 31 декабря 2000 года)?
*/

import Foundation

func euler019() -> Int {
    
    var result = 0
    var shiftFromSunday = 2           // 1.1.1901 is Tuesday
    
    let daysInYear          = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let daysInLeapYear      = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    var daysInCurrentYear   = [Int]()
    
    for currentYear in 1901 ... 2000 {
        if currentYear % 4 == 0 {
            daysInCurrentYear = daysInLeapYear
        } else {
            daysInCurrentYear = daysInYear
        }
        
        for currentMonth in 0 ... 11 {
            shiftFromSunday = (daysInCurrentYear[currentMonth] + shiftFromSunday) % 7
            if shiftFromSunday == 0 {
                result += 1
            }
        }
    }
    
    return result
}
