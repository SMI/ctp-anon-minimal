#!/usr/bin/env python3
import shutil
import subprocess
import xml.etree.ElementTree as ElementTree
from pathlib import Path

_NAMESPACE = "{http://maven.apache.org/POM/4.0.0}"


def main() -> int:
    pom_root = ElementTree.parse("pom.xml").getroot()
    pom_version = pom_root.findtext(f"{_NAMESPACE}version")

    file_in_repo = Path(
        "/home/runner/.m2/repository/uk/ac/ed/epcc/ctpanonymiser_minimal/"
        f"{pom_version}/ctpanonymiser_minimal-{pom_version}.jar",
    )
    assert file_in_repo.is_file(), f"Expected to find '{file_in_repo}'"

    shutil.copy2(file_in_repo, ".")

    cmd = (
        "mvn",
        "--no-transfer-progress",
        "--batch-mode",
        "deploy:deploy-file",
        f"-Dfile={file_in_repo.name}",
        "-DrepositoryId=github",
        "-Durl=https://maven.pkg.github.com/smi/ctp-anon-minimal",
        "-DpomFile=pom.xml",
    )
    subprocess.check_call(cmd)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
