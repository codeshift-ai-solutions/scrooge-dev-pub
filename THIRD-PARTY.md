# Third-party inventory

**Status:** generated, not audited. This is a bill of materials and a licence *listing*; it is not a legal review and no claim of licence compliance is made.

## What this is and is not

- Crate licences are the SPDX strings **declared in each crate's own `Cargo.toml` metadata**, read from the locked graph (`Cargo.lock`). They were not checked against the crates' source or licence files.
- The list covers every package in the locked graph, including platform-specific and build-only ones, so it is a superset of what any single binary links.
- Model weights are **not in this repository**; they are fetched on demand from the pinned revisions below. Their licences are what our own manifests (`docs/providers/manifests/`) claim; nothing here re-verified them against the upstream repositories.
- Not covered: system libraries or the base image of the (never built) Docker image, the Rust toolchain, and hosted services.

## Regenerate

```sh
cargo metadata --format-version 1 --locked --offline > /tmp/meta.json
python3 -I docs/release/gen_third_party.py /tmp/meta.json docs/providers/manifests > docs/release/THIRD-PARTY.md
```
Output is deterministic (sorted); regenerate whenever `Cargo.lock` or a model manifest changes. Nothing checks that this file is current.

## Summary

- Workspace crates (ours): 24
- External crates: 325, all from the crates.io registry
- External crates with no licence declared: 0
- Distinct licence expressions: 28
- Crates whose expression mentions a copyleft-family licence: 2

Copyleft-family mentions (each needs a human reading of the expression; an `OR` with a permissive alternative is a choice, an `AND` is a requirement):

| Crate | Version | Declared expression |
|---|---|---|
| r-efi | 5.3.0 | `MIT OR Apache-2.0 OR LGPL-2.1-or-later` |
| r-efi | 6.0.0 | `MIT OR Apache-2.0 OR LGPL-2.1-or-later` |

## Licence expressions

| Count | Expression |
|---|---|
| 188 | `MIT OR Apache-2.0` |
| 40 | `MIT` |
| 18 | `Unicode-3.0` |
| 16 | `MIT/Apache-2.0` |
| 14 | `Apache-2.0 OR MIT` |
| 9 | `Apache-2.0` |
| 6 | `Unlicense OR MIT` |
| 5 | `Apache-2.0 WITH LLVM-exception OR Apache-2.0 OR MIT` |
| 2 | `Apache-2.0 OR ISC OR MIT` |
| 2 | `Apache-2.0 OR MIT OR Zlib` |
| 2 | `Apache-2.0/MIT` |
| 2 | `BSD-2-Clause OR Apache-2.0 OR MIT` |
| 2 | `CDLA-Permissive-2.0` |
| 2 | `ISC` |
| 2 | `MIT OR Apache-2.0 OR LGPL-2.1-or-later` |
| 2 | `Unlicense/MIT` |
| 2 | `Zlib` |
| 1 | `(MIT OR Apache-2.0) AND Unicode-3.0` |
| 1 | `0BSD OR MIT OR Apache-2.0` |
| 1 | `Apache-2.0 / MIT` |
| 1 | `Apache-2.0 AND ISC` |
| 1 | `Apache-2.0 OR BSL-1.0` |
| 1 | `BSD-3-Clause` |
| 1 | `BlueOak-1.0.0 OR MIT OR Apache-2.0` |
| 1 | `CC0-1.0 OR Apache-2.0 OR Apache-2.0 WITH LLVM-exception` |
| 1 | `CC0-1.0 OR MIT-0 OR Apache-2.0` |
| 1 | `MIT / Apache-2.0` |
| 1 | `MIT OR Zlib OR Apache-2.0` |

## Models (pinned, fetched on demand)

