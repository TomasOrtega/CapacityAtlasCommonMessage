/-
Copyright 2026 The Capacity Atlas Authors
Licensed under the Apache License, Version 2.0 (the "License").
See the License for the specific language governing permissions and limitations.
-/

import CapacityAtlasCompound
import CapacityAtlasCommonMessage.Reduction
import CapacityAtlas.Channels.CommonMessageBroadcast

namespace CapacityAtlasCommonMessage

open CapacityAtlas

variable {J X : Type*} {Y : J → Type*}
variable [Fintype J] [DecidableEq J] [Fintype X] [∀ j, Fintype (Y j)]

omit [DecidableEq J] in
/-- A common message has the max–min capacity across the receiver marginals. -/
theorem commonMessageCapacity [Nonempty J] [Nonempty X]
    (channels : (j : J) → FiniteChannel X (Y j)) :
    CommonMessageBroadcast.operationalCapacityBits channels =
      CommonMessageBroadcast.informationCapacityBits channels := by
  rw [CommonMessageBroadcast.operationalCapacityBits_eq_taggedChannels,
    CapacityAtlasCompound.compoundCapacity,
    CommonMessageBroadcast.informationCapacityBits_taggedChannels]

omit [DecidableEq J] in
/-- One shared input law attains the displayed operational capacity. -/
theorem exists_capacityAchieving_input [Nonempty J] [Nonempty X]
    (channels : (j : J) → FiniteChannel X (Y j)) :
    ∃ input : FiniteDistribution X,
      CommonMessageBroadcast.worstInformationBits channels input =
        CommonMessageBroadcast.operationalCapacityBits channels := by
  rw [commonMessageCapacity channels]
  exact CommonMessageBroadcast.exists_capacityAchieving_input channels

/-- Direct evidence for the canonical joint broadcast-channel proposition. -/
theorem capacityCertificate [Nonempty J] [Nonempty X]
    (channel : FiniteChannel X ((j : J) → Y j)) :
    Channel.commonMessageBroadcastCapacityStatement channel :=
  commonMessageCapacity (CommonMessageBroadcast.receiverChannels channel)

end CapacityAtlasCommonMessage
