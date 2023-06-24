# SVGImageSwiftUI

A SwiftUI wrapper over [SVGKit](https://github.com/SVGKit/SVGKit) to load SVG image over URL.

## Features

- Plug and Play With SwiftUI
- Caching with NSCache
- VisionOS Support

## Usage

```swift
  static var previews: some View {
    SVGImage(url:URL(string:"https://crests.football-data.org/113.svg")!, size: CGSize(width: 100,height: 100))
  }
```
