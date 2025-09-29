#!/usr/bin/env bash

init_project() {
  set -e
  WORKSPACE_DIR="$HOME/workspace"

  # Read new project name
  read -r -p "Enter your project name: " project_name
  if [ -z "$project_name" ]; then
    echo "Project name cannot be empty. Exiting..."
    sleep 2
    exit 1
  fi

  # Create new
  PROJECT_DIR="$WORKSPACE_DIR/$project_name"
  echo "Creating project directory at $PROJECT_DIR..."
  mkdir -p "$PROJECT_DIR"
  cd "$PROJECT_DIR"

  # Initialize flake
  echo "Initializing nix flake..."
  nix flake init

  # Initialize git repository
  read -r -p "Initialize a git repository? (y/N) " init_git

  if [[ "$init_git" =~ ^[Yy]$ ]]; then
    echo "Initializing git repository..."
    git init >/dev/null 2>&1
    echo "Creating README.md and .gitignore..."
    echo "# $project_name" >README.md
    echo -e ".direnv/\nresult*\n.DS_Store" >.gitignore

    echo "Adding initial files to git..."
    git add flake.nix README.md .gitignore
  fi

  echo "Opening flake.nix in nvim..."
  exec nvim flake.nix
}

export -f init_project
ghostty -e bash -c "init_project"
