# Ansi2Html

A Swift library to convert text with ANSI escape codes to HTML.

The heavy lifting of the conversion is done by the [ANSIEsc2HTML library](https://github.com/pozemka/ANSIEsc2HTML).
This SPM includes a slightly modified version of the library copied on 2023/5/5.

## Usages

### Direct Usage

You can create a string builder and use the conversion method directly on the builder.

```swift
import Ansi2Html

let builder = AnsiHtmlStringBuilder()

if builder.stringHasAnsi(stringWithAnsiCodes) {
    let html = builder.stringToHtml(stringWithAnsiCodes)
}
```

### String Extension

It may be more useful to add an extension on string for convenience.

```swift
import Ansi2Html

private let builder = AnsiHtmlStringBuilder()

extension String {
    
    var ansiToHtml: String {
        guard hasAnsi else { return self }
        
        return builder.stringToHtml(self)
    }
    
    var hasAnsi: Bool {
        builder.stringHasAnsi(self)
    }
    
}
```

Elsewhere in your code you can use the `ansiToHtml` computed attribute.

```swift

let html = stringWithAnsiCodes.ansiToHtml

```



