import SwiftUI
import SVGKit

let cache = NSCache<NSString, SVGKImage>()

public struct SVGImage: UIViewRepresentable {
    public let url: URL
    public let size: CGSize
    
    public init(url: URL, size: CGSize) {
        self.url = url
        self.size = size
    }
    
    public func updateUIView(_ imageView: SVGKFastImageView, context: Context) {
        imageView.contentMode = .scaleAspectFit
        imageView.image.size = size
    }
    
    public func makeUIView(context: Context) -> SVGKFastImageView {
        if let image = cache.object(forKey: url.absoluteString as NSString) {
            return SVGKFastImageView(svgkImage: image)
        } else {
            let imgView: SVGKFastImageView = .init(svgkImage: .init())
            imgView.backgroundColor = .gray.withAlphaComponent(0.5)
            DispatchQueue.global(qos: .userInitiated).async {
                if let svgImage = SVGKImage(contentsOf: url) {
                    cache.setObject(svgImage, forKey: url.absoluteString as NSString)
                    DispatchQueue.main.async {
                        imgView.image = svgImage
                        imgView.backgroundColor = .clear
                        imgView.image.size = size
                    }
                }
            }
            return imgView
        }
    }
}
