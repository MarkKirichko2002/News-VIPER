import UIKit

public func SCImage(named name: String) -> UIImage? {
  UIImage(named: name, in: Bundle.module, compatibleWith: nil)
}

public struct NewsAPIPackage {
    
    public private(set) var text = "Hello, World!"

    public init() {
    }
}
