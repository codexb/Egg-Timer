# Egg-Timer

![Egg timer](image.png?raw=true "EGG TIMER")


* Setup timer 
```swift
var timer = Timer()
timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

@objc func updateTimer(){
    if secondsPassed < totalTime {
        secondsPassed += 1
    } else{
        timer.invalidate()
    }
}
```
