# Capacity Atlas: finite broadcast with a common message

A Lean proof that a finite broadcast channel's common-message capacity is the maximum, over one shared input distribution, of the least receiver mutual information. The physical channel outputs a tuple with a possibly different finite alphabet at each receiver. Correlations within one channel use are arbitrary. One encoder sends a uniform message; each receiver decodes that same message using only its own output word.

Reliable codes exist at every sufficiently large blocklength, with every receiver's average error arbitrarily small. The receiver family is fixed, finite, and nonempty. There is no feedback, cooperation, or input constraint.

The proof tags each receiver's outputs into a common alphabet and establishes exact code correspondence with a compound channel. A compound decoder restricts to each receiver's tagged words. Conversely, at positive blocklength the receiver-tagged word bundles are disjoint, so `Function.extend` combines the receiver decoders into one compound decoder. Message counts, rates, and receiver errors are preserved. The prior compound-capacity theorem supplies the result; injective output relabeling preserves mutual information, and the finite-simplex optimizer supplies an attaining input law.

`CapacityAtlasCommonMessage.capacityCertificate` proves the canonical `CapacityAtlas.Channel.commonMessageBroadcastCapacityStatement` directly. The dependencies are pinned in `lakefile.toml` and `lake-manifest.json`. The proof imports CapacityAtlasCompound commit `1d5cbdc0a8cfb5d034facdb8d1e2473bb3c40ebe`; the root Atlas dependency resolves its compatible shared APIs to the new prerequisite commit and rebuilds that imported proof. The audit checks every new proof declaration's transitive axioms and exact canonical-proposition correspondence with rigid universes. Negative controls reject a different proposition and a universe-restricted certificate.

Run `lake --wfail build` and `lake exe capacity_common_message_audit`.

Primary model provenance: Thomas M. Cover, [Broadcast Channels](https://isl.stanford.edu/~cover/papers/transIT/0002cove.pdf), IEEE Transactions on Information Theory 18(1), 2–14 (January 1972), [DOI](https://doi.org/10.1109/TIT.1972.1054727). Section III, printed pages 4–5, specifies common messages, receiver-specific alphabets and decoders, uniform-message average error, and finite-receiver extension. Section IX, page 12, equation (49), discusses the max–min formula through compound-channel literature. It is not a standalone general common-message theorem proof. The tagged-output reduction here is our formal proof route.

The compound theorem's accessible original source is Lapidoth and Telatar, [The Capacity of Compound Channels With States](https://infoscience.epfl.ch/server/api/core/bitstreams/86a85253-ceb6-45ea-970f-ab907c765f69/content), IEEE Transactions on Information Theory 44(3), 973–983 (1998): equation (1), page 973; Definition 1, page 974; Theorem 1 and proof, pages 975–977, specialized to memoryless channels. Blackwell, Breiman, and Thomasian (1959) remain the historical attribution; their full original was unavailable for a new theorem locator.

AI assistance was used for research, implementation, and review. Human mathematical review of statement faithfulness and literature attribution is required before merge.

License: Apache-2.0.
