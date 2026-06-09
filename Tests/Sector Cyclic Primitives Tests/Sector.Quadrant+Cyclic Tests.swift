// Sector.Quadrant+Cyclic Tests.swift

import Testing

import Sector_Cyclic_Primitives

@Suite
struct `Sector.Quadrant Cyclic projection` {
    @Test
    func `projection round-trips`() {
        for quadrant in Sector.Quadrant.allCases {
            #expect(Sector.Quadrant(cyclic: quadrant.cyclic) == quadrant)
        }
    }

    @Test
    func `plus one rotates counter-clockwise`() {
        #expect(Sector.Quadrant(cyclic: Sector.Quadrant.I.cyclic + .one) == .II)
        #expect(Sector.Quadrant(cyclic: Sector.Quadrant.IV.cyclic + .one) == .I)
    }
}
