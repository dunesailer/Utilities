//  Created by B.T. Franklin on 4/30/18

#if canImport(UIKit) && !os(watchOS)
import UIKit

@available(tvOS 10.0, *)
extension UIImage {
    public convenience init(view: UIView) {
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        let image = renderer.image { rendererContext in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
        
        self.init(cgImage: image.cgImage!)
    }
}
#endif
