import UIKit
import SwiftUI

enum SettingOptionsViewModel: Int, CaseIterable, Identifiable {
case darkMode
case activeStatus
case accessibility
case notification
    
    var title: String {
        switch self {
            
        case .darkMode: return "Темная тема"
        case .activeStatus: return "Статус"
        case .accessibility: return "Доступность"
        case .notification: return "Безопасноть"
        }
    }
    
    var imageName: String {
        switch self {
        case .darkMode: return "moon.circle.fill"
        case .activeStatus: return "message.circle.fill"
        case .accessibility: return "person.circle.fill"
        case .notification: return "bell.circle.fill"
        }
    }
    
    var imageNameColor: Color {
        switch self {
        case .darkMode: return Color(.systemRed)
        case .activeStatus: return Color(.systemBlue)
        case .accessibility: return Color(.systemGreen)
        case .notification: return Color(.systemGray)
        }
    }
    
    
    var id: Int { return self.rawValue }
}
