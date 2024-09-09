//
//  PushTransition .swift
//  WeatherApp
//
//  Created by Vitaly on 02.09.2024.
//

import UIKit

class PushTransition: NSObject, UIViewControllerAnimatedTransitioning {
    public var isPresenting = true
    public var duration = 0.4
    
    func transitionDuration(using transitionContext: (any UIViewControllerContextTransitioning)?) -> TimeInterval {
        duration
    }
    
    func animateTransition(using transitionContext: any UIViewControllerContextTransitioning) {
        guard let fromViewController = transitionContext.viewController(forKey: .from),
                    let toViewController = transitionContext.viewController(forKey: .to) else { return }

              let containerView = transitionContext.containerView
              let duration = transitionDuration(using: transitionContext)

              if isPresenting {
                  containerView.addSubview(toViewController.view)
                  toViewController.view.alpha = 0
                  
                  //Open
                  UIView.animate(withDuration: duration, animations: {
                      toViewController.view.alpha = 1
                  }) { finished in
                      transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                  }
              } else {
                  //Closed
                  UIView.animate(withDuration: duration, animations: {
                      fromViewController.view.alpha = 0
                      toViewController.view.alpha = 1
                      fromViewController.view.transform = CGAffineTransform(translationX: fromViewController.view.frame.width, y: 0)
                  }) { finished in
                      fromViewController.view.transform = .identity
                      transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                  }
              }
          }
      }
