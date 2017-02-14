//
//  FilpDismissAnimationController.swift
//  LDSAreaPlan2017
//
//  Created by Daniel Dickson on 2/9/17.
//  Copyright © 2017 Daniel Dickson. All rights reserved.
//

import UIKit

class FlipDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    var destinationFrame = CGRect.zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let containerView = transitionContext.containerView as UIView?,
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else {
                return
        }
        
        // 1
        _ = transitionContext.initialFrame(for: fromVC)
        let finalFrame = destinationFrame
        
        // 2
        let snapshot = fromVC.view.snapshotView(afterScreenUpdates: false)
        snapshot?.layer.masksToBounds = true
        
        // 3
        containerView.addSubview(toVC.view)
        containerView.addSubview(snapshot!)
        fromVC.view.isHidden = true
        
        AnimationHelper.perspectiveTransformForContainerView(containerView: containerView)
        
        // 4
        toVC.view.layer.transform = AnimationHelper.yRotation(angle: -M_PI_2)
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1/3, animations: {
                snapshot?.frame = finalFrame
            })
            UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3, animations: {
                snapshot?.layer.transform = AnimationHelper.yRotation(angle: M_PI_2)
            })
            UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3, animations: {
                toVC.view.layer.transform = AnimationHelper.yRotation(angle: 0.0)
            })
        }, completion: { _ in
            fromVC.view.isHidden = false
            snapshot?.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}

