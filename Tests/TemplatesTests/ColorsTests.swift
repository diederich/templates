//
// SwiftGen
// Copyright (c) 2015 Olivier Halligon
// MIT Licence
//

import StencilSwiftKit
import XCTest

class ColorsTests: XCTestCase {
  enum Contexts {
    static let all = ["empty", "defaults", "multiple"]
  }

  // generate variations to test customname generation
  func variations(customName: String) -> VariationGenerator {
    return { name, context in
      guard name == "defaults" else { return [(context: context, suffix: "")] }

      return [
        (context: context,
         suffix: ""),
        (context: try StencilContext.enrich(context: context,
                                            parameters: ["enumName=\(customName)",
                                                         "colorAliasName=XCTColor"]),
         suffix: "-customname")
      ]
    }
  }

  func testSwift2() {
    test(template: "swift2",
         contextNames: Contexts.all,
         directory: .colors,
         contextVariations: variations(customName: "XCTColors"))
  }

  func testSwift3() {
    test(template: "swift3",
         contextNames: Contexts.all,
         directory: .colors,
         contextVariations: variations(customName: "XCTColors"))
  }

  func testSwift4() {
    test(template: "swift4",
         contextNames: Contexts.all,
         directory: .colors,
         contextVariations: variations(customName: "XCTColors"))
  }

  func testLiteralsSwift3() {
    test(template: "literals-swift3",
         contextNames: Contexts.all,
         directory: .colors,
         contextVariations: variations(customName: "UIColor"))
  }

  func testLiteralsSwift4() {
    test(template: "literals-swift4",
         contextNames: Contexts.all,
         directory: .colors,
         contextVariations: variations(customName: "UIColor"))
  }
}
