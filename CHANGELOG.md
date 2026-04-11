# Changelog

## [0.1.2]

- Add `sessionStart` and `preToolUse` hooks: inject Ansible/Molecule workflow guidance, block `ansible-playbook` without `--check` on non-local connections, redirect `ansible-lint` and `molecule` to make targets via `modifiedArgs` (CLI v1.0.24)

## [0.1.1]

- Bump Copilot CLI version to 1.0.24; no content changes

## [0.1.0]

- Initial release: `ansible-molecule` skill migrated from user-level to plugin for versioning and distribution
- Covers Ansible role and collection development with Molecule/Podman, ansible-lint, yamllint, and Make-centric workflow
