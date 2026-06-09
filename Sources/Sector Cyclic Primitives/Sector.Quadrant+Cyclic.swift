// Sector.Quadrant+Cyclic.swift
// Lossless projection between Sector.Quadrant and the cyclic group Z/4Z.

public import Sector_Primitives
public import Cyclic_Primitives
public import Ordinal_Primitives

extension Sector.Quadrant {
    /// This quadrant as an element of `Cyclic.Group.Static<4>` (Z/4Z), in standard math
    /// numbering (I = 0), so `+1` rotates counter-clockwise (I → II → III → IV).
    @inlinable
    public var cyclic: Cyclic.Group.Static<4>.Element {
        let rank: UInt8 =
            switch self {
            case .I: 0
            case .II: 1
            case .III: 2
            case .IV: 3
            }
        // rank is always in 0..<4, so construction never fails.
        return try! Cyclic.Group.Static<4>.Element(Ordinal(rank))
    }

    /// The plane quadrant corresponding to a Z/4Z element.
    @inlinable
    public init(cyclic: Cyclic.Group.Static<4>.Element) {
        switch Int(bitPattern: Ordinal(cyclic)) {
        case 0: self = .I
        case 1: self = .II
        case 2: self = .III
        default: self = .IV
        }
    }
}
