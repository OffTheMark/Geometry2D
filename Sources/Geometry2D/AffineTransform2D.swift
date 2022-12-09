//
//  AffineTransform2D.swift
//  Geometry2D
//
//  Created by Marc-Antoine Malépart on 2022-12-09.
//

import Foundation

public struct AffineTransform2D {
    public var a: Double
    public var b: Double
    public var c: Double
    public var d: Double
    public var tx: Double
    public var ty: Double
    
    public func concatenating(_ other: Self) -> Self {
        Self(
            a: a * other.a + c * other.b,
            b: b * other.a + d * other.b,
            c: a * other.c + c * other.d,
            d: b * other.c + d * other.d,
            tx: a * other.tx + c * other.ty + tx * 1,
            ty: b * other.tx + d * other.ty + ty * 1
        )
    }
    
    public func rotated(by angle: Double) -> Self {
        concatenating(.rotation(by: angle))
    }
    
    public func rotated(by angle: Measurement<UnitAngle>) -> Self {
        concatenating(.rotation(by: angle))
    }
    
    public func translatedBy(x: Double, y: Double) -> Self {
        concatenating(.translation(x: x, y: y))
    }
    
    public static let identity = Self(
        a: 1,
        b: 0,
        c: 0,
        d: 1,
        tx: 0,
        ty: 0
    )
    
    public static func rotation(by angle: Double) -> Self {
        let sine = sin(angle)
        let cosine = cos(angle)
        
        return Self(
            a: cosine,
            b: sine,
            c: -sine,
            d: cosine,
            tx: 0,
            ty: 0
        )
    }
    
    public static func rotation(by angle: Measurement<UnitAngle>) -> Self {
        let radians = angle.converted(to: .radians)
        return rotation(by: radians.value)
    }
    
    public static func translation(x: Double, y: Double) -> Self {
        Self(
            a: 1,
            b: 0,
            c: 0,
            d: 1,
            tx: x,
            ty: y
        )
    }
}
