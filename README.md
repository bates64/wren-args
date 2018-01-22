# wren-args
Super-simple command-line arguments parser for [Wren](https://github.com/munificent/wren).

```dart
import "args" for Args

var args = Args.parse()

if (args["special-mode"]) System.print("Special mode activated!")
```

### Args.parse(List<String> args) -> List<Map args, List loneValues>
Parses a list of strings like `Process.arguments`.

```dart
Args.parse([ "lone", "-dc", "--with", "value" ]) = [
  {
    // 'true' denotes the arguments were provided, but had no value assigned.
    "d": true,
    "c": true,

    // Note that all argument values are returned as Strings. Use Num.fromString
    // to obtain number values, if required.
    "with": "value"
  },

  // Lone values. These are values that had no preceeding argument name before them.
  [ "lone" ]
]
```

### Args.parse()
Calls `Args.parse(args)` with `Process.arguments`.
