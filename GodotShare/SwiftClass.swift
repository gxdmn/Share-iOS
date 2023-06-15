import Foundation
import UIKit

@objcMembers public class SwiftClass : NSObject
{
    static func function_demo(_ i : Int) -> Int {
        return i * 2
    }
    
    static func share_img(_ path : String) {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let filePath = documents.appendingPathComponent(path).path
        guard let image = UIImage(contentsOfFile: filePath) else {
            print("Failed to load image from file path: \(filePath)")
            return
        }
        
        _share_img(image)
    }
    
    static func share_img_web(_ url_ : String) {
        let url = URL(string: url_)
        let data = try? Data(contentsOf: url!)
        guard let image = UIImage(data : data!) else {
            print("Failed to load image from file path: \(url_)")
            return
        }
        
        _share_img(image)
        
    }
    
    static func _share_img(_ image : UIImage) {
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        if let rootViewController = UIApplication.shared.keyWindow?.rootViewController {
            activityViewController.popoverPresentationController?.sourceView = rootViewController.view
            rootViewController.present(activityViewController, animated: true, completion: nil)
        }
    }
    
    static func share_video_web(_ videoUrl: String) {
        let url = URL(string: videoUrl)
            
        DispatchQueue.global(qos: .background).async {
            guard let unwrappedURL = url, let urlData = try? Data(contentsOf: unwrappedURL) else { return }
            let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let filePath = documentsPath.appendingPathComponent("abc.mp4")
            
            DispatchQueue.main.async {
                do {
                    try urlData.write(to: filePath)
                    
                    let activityViewController = UIActivityViewController(activityItems: [filePath], applicationActivities: nil)
                    if let rootViewController = UIApplication.shared.keyWindow?.rootViewController {
                        activityViewController.popoverPresentationController?.sourceView = rootViewController.view
                        rootViewController.present(activityViewController, animated: true, completion: nil)
                    }
                } catch {
                    
                }
            }
        }
    }
}
