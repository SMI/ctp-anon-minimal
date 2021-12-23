package uk.ac.ed.epcc.ctpanonymiser_minimal;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.rsna.ctp.stdstages.anonymizer.dicom.DICOMAnonymizer;

public class HappyPathTests {

    @Test
    public void canLoadDICOMAnonymizer() {
        DICOMAnonymizer anon = new DICOMAnonymizer();
        assertNotNull(anon);
    }
}
