#if canImport(UIKit)
import UIKit

class CrossFadeSegue: UIStoryboardSegue {
    
    override func perform() {
        let sourceViewControllerView = self.source.view!
        let destinationViewControllerView = self.destination.view!
        
        // Insert destination below the source
        // Without this line the animation works but the transition is not smooth as it jumps from white to the new view controller
        destinationViewControllerView.alpha = 0;
        sourceViewControllerView.addSubview(destinationViewControllerView);
        
        // Animate the fade, remove the destination view on completion and present the full view controller
        UIView.animate(withDuration: 1,
            animations: {
                destinationViewControllerView.alpha = 1;
            },
            completion: { (finished) in
                destinationViewControllerView.removeFromSuperview()
                self.source.present(self.destination, animated: false, completion: nil)
            }
        )
    }
}

#endif

