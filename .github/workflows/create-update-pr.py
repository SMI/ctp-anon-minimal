#!/usr/bin/env python3
import json
import os
import subprocess
import urllib.request

DEFAULT_BRANCH = "main"
UPDATE_BRANCH = "vendor-update"
UPDATE_TITLE = "auto-update vendor repos"
ORG = "smi"
REPO = "ctp-anon-minimal"
COMMITTER_USERNAME = "smi-bot"
COMMITTER_EMAIL = "58794389+SMI-Bot@users.noreply.github.com"


def run(*cmd: str) -> None:
    subprocess.check_call(("echo", "$", *cmd))
    subprocess.check_call(cmd)


def main() -> int:

    gh_token = os.environ.get("GITHUB_TOKEN")

    changes = False
    try:
        run("git", "diff", "--exit-code")
    except subprocess.CalledProcessError:
        changes = True

    if not changes:
        return 0

    run("git", "checkout", "-b", UPDATE_BRANCH)
    run("git", "add", "-u")
    run("git", "config", "user.name", COMMITTER_USERNAME)
    run("git", "config", "user.email", COMMITTER_EMAIL)
    run("git", "commit", "-m", UPDATE_TITLE)
    run("git", "push", "origin", "HEAD", "-f")

    data = json.dumps(
        {
            "head": UPDATE_BRANCH,
            "base": DEFAULT_BRANCH,
            "title": UPDATE_TITLE,
            "body": "",
            "maintainer_can_modify": True,
        },
    ).encode()
    req = urllib.request.Request(
        f"https://api.github.com/repos/{ORG}/{REPO}/pulls",
        headers={
            "Accept": "application/vnd.github.v3+json",
            "Authorization": f"token {gh_token}",
            "Content-Type": "application/json",
        },
        data=data,
    )
    with urllib.request.urlopen(req) as resp:
        print(resp.msg)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
