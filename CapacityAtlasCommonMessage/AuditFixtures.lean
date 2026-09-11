/-
Copyright 2026 The Capacity Atlas Authors
Licensed under the Apache License, Version 2.0 (the "License").
See the License for the specific language governing permissions and limitations.
-/

import CapacityAtlasCommonMessage

namespace CapacityAtlasCommonMessage.AuditFixtures

/-- This valid theorem deliberately restricts all alphabet universes. -/
theorem universeZeroCertificate {J X : Type} {Y : J → Type}
    [Fintype J] [DecidableEq J] [Fintype X] [∀ j, Fintype (Y j)]
    [Nonempty J] [Nonempty X] (channel : CapacityAtlas.FiniteChannel X ((j : J) → Y j)) :
    CapacityAtlas.Channel.commonMessageBroadcastCapacityStatement channel :=
  CapacityAtlasCommonMessage.capacityCertificate channel

end CapacityAtlasCommonMessage.AuditFixtures
