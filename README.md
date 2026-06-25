# Sector Cyclic Primitives

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

The lossless projection between the plane quadrant `Sector.Quadrant` and the cyclic group ℤ/4ℤ — a per-carrier bridge that adds `.cyclic` and `init(cyclic:)` so the bare `Sector.Quadrant` enum carries no cyclic-group dependency of its own.

---

## Quick Start

A plane has four quadrants (I, II, III, IV); rotating by a right angle is exactly addition in ℤ/4ℤ. This package projects `Sector.Quadrant` onto `Cyclic.Group.Static<4>.Element` in standard math numbering (I = 0), so quadrant rotation becomes group arithmetic and round-trips losslessly.

```swift
import Sector_Cyclic_Primitives

// Project a plane quadrant onto ℤ/4ℤ in standard math numbering (I = 0).
let element = Sector.Quadrant.I.cyclic                 // ℤ/4ℤ element 0

// Group addition rotates counter-clockwise; +1 takes I → II.
let next = Sector.Quadrant(cyclic: element + .one)     // .II

// Rotation wraps: IV + 1 returns to I.
let wrapped = Sector.Quadrant(cyclic: Sector.Quadrant.IV.cyclic + .one)  // .I

// The projection round-trips for every quadrant.
for quadrant in Sector.Quadrant.allCases {
    assert(Sector.Quadrant(cyclic: quadrant.cyclic) == quadrant)
}
```

The bridge lives in this package rather than on `Sector.Quadrant` itself: the enum stays free of any cyclic-group dependency, and consumers that need the algebra opt in by importing this module — which also re-exports `Sector Primitives` and `Cyclic Primitives`.

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-primitives/swift-sector-cyclic-primitives.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Sector Cyclic Primitives", package: "swift-sector-cyclic-primitives"),
    ]
)
```

---

## Architecture

One library product (plus its test-support re-export). Depends only on the `Sector`, `Cyclic`, and `Ordinal` primitives.

| Product | Target | Purpose |
|---------|--------|---------|
| `Sector Cyclic Primitives` | `Sources/Sector Cyclic Primitives/` | The `Sector.Quadrant` ⇄ `Cyclic.Group.Static<4>.Element` projection: the `.cyclic` property and `init(cyclic:)`. Re-exports `Sector Primitives` and `Cyclic Primitives`. |
| `Sector Cyclic Primitives Test Support` | `Tests/Support/` | Re-exports the main target for test consumers. |

Foundation-free.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 26 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
