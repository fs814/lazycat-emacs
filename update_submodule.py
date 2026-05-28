import os
import subprocess
import argparse

UPSTREAM_URL = "https://github.com/manateelazycat/lazycat-emacs"

def run_command(command, cwd=None):
    """Run a shell command in a specific directory."""
    result = subprocess.run(command, shell=True, cwd=cwd, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"Error running command: {command}\n{result.stderr.strip()}")
    return result.stdout.strip()

def update_main_repo(repo_path):
    """Update the main repository."""
    print("Updating lazycat-emacs repository...")
    run_command("git checkout -- .", cwd=repo_path)
    run_command(f"git pull --no-recurse-submodules {UPSTREAM_URL} master", cwd=repo_path)
    run_command("git submodule update --init", cwd=repo_path)

def update_submodules(repo_path):
    """Update each submodule to the commit specified in the main repo."""
    print("Updating submodules...")
    submodules = run_command("git config --file .gitmodules --get-regexp path", cwd=repo_path).splitlines()
    seen_paths = set()
    for submodule in submodules:
        path = submodule.split()[1]

        # Skip entries where path looks like a URL
        if path.startswith("http://") or path.startswith("https://"):
            continue

        # Skip duplicate paths
        if path in seen_paths:
            continue
        seen_paths.add(path)

        submodule_path = os.path.join(repo_path, path)

        # Check if the submodule path exists, if not, try removing '.git'
        if not os.path.isdir(submodule_path):
            submodule_path = submodule_path.replace('.git', '')

        print(f"Update submodule {submodule_path}")

        if not os.path.isdir(submodule_path):
            print(f"Error: The submodule path '{submodule_path}' does not exist.")
            continue

        # Check if the submodule has any tracked files before running checkout
        ls_result = subprocess.run("git ls-files", shell=True, cwd=submodule_path,
                                   capture_output=True, text=True)
        if ls_result.stdout.strip():
            run_command("git checkout -- .", cwd=submodule_path)
        run_command("git submodule update", cwd=submodule_path)

def main():
    parser = argparse.ArgumentParser(description="Update a Git repository and its submodules.")
    parser.add_argument('--path', default=os.getcwd(), help="Path to the Git repository (default: current directory)")
    args = parser.parse_args()

    repo_path = args.path
    if not os.path.isdir(repo_path):
        print(f"Error: The path '{repo_path}' is not a valid directory.")
        return

    update_main_repo(repo_path)
    update_submodules(repo_path)

if __name__ == "__main__":
    main()
