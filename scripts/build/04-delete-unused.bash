#!/usr/bin/env bash

set -euxo pipefail

VENDOR_ROOT="./vendor"

CTP_SRC="$VENDOR_ROOT/CTP/source/java/org/rsna"
rm -r "$CTP_SRC"/installer
rm -r "$CTP_SRC"/launcher
rm -r "$CTP_SRC"/runner
rm -r "$CTP_SRC"/ctp/stdplugins
rm -r "$CTP_SRC"/ctp/quarantine
rm    "$CTP_SRC"/ctp/ClinicalTrialProcessor.java
find "$CTP_SRC"/ctp/pipeline -type f \
    -not -name "ExportService.java" \
    -not -name "ImportService.java" \
    -not -name "Pipeline.java" \
    -not -name "PipelineStage.java" \
    -not -name "Processor.java" \
    -not -name "StorageService.java" \
    -delete
find "$CTP_SRC"/ctp/servlets -type f \
    -not -name "SummaryLink.java" \
    -delete
find  "$CTP_SRC"/ctp/stdstages -type f \
    -not -wholename "*anonymizer/dicom*" \
    -not -name "AnonymizerFunctions.java" \
    -not -name "AnonymizerStatus.java" \
    -not -name "IntegerTable.java" \
    -delete

DCM4CHE_ROOT="$VENDOR_ROOT/dcm4che-1.4-JP/src/java/org"
rm -r "$DCM4CHE_ROOT"/dcm4che/auditlog
rm -r "$DCM4CHE_ROOT"/dcm4che/client
rm -r "$DCM4CHE_ROOT"/dcm4che/hl7
rm -r "$DCM4CHE_ROOT"/dcm4che/imageio
rm -r "$DCM4CHE_ROOT"/dcm4che/log
rm -r "$DCM4CHE_ROOT"/dcm4che/media
rm -r "$DCM4CHE_ROOT"/dcm4che/net
rm -r "$DCM4CHE_ROOT"/dcm4che/server
rm -r "$DCM4CHE_ROOT"/dcm4che/srom
rm -r "$DCM4CHE_ROOT"/dcm4che/tools
rm -r "$DCM4CHE_ROOT"/dcm4cheri/auditlog
rm -r "$DCM4CHE_ROOT"/dcm4cheri/hl7
rm -r "$DCM4CHE_ROOT"/dcm4cheri/imageio
rm -r "$DCM4CHE_ROOT"/dcm4cheri/media
rm -r "$DCM4CHE_ROOT"/dcm4cheri/net
rm -r "$DCM4CHE_ROOT"/dcm4cheri/server
rm -r "$DCM4CHE_ROOT"/dcm4cheri/srom

UTIL_ROOT="$VENDOR_ROOT/Util/source/java/org/rsna"
rm -r "$UTIL_ROOT"/service
find "$UTIL_ROOT"/servlets -type f \
    -not -name "LoginServlet.java" \
    -not -name "Servlet.java" \
    -delete
rm -r "$UTIL_ROOT"/ui
rm -r "$UTIL_ROOT"/video
