func emptyFunc() {}

func add(a, b) {
  var c = a + b
  print(c)
}

func parent() {
  func child() {
    print(1)
  }
  return child
}

func counterClolure() {
  var count = 0

  func inc() {
    count = count + 1
    return count
  }
  return inc
}

var myCounter = func() {
  var count = 0

  func inc() {
    count = count + 1
    return count
  }
  return inc
}
