package tests;

import org.junit.jupiter.api.*;
import org.openqa.selenium.*;
import org.openqa.selenium.safari.SafariDriver;

public class BasicTest {

    WebDriver driver;

    @BeforeEach
    public void setup() {
      
        driver = new SafariDriver();
        driver.manage().window().maximize();
    }

    @Test
    public void openTelusDigitalURL() {
        String url = "https://www.telus.com/digital";  

        driver.get(url);

        // Simple validation
        String title = driver.getTitle();
        Assertions.assertFalse(title.isEmpty(), "Page title should not be empty");

        System.out.println("Opened Telus Digital successfully. Title = " + title);
    }

    @AfterEach
    public void teardown() {
        if (driver != null) {
            driver.quit();
        }
    }
}
