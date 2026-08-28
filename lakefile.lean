import Lake
open Lake DSL

package OmegaZero34 where
  leanOptions := #[
    ⟨`pp.unicode.fun, true⟩,
    ⟨`autoImplicit, false⟩,
    ⟨`relaxedAutoImplicit, false⟩
  ]

require mathlib from git "https://github.com/leanprover-community/mathlib4.git" @ "v4.30.0-rc1"

@[default_target]
lean_lib OmegaZero34 where
  roots := #[`OmegaZero34]
  globs := #[.submodules `OmegaZero34]
