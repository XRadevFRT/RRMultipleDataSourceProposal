//
//  Array+SafeAt.swift
//  UniperEnergy
//
//  Created by Ivan Georgiev on 12.12.19.
//  Copyright © 2019 Upnetix. All rights reserved.
//

import Foundation

extension Array {
    subscript(safeAt index: Int) -> Element? {
        guard index < count, index >= 0 else { return nil }
        
        return self[index]
    }
}
