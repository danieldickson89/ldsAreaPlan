//
//  FlipPresentAnimationController.swift
//  LDSAreaPlan2017
//
//  Created by Daniel Dickson on 2/9/17.
//  Copyright © 2017 Daniel Dickson. All rights reserved.
//

import UIKit

class FlipPresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    var originFrame = CGRect.zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // Step 1:
        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let containerView = transitionContext.containerView as UIView?,
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else {
                return
        }
        
        // Step 2:
        let initialFrame = originFrame
        let finalFrame = transitionContext.finalFrame(for: toVC)
        
        // Step 3:
        let snapshot = toVC.view.snapshotView(afterScreenUpdates: true)
        snapshot?.frame = initialFrame
        snapshot?.layer.masksToBounds = true
        
        containerView.addSubview(toVC.view)
        containerView.addSubview(snapshot!)
        toVC.view.isHidden = true
        
        AnimationHelper.perspectiveTransformForContainerView(containerView: containerView)
        snapshot?.layer.transform = AnimationHelper.yRotation(angle: M_PI_2)
        
        // Step 4:
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1/3, animations: {
                fromVC.view.layer.transform = AnimationHelper.yRotation(angle: -M_PI_2)
            })
            UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3, animations: {
                snapshot?.layer.transform = AnimationHelper.yRotation(angle: 0.0)
            })
            UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3, animations: {
                snapshot?.frame = finalFrame
            })
        }, completion: { _ in
            toVC.view.isHidden = false
            fromVC.view.layer.transform = AnimationHelper.yRotation(angle: 0.0)
            snapshot?.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}

