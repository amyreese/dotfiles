#!/usr/bin/env python

import os
import re
import shlex
import subprocess
from pathlib import Path


REPLACEMENTS = [
    (re.compile(pat), rep)
    for pat, rep in [
        (r"20[0-9]* John Reese", "Amethyst Reese"),
        (r"John Reese", "Amethyst Reese"),
        (r"team at john@noswap\.com", "team at contact@omnilib.dev"),
        (r"john@noswap\.com", "amy@noswap.com"),
        (r"jreese\.sh", "noswap.com"),
    ]
]

MAILMAP = [
    "Amethyst Reese <amy@n7.gg> <john@noswap.com>",
]


def run(cmd, *, check=True, encoding="utf-8", **kwargs) -> subprocess.CompletedProcess:
    cmd_str = " ".join(shlex.quote(c) for c in cmd)
    print(f"$ {cmd_str}")
    return subprocess.run(cmd, check=check, encoding=encoding, **kwargs)


def update(path: Path) -> bool:
    if not path.is_file():
        return False
    try:
        content = orig = path.read_text("utf-8")
    except UnicodeDecodeError:
        return False

    for pat, rep in REPLACEMENTS:
        content = pat.sub(rep, content)

    if content != orig:
        print(f"> writing {path}")
        path.write_text(content, "utf-8")
        return True

    return False


def mailmap() -> bool:
    path = Path(".mailmap")
    if not path.exists():
        print(f"> creating {path}")
        path.write_text("\n".join(MAILMAP), "utf-8")
        return True

    else:
        found = None
        orig = path.read_text("utf-8")
        lines = list(orig.splitlines())

        idx = len(lines) - 1
        while idx >= 0:
            if lines[idx].startswith("Amethyst Reese"):
                found = idx
                lines.pop(idx)
            idx -= 1

        if found is None:
            found = len(lines)

        lines[found:0] = MAILMAP
        content = "\n".join(lines)

        if content != orig:
            print(f"> updating {path}")
            path.write_text(content, "utf-8")
            return True

    return False


def main():
    proc = run(["git", "rev-parse", "--show-toplevel"], capture_output=True)
    root = Path(proc.stdout.strip())
    assert root.is_dir(), f"bad git root {root=!r}"

    os.chdir(root)
    assert Path(".git").exists(), f"no .git/ after chdir({root!r})"

    count = 0
    updated = 0
    proc = run(["git", "ls-files"], capture_output=True)
    for line in proc.stdout.splitlines():
        path = Path(line)
        if path.stem == "amyfy":
            continue
        if update(path):
            updated += 1
        count += 1

    if mailmap():
        updated += 1
    count += 1

    print(f"> checked {count} files")
    if updated:
        print(f"🔨 touched {updated} files 🔨")
    else:
        print("✨ no updates needed ✨")


if __name__ == "__main__":
    main()
