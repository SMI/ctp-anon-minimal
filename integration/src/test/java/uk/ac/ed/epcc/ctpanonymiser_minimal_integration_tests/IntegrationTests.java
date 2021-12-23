package uk.ac.ed.epcc.ctpanonymiser_minimal_integration_tests;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.io.File;
import java.net.URL;
import java.nio.file.Path;
import java.util.Properties;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;
import org.rsna.ctp.objects.DicomObject;
import org.rsna.ctp.stdstages.anonymizer.AnonymizerStatus;
import org.rsna.ctp.stdstages.anonymizer.dicom.DAScript;
import org.rsna.ctp.stdstages.anonymizer.dicom.DICOMAnonymizer;

public class IntegrationTests {

    private File _testDcm;
    private Properties _testAnonProps;

    public IntegrationTests() {

        URL testDcmUrl = Thread.currentThread().getContextClassLoader().getResource("IM-0001-0013.dcm");
        _testDcm = new File(testDcmUrl.getPath());

        URL testPropsUrl = Thread.currentThread().getContextClassLoader().getResource("testAnon.properties");
        File testPropsFile = new File(testPropsUrl.getPath());
        _testAnonProps = DAScript.getInstance(testPropsFile).toProperties();
    }

    @Test
    public void happyPath(@TempDir Path tempDir) throws Exception {

        File outFile = tempDir.resolve("out.dcm").toFile();

        AnonymizerStatus x = DICOMAnonymizer.anonymize(
                _testDcm,
                outFile,
                _testAnonProps,
                null,
                null,
                false,
                false);

        assertTrue(x.isOK());

        DicomObject dObj = new DicomObject(outFile);
        assertEquals("", dObj.getPatientID());
    }
}
