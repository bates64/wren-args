import "os" for Process

class Args {
  // Parses Process.arguments.
  static parse() {
    return Args.parse(Process.arguments)
  }

  // Expects a List of Strings.
  static parse(args) {
    var argMap = {}
    var curArg = null
    var loneValues = []

    for (arg in args) {
      if (arg.startsWith("--")) {
        // multi-char arg name
        curArg = arg[2..-1]
        argMap[curArg] = true
      } else if (arg.startsWith("-")) {
        // single-char arg name(s)
        for (char in arg[1..-1]) {
          curArg = char
          argMap[curArg] = true
        }
      } else if (curArg == null) {
        // lone value
        loneValues.add(arg)
      } else {
        // value for curArg
        argMap[curArg] = arg
        curArg = null
      }
    }

    return [ argMap, loneValues ]
  }
}