| Provider | Declared licence | Commercial use (manifest claim) | Source | Revision |
|---|---|---|---|---|
| laya-onnx-english | Apache-2.0 | True | receptron/laya-onnx | `68f27dfe5a27` |
| minilm-l6-v2 | Apache-2.0 | True | cross-encoder/ms-marco-MiniLM-L6-v2 | `233902d25c44` |
| modernbert-base-zeroshot-v2 | Apache-2.0 | True | MoritzLaurer/ModernBERT-base-zeroshot-v2.0 | `d421c4545a43` |
| modernbert-large-zeroshot-v2 | Apache-2.0 | True | MoritzLaurer/ModernBERT-large-zeroshot-v2.0 | `a51e07b52429` |
| mxbai-rerank-xsmall-v1 | Apache-2.0 | True | mixedbread-ai/mxbai-rerank-xsmall-v1 | `b5c6e9da73ab` |
| tinybert-l2 | Apache-2.0 | True | cross-encoder/ms-marco-TinyBERT-L2-v2 | `81d1926f67cb` |
| xtremedistil-l6-h256 | MIT | True | MoritzLaurer/xtremedistil-l6-h256-zeroshot-v1.1-all-33 | `c07f66d9cbf7` |

## Crates

| Crate | Version | Declared licence |
|---|---|---|
| adler2 | 2.0.1 | `0BSD OR MIT OR Apache-2.0` |
| ahash | 0.8.12 | `MIT OR Apache-2.0` |
| aho-corasick | 1.1.5 | `Unlicense OR MIT` |
| anstream | 1.0.0 | `MIT OR Apache-2.0` |
| anstyle | 1.0.14 | `MIT OR Apache-2.0` |
| anstyle-parse | 1.0.0 | `MIT OR Apache-2.0` |
| anstyle-query | 1.1.5 | `MIT OR Apache-2.0` |
| anstyle-wincon | 3.0.11 | `MIT OR Apache-2.0` |
| anyhow | 1.0.104 | `MIT OR Apache-2.0` |
| anymap3 | 1.1.0 | `BlueOak-1.0.0 OR MIT OR Apache-2.0` |
| arrayvec | 0.7.8 | `MIT OR Apache-2.0` |
| assert_cmd | 2.2.2 | `MIT OR Apache-2.0` |
| autocfg | 1.5.1 | `Apache-2.0 OR MIT` |
| base64 | 0.13.1 | `MIT/Apache-2.0` |
| base64 | 0.23.1 | `MIT OR Apache-2.0` |
| bit-set | 0.11.1 | `Apache-2.0 OR MIT` |
| bit-set | 0.8.0 | `Apache-2.0 OR MIT` |
| bit-vec | 0.10.1 | `Apache-2.0 OR MIT` |
| bit-vec | 0.8.0 | `Apache-2.0 OR MIT` |
| bitflags | 2.13.2 | `MIT OR Apache-2.0` |
| blake3 | 1.8.7 | `CC0-1.0 OR Apache-2.0 OR Apache-2.0 WITH LLVM-exception` |
| block-buffer | 0.10.4 | `MIT OR Apache-2.0` |
| borsh | 1.8.1 | `MIT OR Apache-2.0` |
| borsh-derive | 1.8.1 | `Apache-2.0` |
| bstr | 1.13.1 | `MIT OR Apache-2.0` |
| bumpalo | 3.20.3 | `MIT OR Apache-2.0` |
| byteorder | 1.5.0 | `Unlicense OR MIT` |
| bytes | 1.12.1 | `MIT` |
| camino | 1.2.6 | `MIT OR Apache-2.0` |
| cargo-platform | 0.3.3 | `MIT OR Apache-2.0` |
| cargo_metadata | 0.23.1 | `MIT` |
| castaway | 0.2.4 | `MIT` |
| cc | 1.4.7 | `MIT OR Apache-2.0` |
| cfg-if | 1.0.5 | `MIT OR Apache-2.0` |
| cfg_aliases | 0.2.2 | `MIT` |
| chacha20 | 0.10.2 | `MIT OR Apache-2.0` |
| clap | 4.6.7 | `MIT OR Apache-2.0` |
| clap_builder | 4.6.7 | `MIT OR Apache-2.0` |
| clap_derive | 4.6.7 | `MIT OR Apache-2.0` |
| clap_lex | 1.1.1 | `MIT OR Apache-2.0` |
| colorchoice | 1.0.5 | `MIT OR Apache-2.0` |
| combine | 4.6.8 | `MIT` |
| compact_str | 0.9.1 | `MIT` |
| constant_time_eq | 0.4.2 | `CC0-1.0 OR MIT-0 OR Apache-2.0` |
| core-foundation | 0.10.1 | `MIT OR Apache-2.0` |
| core-foundation-sys | 0.8.7 | `MIT OR Apache-2.0` |
| cpufeatures | 0.2.17 | `MIT OR Apache-2.0` |
| cpufeatures | 0.3.1 | `MIT OR Apache-2.0` |
| crc32fast | 1.5.2 | `MIT OR Apache-2.0` |
| crossbeam-deque | 0.8.8 | `MIT OR Apache-2.0` |
| crossbeam-epoch | 0.9.21 | `MIT OR Apache-2.0` |
| crossbeam-utils | 0.8.23 | `MIT OR Apache-2.0` |
| crunchy | 0.2.4 | `MIT` |
| crypto-common | 0.1.7 | `MIT OR Apache-2.0` |
| daachorse | 3.0.3 | `MIT OR Apache-2.0` |
| darling | 0.20.11 | `MIT` |
| darling_core | 0.20.11 | `MIT` |
| darling_macro | 0.20.11 | `MIT` |
| dary_heap | 0.3.9 | `MIT OR Apache-2.0` |
| derive-new | 0.7.0 | `MIT` |
| derive_builder | 0.20.2 | `MIT OR Apache-2.0` |
| derive_builder_core | 0.20.2 | `MIT OR Apache-2.0` |
| derive_builder_macro | 0.20.2 | `MIT OR Apache-2.0` |
| difflib | 0.4.0 | `MIT` |
| digest | 0.10.7 | `MIT OR Apache-2.0` |
| displaydoc | 0.2.7 | `MIT OR Apache-2.0` |
| downcast-rs | 2.0.2 | `MIT OR Apache-2.0` |
| dyn-clone | 1.0.20 | `MIT OR Apache-2.0` |
| dyn-hash | 1.0.0 | `MIT OR Apache-2.0` |
| either | 1.18.0 | `MIT OR Apache-2.0` |
| equivalent | 1.0.2 | `Apache-2.0 OR MIT` |
| erased-serde | 0.4.10 | `MIT OR Apache-2.0` |
| errno | 0.3.14 | `MIT OR Apache-2.0` |
| esaxx-rs | 0.1.10 | `Apache-2.0` |
| fallible-iterator | 0.3.0 | `MIT/Apache-2.0` |
| fallible-streaming-iterator | 0.1.9 | `MIT/Apache-2.0` |
| fancy-regex | 0.17.0 | `MIT` |
| fastrand | 2.5.0 | `Apache-2.0 OR MIT` |
| filetime | 0.2.29 | `MIT/Apache-2.0` |
| find-msvc-tools | 0.1.13 | `MIT OR Apache-2.0` |
| flate2 | 1.1.10 | `MIT OR Apache-2.0` |
| float-cmp | 0.10.0 | `MIT` |
| float-ord | 0.3.2 | `MIT / Apache-2.0` |
| fnv | 1.0.7 | `Apache-2.0 / MIT` |
| foldhash | 0.2.0 | `Zlib` |
| generic-array | 0.14.7 | `MIT` |
| getrandom | 0.2.17 | `MIT OR Apache-2.0` |
| getrandom | 0.3.4 | `MIT OR Apache-2.0` |
| getrandom | 0.4.3 | `MIT OR Apache-2.0` |
| gherkin | 0.16.0 | `MIT OR Apache-2.0` |
| globset | 0.4.20 | `Unlicense OR MIT` |
| half | 2.7.1 | `MIT OR Apache-2.0` |
| hashbrown | 0.16.1 | `MIT OR Apache-2.0` |
| hashbrown | 0.17.1 | `MIT OR Apache-2.0` |
| hashlink | 0.12.2 | `MIT OR Apache-2.0` |
| heck | 0.5.0 | `MIT OR Apache-2.0` |
| hex | 0.4.3 | `MIT OR Apache-2.0` |
| http | 1.5.0 | `MIT OR Apache-2.0` |
| httparse | 1.10.1 | `MIT OR Apache-2.0` |
| icu_collections | 2.3.0 | `Unicode-3.0` |
| icu_locale_core | 2.3.0 | `Unicode-3.0` |
| icu_locale_fallback | 2.3.0 | `Unicode-3.0` |
| icu_locale_fallback_data | 2.3.0 | `Unicode-3.0` |
| icu_provider | 2.3.1 | `Unicode-3.0` |
| icu_segmenter | 2.3.0 | `Unicode-3.0` |
| icu_segmenter_data | 2.3.0 | `Unicode-3.0` |
| ident_case | 1.0.1 | `MIT/Apache-2.0` |
| ignore | 0.4.33 | `Unlicense OR MIT` |
| indexmap | 2.14.2 | `Apache-2.0 OR MIT` |
| inventory | 0.3.24 | `MIT OR Apache-2.0` |
| is_terminal_polyfill | 1.70.2 | `MIT OR Apache-2.0` |
| itertools | 0.14.0 | `MIT OR Apache-2.0` |
| itertools | 0.15.0 | `MIT OR Apache-2.0` |
| itoa | 1.0.18 | `MIT OR Apache-2.0` |
| jni | 0.22.4 | `MIT OR Apache-2.0` |
| jni-macros | 0.22.4 | `MIT OR Apache-2.0` |
| jni-sys | 0.4.1 | `MIT OR Apache-2.0` |
| jni-sys-macros | 0.4.1 | `MIT OR Apache-2.0` |
| js-sys | 0.3.105 | `MIT OR Apache-2.0` |
| lazy_static | 1.5.0 | `MIT OR Apache-2.0` |
| libc | 0.2.189 | `MIT OR Apache-2.0` |
| libm | 0.2.16 | `MIT` |
| libsqlite3-sys | 0.38.2 | `MIT` |
| linux-raw-sys | 0.12.1 | `Apache-2.0 WITH LLVM-exception OR Apache-2.0 OR MIT` |
| litemap | 0.8.3 | `Unicode-3.0` |
| lock_api | 0.4.14 | `MIT OR Apache-2.0` |
| log | 0.4.34 | `MIT OR Apache-2.0` |
| macro_rules_attribute | 0.2.3 | `Apache-2.0 OR MIT OR Zlib` |
| macro_rules_attribute-proc_macro | 0.2.3 | `Apache-2.0 OR MIT OR Zlib` |
| maplit | 1.0.2 | `MIT/Apache-2.0` |
| matrixmultiply | 0.3.11 | `MIT/Apache-2.0` |
| memchr | 2.8.3 | `Unlicense OR MIT` |
| memmap2 | 0.9.11 | `MIT OR Apache-2.0` |
| memo-map | 0.3.4 | `Apache-2.0` |
| minijinja | 2.24.0 | `Apache-2.0` |
| minimal-lexical | 0.2.1 | `MIT/Apache-2.0` |
| miniz_oxide | 0.9.1 | `MIT OR Zlib OR Apache-2.0` |
| monostate | 0.1.18 | `MIT OR Apache-2.0` |
| monostate-impl | 0.1.18 | `MIT OR Apache-2.0` |
| ndarray | 0.17.2 | `MIT OR Apache-2.0` |
| nom | 7.1.3 | `MIT` |
| nom | 8.0.0 | `MIT` |
| nom-language | 0.1.0 | `MIT` |
| normalize-line-endings | 0.3.0 | `Apache-2.0` |
| num-bigint | 0.4.8 | `MIT OR Apache-2.0` |
| num-complex | 0.4.6 | `MIT OR Apache-2.0` |
| num-integer | 0.1.47 | `MIT OR Apache-2.0` |
| num-rational | 0.4.2 | `MIT OR Apache-2.0` |
| num-traits | 0.2.19 | `MIT OR Apache-2.0` |
| once_cell | 1.21.4 | `MIT OR Apache-2.0` |
| once_cell_polyfill | 1.70.2 | `MIT OR Apache-2.0` |
| openssl-probe | 0.2.1 | `MIT OR Apache-2.0` |
| parking_lot | 0.12.5 | `MIT OR Apache-2.0` |
| parking_lot_core | 0.9.12 | `MIT OR Apache-2.0` |
| paste | 1.0.15 | `MIT OR Apache-2.0` |
| pastey | 0.2.3 | `MIT OR Apache-2.0` |
| peg | 0.6.3 | `MIT` |
| peg-macros | 0.6.3 | `MIT` |
| peg-runtime | 0.6.3 | `MIT` |
| percent-encoding | 2.3.2 | `MIT OR Apache-2.0` |
| pkg-config | 0.3.34 | `MIT OR Apache-2.0` |
| portable-atomic | 1.15.0 | `Apache-2.0 OR MIT` |
| portable-atomic-util | 0.2.8 | `Apache-2.0 OR MIT` |
| potential_utf | 0.1.6 | `Unicode-3.0` |
| ppv-lite86 | 0.2.21 | `MIT OR Apache-2.0` |
| predicates | 3.1.4 | `MIT OR Apache-2.0` |
| predicates-core | 1.0.10 | `MIT OR Apache-2.0` |
| predicates-tree | 1.0.13 | `MIT OR Apache-2.0` |
| primal-check | 0.3.4 | `MIT OR Apache-2.0` |
| proc-macro-crate | 3.5.0 | `MIT OR Apache-2.0` |
| proc-macro2 | 1.0.107 | `MIT OR Apache-2.0` |
| proptest | 1.11.0 | `MIT OR Apache-2.0` |
| prost | 0.14.4 | `Apache-2.0` |
| prost-derive | 0.14.4 | `Apache-2.0` |
| quick-error | 1.2.3 | `MIT/Apache-2.0` |
| quote | 1.0.47 | `MIT OR Apache-2.0` |
| r-efi | 5.3.0 | `MIT OR Apache-2.0 OR LGPL-2.1-or-later` |
| r-efi | 6.0.0 | `MIT OR Apache-2.0 OR LGPL-2.1-or-later` |
| rand | 0.10.3 | `MIT OR Apache-2.0` |
| rand | 0.9.5 | `MIT OR Apache-2.0` |
| rand_chacha | 0.9.0 | `MIT OR Apache-2.0` |
| rand_core | 0.10.1 | `MIT OR Apache-2.0` |
| rand_core | 0.9.5 | `MIT OR Apache-2.0` |
| rand_distr | 0.6.0 | `MIT OR Apache-2.0` |
| rand_xorshift | 0.4.0 | `MIT OR Apache-2.0` |
| rawpointer | 0.2.1 | `MIT/Apache-2.0` |
| rayon | 1.12.0 | `MIT OR Apache-2.0` |
| rayon-cond | 0.4.0 | `Apache-2.0/MIT` |
| rayon-core | 1.13.0 | `MIT OR Apache-2.0` |
| redox_syscall | 0.5.18 | `MIT` |
| regex | 1.13.1 | `MIT OR Apache-2.0` |
| regex-automata | 0.4.18 | `MIT OR Apache-2.0` |
| regex-syntax | 0.8.11 | `MIT OR Apache-2.0` |
| ring | 0.17.14 | `Apache-2.0 AND ISC` |
| rsqlite-vfs | 0.1.1 | `MIT` |
| rusqlite | 0.40.2 | `MIT` |
| rustc_version | 0.4.1 | `MIT OR Apache-2.0` |
| rustfft | 6.4.1 | `MIT OR Apache-2.0` |
| rustix | 1.1.5 | `Apache-2.0 WITH LLVM-exception OR Apache-2.0 OR MIT` |
| rustls | 0.23.45 | `Apache-2.0 OR ISC OR MIT` |
| rustls-native-certs | 0.8.4 | `Apache-2.0 OR ISC OR MIT` |
| rustls-pki-types | 1.15.1 | `MIT OR Apache-2.0` |
| rustls-platform-verifier | 0.7.0 | `MIT OR Apache-2.0` |
| rustls-platform-verifier-android | 0.1.1 | `MIT OR Apache-2.0` |
| rustls-webpki | 0.103.15 | `ISC` |
| rustversion | 1.0.23 | `MIT OR Apache-2.0` |
| rusty-fork | 0.3.1 | `MIT/Apache-2.0` |
| ryu | 1.0.23 | `Apache-2.0 OR BSL-1.0` |
| same-file | 1.0.6 | `Unlicense/MIT` |
| schannel | 0.1.29 | `MIT` |
| scopeguard | 1.2.0 | `MIT OR Apache-2.0` |
| security-framework | 3.7.0 | `MIT OR Apache-2.0` |
| security-framework-sys | 2.17.0 | `MIT OR Apache-2.0` |
| semver | 1.0.28 | `MIT OR Apache-2.0` |
| serde | 1.0.229 | `MIT OR Apache-2.0` |
| serde_core | 1.0.229 | `MIT OR Apache-2.0` |
| serde_derive | 1.0.229 | `MIT OR Apache-2.0` |
| serde_json | 1.0.151 | `MIT OR Apache-2.0` |
| serde_spanned | 1.1.1 | `MIT OR Apache-2.0` |
| sha2 | 0.10.9 | `MIT OR Apache-2.0` |
| shlex | 2.0.1 | `MIT OR Apache-2.0` |
| signal-hook | 0.3.18 | `Apache-2.0/MIT` |
| signal-hook-registry | 1.4.8 | `MIT OR Apache-2.0` |
| simd-adler32 | 0.3.10 | `MIT` |
| simd_cesu8 | 1.2.0 | `Apache-2.0 OR MIT` |
| simdutf8 | 0.1.5 | `MIT OR Apache-2.0` |
| smallvec | 1.16.1 | `MIT OR Apache-2.0` |
| smawk | 0.3.3 | `MIT` |
| spm_precompiled | 0.1.4 | `Apache-2.0` |
| sqlite-wasm-rs | 0.5.5 | `MIT` |
| stable_deref_trait | 1.2.1 | `MIT OR Apache-2.0` |
| static_assertions | 1.1.0 | `MIT OR Apache-2.0` |
| streaming-iterator | 0.1.9 | `MIT OR Apache-2.0` |
| strength_reduce | 0.2.4 | `MIT OR Apache-2.0` |
| string-interner | 0.20.0 | `MIT/Apache-2.0` |
| strsim | 0.11.1 | `MIT` |
| subtle | 2.6.1 | `BSD-3-Clause` |
| syn | 2.0.119 | `MIT OR Apache-2.0` |
| syn | 3.0.6 | `MIT OR Apache-2.0` |
| synstructure | 0.14.0 | `MIT` |
| tar | 0.4.46 | `MIT OR Apache-2.0` |
| tempfile | 3.27.0 | `MIT OR Apache-2.0` |
| termtree | 0.5.1 | `MIT` |
| textwrap | 0.16.4 | `MIT` |
| thiserror | 2.0.20 | `MIT OR Apache-2.0` |
| thiserror-impl | 2.0.20 | `MIT OR Apache-2.0` |
| tinystr | 0.8.4 | `Unicode-3.0` |
| tokenizers | 0.23.2 | `Apache-2.0` |
| toml | 0.9.12+spec-1.1.0 | `MIT OR Apache-2.0` |
| toml_datetime | 0.7.5+spec-1.1.0 | `MIT OR Apache-2.0` |
| toml_datetime | 1.1.1+spec-1.1.0 | `MIT OR Apache-2.0` |
| toml_edit | 0.25.15+spec-1.1.0 | `MIT OR Apache-2.0` |
| toml_parser | 1.1.3+spec-1.1.0 | `MIT OR Apache-2.0` |
| toml_writer | 1.1.2+spec-1.1.0 | `MIT OR Apache-2.0` |
| tract-core | 0.23.8 | `MIT OR Apache-2.0` |
| tract-data | 0.23.8 | `MIT OR Apache-2.0` |
| tract-extra | 0.23.8 | `MIT OR Apache-2.0` |
| tract-hir | 0.23.8 | `MIT OR Apache-2.0` |
| tract-linalg | 0.23.8 | `MIT OR Apache-2.0` |
| tract-nnef | 0.23.8 | `MIT OR Apache-2.0` |
| tract-onnx | 0.23.8 | `MIT OR Apache-2.0` |
| tract-onnx-opl | 0.23.8 | `MIT OR Apache-2.0` |
| tract-transformers | 0.23.8 | `MIT OR Apache-2.0` |
| transpose | 0.2.3 | `MIT OR Apache-2.0` |
| tree-sitter | 0.27.0 | `MIT` |
| tree-sitter-language | 0.1.8 | `MIT` |
| tree-sitter-rust | 0.24.2 | `MIT` |
| typed-builder | 0.23.2 | `MIT OR Apache-2.0` |
| typed-builder-macro | 0.23.2 | `MIT OR Apache-2.0` |
| typeid | 1.0.3 | `MIT OR Apache-2.0` |
| typenum | 1.20.1 | `MIT OR Apache-2.0` |
| unarray | 0.1.4 | `MIT OR Apache-2.0` |
| unicode-ident | 1.0.26 | `(MIT OR Apache-2.0) AND Unicode-3.0` |
| unicode-normalization-alignments | 0.1.12 | `MIT/Apache-2.0` |
| unicode-segmentation | 1.13.3 | `MIT OR Apache-2.0` |
| unicode-width | 0.2.2 | `MIT OR Apache-2.0` |
| unicode_categories | 0.1.1 | `MIT OR Apache-2.0` |
| untrusted | 0.9.0 | `ISC` |
| ureq | 3.4.2 | `MIT OR Apache-2.0` |
| ureq-proto | 0.6.4 | `MIT OR Apache-2.0` |
| utf8-zero | 0.8.1 | `MIT OR Apache-2.0` |
| utf8_iter | 1.0.4 | `Apache-2.0 OR MIT` |
| utf8parse | 0.2.2 | `Apache-2.0 OR MIT` |
| vcpkg | 0.2.15 | `MIT/Apache-2.0` |
| version_check | 0.9.5 | `MIT/Apache-2.0` |
| wait-timeout | 0.2.1 | `MIT/Apache-2.0` |
| walkdir | 2.5.0 | `Unlicense/MIT` |
| wasi | 0.11.1+wasi-snapshot-preview1 | `Apache-2.0 WITH LLVM-exception OR Apache-2.0 OR MIT` |
| wasip2 | 1.0.4+wasi-0.2.12 | `Apache-2.0 WITH LLVM-exception OR Apache-2.0 OR MIT` |
| wasm-bindgen | 0.2.128 | `MIT OR Apache-2.0` |
| wasm-bindgen-macro | 0.2.128 | `MIT OR Apache-2.0` |
| wasm-bindgen-macro-support | 0.2.128 | `MIT OR Apache-2.0` |
| wasm-bindgen-shared | 0.2.128 | `MIT OR Apache-2.0` |
| webpki-root-certs | 1.0.9 | `CDLA-Permissive-2.0` |
| webpki-roots | 1.0.9 | `CDLA-Permissive-2.0` |
| winapi-util | 0.1.11 | `Unlicense OR MIT` |
| windows-link | 0.2.1 | `MIT OR Apache-2.0` |
| windows-sys | 0.52.0 | `MIT OR Apache-2.0` |
| windows-sys | 0.61.2 | `MIT OR Apache-2.0` |
| windows-targets | 0.52.6 | `MIT OR Apache-2.0` |
| windows_aarch64_gnullvm | 0.52.6 | `MIT OR Apache-2.0` |
| windows_aarch64_msvc | 0.52.6 | `MIT OR Apache-2.0` |
| windows_i686_gnu | 0.52.6 | `MIT OR Apache-2.0` |
| windows_i686_gnullvm | 0.52.6 | `MIT OR Apache-2.0` |
| windows_i686_msvc | 0.52.6 | `MIT OR Apache-2.0` |
| windows_x86_64_gnu | 0.52.6 | `MIT OR Apache-2.0` |
| windows_x86_64_gnullvm | 0.52.6 | `MIT OR Apache-2.0` |
| windows_x86_64_msvc | 0.52.6 | `MIT OR Apache-2.0` |
| winnow | 0.7.15 | `MIT` |
| winnow | 1.0.4 | `MIT` |
| wit-bindgen | 0.57.1 | `Apache-2.0 WITH LLVM-exception OR Apache-2.0 OR MIT` |
| writeable | 0.6.4 | `Unicode-3.0` |
| xattr | 1.6.1 | `MIT OR Apache-2.0` |
| yoke | 0.8.3 | `Unicode-3.0` |
| yoke-derive | 0.8.3 | `Unicode-3.0` |
| zerocopy | 0.8.57 | `BSD-2-Clause OR Apache-2.0 OR MIT` |
| zerocopy-derive | 0.8.57 | `BSD-2-Clause OR Apache-2.0 OR MIT` |
| zerofrom | 0.1.8 | `Unicode-3.0` |
| zerofrom-derive | 0.1.8 | `Unicode-3.0` |
| zeroize | 1.9.0 | `Apache-2.0 OR MIT` |
| zerotrie | 0.2.5 | `Unicode-3.0` |
| zerovec | 0.11.8 | `Unicode-3.0` |
| zerovec-derive | 0.11.6 | `Unicode-3.0` |
| zlib-rs | 0.6.8 | `Zlib` |
| zmij | 1.0.23 | `MIT` |
