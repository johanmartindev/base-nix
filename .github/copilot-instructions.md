---
description: "AI Coding Agent Guidelines for base_nix: Nix Flake Environment & TypeScript"
applyTo: '**/*.ts, **/*.mts, **/*.cts, flake.nix, mise.toml, template.md'
---

# AI Coding Agent Guidelines for base_nix

## Project Architecture
- This project is a reproducible development environment managed by Nix Flakes (`flake.nix`).
- The main entrypoint is `flake.nix`, which defines the devShell and its dependencies for TypeScript, Node.js, Rust, and related tools.
- No application code is present by default; agents should focus on environment setup, shell configuration, and conventions.

## Environment Setup & Workflows
- Use the devShell defined in `flake.nix` for all development tasks. Enter with `use flake`.
- Key tools available in the shell: `nodejs_24`, `typescript`, `tsx`, `yarn`, `pnpm`, `corepack`, `nodemon`, `node2nix`, `ripgrep`, `jq`, `mise`, `rustc`.
- For onboarding and environment setup, see `template.md` (includes Nix, Flakes, Direnv instructions and config examples).
- Direnv integration: Add `eval "$(direnv hook zsh)"` to your shell config and use the `use_flake` function for automatic shell activation.
- Project-specific config: `mise.toml` manages tool versions and settings for Node.js and Ruby.

## Coding Standards (TypeScript)
- Use TypeScript with target set to `ESNext` and module set to `NodeNext`.
- Use Node.js (20+) ESM modules.
- Prefer built-in Node.js modules; ask before adding external dependencies.
- Use async/await and `node:util` promisify for async code.
- Use `undefined` for optional values, never `null`.
- Prefer functions over classes; keep code self-explanatory.
- Use TypeScript types and interfaces for clarity and maintainability.

## Testing
- Use Vitest for all tests.
- Write tests for new features and bug fixes; cover edge cases and error handling.
- Do not modify code just to make it testable—test the code as-is.

## Documentation & Conventions
- Update `README.md` or `template.md` for major changes or new features.
- Reference `flake.nix` for shell configuration and dependencies.
- Reference `template.md` for onboarding and environment setup.
- Reference `mise.toml` for tool version management.

## Example Workflow
1. Enter the devShell: `nix develop`
2. Use available tools (e.g., `tsc`, `tsx`, `node`, `yarn`, `rustc`) for development.
3. For new code, follow TypeScript standards above (target: ESNext, module: NodeNext).
4. For environment changes, update `flake.nix` and test with `nix develop`.
5. For onboarding, follow steps in `template.md`.

## Integration Points
- All development is intended to run inside the Nix devShell for reproducibility.
- External dependencies (TypeScript, Node.js, Rust, etc.) are managed via Nix and `mise.toml`.
- Direnv is recommended for automatic shell activation.

---
For any unclear or incomplete sections, please provide feedback to iterate and improve these instructions.
