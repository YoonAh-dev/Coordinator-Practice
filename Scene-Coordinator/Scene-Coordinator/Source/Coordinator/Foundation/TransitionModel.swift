//
//  TransitionModel.swift
//  Scene-Coordinator
//
//  Created by SHIN YOON AH on 2022/01/30.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
}

enum TransitionError: Error {
    case navigationControllerMissing
    case cannotPop
    case unknown
}
