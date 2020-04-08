//
//  Task.swift
//  TaskList
//
//  Created by Charlie.Collier on 4/8/20.
//  Copyright © 2020 Charlie.Collier. All rights reserved.
//

import Foundation

struct Task : Identifiable {
  let id = UUID()
  var name: String
  var completed: Bool = false
}
