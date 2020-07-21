//
//  Message.swift
//  ChatAppDemo
//
//  Created by Gagan  Vishal on 7/20/20.
//

import Foundation

struct Message: Hashable {
    let messageString: String
    let isIncomingMessage: Bool
    let date: Date
 }
