//
//  Date.swift
//  Messenger_SwiftUI
//
//  Created by Aleksey Alyonin on 04.09.2023.
//

import Foundation

extension Date {
    ///Время для сообщений в пределах одного дня
    private var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateFormat = "HH:mm"
        return formatter
    }
    
    ///Время для сообщений в календарном формате
    private var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateFormat = "MM/dd/yy"
        return formatter
    }
    
    private func timeString() -> String {
        return timeFormatter.string(from: self)
    }
    
    private func dateString() -> String {
        return dayFormatter.string(from: self)
    }
    
    func timestampString() -> String{
        if Calendar.current.isDateInToday(self){
            return timeString()
        } else if Calendar.current.isDateInYesterday(self) {
            return "Вчера"
        } else {
            return dateString()
        }
    }
}
