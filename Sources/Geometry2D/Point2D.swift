//
//  Point2D.swift
//  Geometry2D
//
//  Created by Marc-Antoine Malépart on 2022-12-09.
//

import Foundation

public struct Point2D: Hashable {
    public var x: Double
    public var y: Double
    
    public init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    public init(x: Int, y: Int) {
        self.x = Double(x)
        self.y = Double(y)
    }
    
    public static let zero = Self(x: 0, y: 0)
    
    public func manhattanDistance(to other: Self) -> Double {
        abs(other.x - x) + abs(other.y - y)
    }
    
    public func linearDistance(to other: Self) -> Double {
        sqrt(pow(other.x - self.x, 2) + pow(other.y - self.y, 2))
    }
    
    public func applying(_ transform: AffineTransform2D) -> Self {
        var point = self
        point.apply(transform)
        return point
    }
    
    public mutating func apply(_ transform: AffineTransform2D) {
        let newX = transform.a * x + transform.c * y + transform.tx
        let newY = transform.b * x + transform.d * y + transform.ty
        
        self.x = newX
        self.y = newY
    }
}
