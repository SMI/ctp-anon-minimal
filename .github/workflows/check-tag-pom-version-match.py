#!/usr/bin/env python3
import os
import sys
import xml.etree.ElementTree as ElementTree

_NAMESPACE = "{http://maven.apache.org/POM/4.0.0}"


def main() -> int:
    tag_name = os.environ["GITHUB_REF_NAME"]

    pom_root = ElementTree.parse("pom.xml").getroot()
    pom_version = pom_root.findtext(f"{_NAMESPACE}version")
    assert pom_version, "Expected to find the pom version"

    if pom_version != tag_name:
        print(
            (
                "Git tag and pom versions do not match: "
                f"'{tag_name}' vs. '{pom_version}'. "
                "Did you forget to run scripts/set-versions.bash?"
            ),
            file=sys.stderr,
        )
        return 1

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
