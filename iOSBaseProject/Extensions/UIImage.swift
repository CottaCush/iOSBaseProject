import UIKit

extension UIImage {
    
    func getImageSizeCompressionRatio() -> Float {
        guard let imageData = UIImageJPEGRepresentation(self, 1) else {
            debugPrint("Could not get JPEG representation of UIImage")
            return 1.0
        }
        
        let sizeInKb = imageData.count / 1024
        
        if sizeInKb > 8 * 1024 {
            return 0
        } else if sizeInKb > 6 * 1024 {
            return 0.2
        } else if sizeInKb > 4 * 1024 {
            return 0.4
        } else if sizeInKb > 2 * 1024 {
            return 0.6
        } else if sizeInKb > 1024 {
            return 0.8
        } else {
            return 1.0
        }
    }
}
