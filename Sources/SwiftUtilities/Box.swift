//
//  Box.swift
//  SwiftUtilities
//
//  Created by Jonathan Wight on 10/27/15.
//
//  Copyright © 2016, Jonathan Wight
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  * Redistributions of source code must retain the above copyright notice, this
//    list of conditions and the following disclaimer.
//
//  * Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
//  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
//  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
//  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
//  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
//  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import Foundation

public class Box <Element> {
    public let value: Element
    public init(_ value: Element) {
        self.value = value
    }
}

extension Box {
    // Stolen from https://github.com/robrix/Box/blob/master/Box/Box.swift
    public func map<U> (_ transform: (Element) -> U) -> Box<U> {
		return Box<U> (transform(value))
	}
}

extension Box: CustomStringConvertible {
    public var description: String {
		return String(describing: value)
	}
}

public class BoxWithObjectIdentifier {
    public weak var value: AnyObject?
    public let objectIdentifier: ObjectIdentifier
    
    public init(_ value: AnyObject) {
        self.value = value
        self.objectIdentifier = ObjectIdentifier(value)
    }
}

extension BoxWithObjectIdentifier : Equatable {
    public static func ==(l: BoxWithObjectIdentifier, r: BoxWithObjectIdentifier) -> Bool {
        return l.objectIdentifier == r.objectIdentifier
    }
}

extension BoxWithObjectIdentifier : Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.objectIdentifier.hashValue)
    }
}
