//
//  ExtensionUILabel.swift
//  RotaIOS
//
//  Created by Yasin Dalkilic on 13.04.2022.
//

import Foundation
import UIKit

class Toast: UILabel {

private let BOTTOM_MARGIN: CGFloat = 16
private let SIDE_MARGIN: CGFloat = 16
private let HEIGHT: CGFloat = 50
private let SHOW_TIME_SECONDS = TimeInterval(3)
private let BACKGROUND_COLOR = UIColor.white.withAlphaComponent(0.7).cgColor
private let TEXT_COLOR = UIColor.blue
private let ANIMATION_DURATION_SEC = 0.5

private static var queue: [ToastHolder] = []
private static var showing: Toast?

init(_ text: String) {
    super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))

    self.text = text
    self.textColor = TEXT_COLOR
    textAlignment = .center
    self.layer.backgroundColor = BACKGROUND_COLOR
    self.layer.cornerRadius = 5
}

public func show(_ parent: UIViewController) {
    frame = CGRect(x: SIDE_MARGIN, y: 500, width: UIScreen.main.bounds.width - 2 * SIDE_MARGIN, height: HEIGHT)

    if Toast.showing == nil {
       // log("showing \(String(describing: text))")
        Toast.showing = self
        alpha = 0
        parent.view.addSubview(self)
        UIView.animate(withDuration: ANIMATION_DURATION_SEC, animations: {
            self.alpha = 1
        }, completion: { (completed) in
            Timer.scheduledTimer(timeInterval: self.SHOW_TIME_SECONDS, target: self, selector: #selector(self.onTimeout), userInfo: nil, repeats: false)
        })
    } else {
        Toast.queue.append(ToastHolder(self, parent))
    }
}

@objc func onTimeout() {
    UIView.animate(withDuration: ANIMATION_DURATION_SEC, animations: {
        self.alpha = 0
    }, completion: { (completed) in
        Toast.showing = nil
        self.removeFromSuperview()

        if !Toast.queue.isEmpty {
            let holder = Toast.queue.removeFirst()
            holder.toast.show(holder.parent)
        }
    })
}

required init?(coder aDecoder: NSCoder) {
    fatalError("this initializer is not supported")
}

private class ToastHolder {
    let toast: Toast
    let parent: UIViewController

    init(_ t: Toast, _ p: UIViewController) {
        toast = t
        parent = p
    }
}
}
