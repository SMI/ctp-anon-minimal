#!/usr/bin/env python3
import subprocess
import xml.etree.ElementTree as ElementTree

_NAMESPACE = "{http://maven.apache.org/POM/4.0.0}"


def main() -> int:

    pom_root = ElementTree.parse("pom.xml").getroot()
    pom_version = pom_root.findtext(f"{_NAMESPACE}version")

    cmd = (
        "mvn",
        "--no-transfer-progress",
        "--batch-mode",
        "deploy:deploy-file",
        (
            "-Dfile="
            "/home/runner/.m2/repository/uk/ac/ed/epcc/ctpanonymiser_minimal/"
            f"{pom_version}/ctpanonymiser_minimal-{pom_version}.jar"
        ),
        "-DrepositoryId=github",
        "-Durl=https://maven.pkg.github.com/smi/ctp-anon-minimal",
        "-DpomFile=pom.xml",
    )
    subprocess.check_call(cmd)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
