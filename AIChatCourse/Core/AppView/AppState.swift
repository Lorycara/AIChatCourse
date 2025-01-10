//
//  AppState.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 10/01/25.
//
import SwiftUI

@Observable
class AppState {
    private(set) var showTabBar: Bool = false {
        didSet {
            UserDefaults.showTabbarView = showTabBar
        }
    }
    
    init(showTabBar: Bool = UserDefaults.showTabbarView) {
        self.showTabBar = showTabBar
    }
    
    func updateViewState(showTabBarView: Bool) {
        showTabBar = showTabBarView
    }
}

// tabbar - signed in
// on boarding - signed out

extension UserDefaults {
    private struct Keys {
        static let showTabbarView = "showTabbarView"
    }
    
    static var showTabbarView: Bool {
        get {
            standard.bool(forKey: Keys.showTabbarView)
        } set {
            standard.set(newValue, forKey: Keys.showTabbarView)
        }
    }
}
