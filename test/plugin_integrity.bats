#!/usr/bin/env bats

PLUGIN_DIR="$BATS_TEST_DIRNAME/.."

@test "plugin.json exists with required fields" {
  [ -f "$PLUGIN_DIR/plugin.json" ]
  jq -e '.name' "$PLUGIN_DIR/plugin.json" >/dev/null
  jq -e '.version' "$PLUGIN_DIR/plugin.json" >/dev/null
}

@test "skills directories contain SKILL.md" {
  local skills_dir="$PLUGIN_DIR/skills"
  [ -d "$skills_dir" ] || skip "no skills dir"
  for dir in "$skills_dir"/*/; do
    [ -d "$dir" ] || continue
    [ -f "$dir/SKILL.md" ] || { echo "missing SKILL.md in $dir"; false; }
  done
}

@test "agent files have required frontmatter" {
  local agents_dir="$PLUGIN_DIR/agents"
  [ -d "$agents_dir" ] || skip "no agents dir"
  for f in "$agents_dir"/*.agent.md; do
    [ -f "$f" ] || continue
    head -1 "$f" | grep -q '^---' || { echo "missing frontmatter in $f"; false; }
    grep -q '^name:' "$f" || { echo "missing name: in $f"; false; }
  done
}
