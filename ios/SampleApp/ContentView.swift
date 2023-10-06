//
// Copyright © Square, Inc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var value: Int32?

  var body: some View {
    VStack {
      Text("Rusty Rollercoaster").font(.title)
      Text(value != nil ? String(value!) : "")

      Button("Random!") {
        value = generateRandomNum(min: 0, inclMax: 100)
      }
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
