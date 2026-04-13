#!/bin/bash
set -euo pipefail

repo_root() {
  cd "$(dirname "$0")/.." && pwd
}

skill_dir() {
  local root="$1"
  local skill="$2"
  echo "$root/skills/$skill"
}

require_skill() {
  local root="$1"
  local skill="$2"
  local dir
  dir="$(skill_dir "$root" "$skill")"
  if [ ! -f "$dir/skill.yaml" ]; then
    echo "Skill not found: $skill" >&2
    exit 1
  fi
}

yaml_value() {
  local file="$1"
  local key="$2"
  awk -F': ' -v wanted="$key" '$1 == wanted {print $2; exit}' "$file"
}

ensure_parent_dir() {
  mkdir -p "$(dirname "$1")"
}

safe_symlink() {
  local source="$1"
  local target="$2"
  ensure_parent_dir "$target"

  if [ -L "$target" ]; then
    local current
    current="$(readlink "$target")"
    if [ "$current" = "$source" ]; then
      echo "already-linked $target"
      return 0
    fi
    rm "$target"
  elif [ -e "$target" ]; then
    echo "Refusing to overwrite existing non-symlink target: $target" >&2
    exit 1
  fi

  ln -s "$source" "$target"
  echo "linked $target -> $source"
}

list_skills() {
  local root="$1"
  find "$root/skills" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sort
}
