# swift-sector-cyclic-primitives

The lossless projection between `Sector.Quadrant` and the cyclic group `Cyclic.Group.Static<4>`
(Z/4Z) — a per-carrier bridge ([MOD-014]) adding `.cyclic` and `init(cyclic:)` so the bare
`Sector.Quadrant` enum carries no cyclic-group dependency. `+1` rotates counter-clockwise
(I → II → III → IV).

```swift
import Sector_Cyclic_Primitives

Sector.Quadrant.I.cyclic                                  // Z/4Z element 0
Sector.Quadrant(cyclic: Sector.Quadrant.I.cyclic + .one)  // .II
```

## License

Apache License 2.0. See [LICENSE](LICENSE.md).
