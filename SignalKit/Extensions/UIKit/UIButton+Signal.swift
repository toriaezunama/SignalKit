//
//  UIButton+Signal.swift
//  SignalKit
//
//  Created by Yanko Dimitrov on 8/16/15.
//  Copyright © 2015 Yanko Dimitrov. All rights reserved.
//

import UIKit

public extension SignalType where ObservationType == String {
   
   public func bindTo(titleIn button: UIButton, forState state: UIControlState) -> Self {
      
      addObserver { [weak button] in
         button?.setTitle($0, forState: state)
      }
      
      return self
   }
}

public extension SignalEventType where Sender: UIButton {
    
    /**
        Observe the button for TouchUpInside events
    
    */
    public var tapEvent: ControlSignal<Sender> {
        
        return ControlSignal(control: sender, events: .TouchUpInside)
    }
}
