import UIKit
import PlaygroundSupport

var greeting = "Hello, playground"

let vc = ViewController1()
let navigationVC = UINavigationController(rootViewController: vc)
PlaygroundPage.current.liveView = navigationVC
