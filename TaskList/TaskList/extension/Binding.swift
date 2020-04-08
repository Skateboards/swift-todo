//
//  Binding.swift
//  TaskList
//
//  Created by Charlie.Collier on 4/8/20.
//  Copyright © 2020 Charlie.Collier. All rights reserved.
//

import SwiftUI

public extension Binding where Value: CaseIterable & Equatable {
  var caseIndex: Binding<Value.AllCases.Index> {
    Binding<Value.AllCases.Index>(
      get: {Value.allCases.firstIndex(of: self.wrappedValue)! },
      set: {self.wrappedValue = Value.allCases[$0]}
    )
  }
}
