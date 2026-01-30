package add_to_cart;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class login {

    public static void main(String[] args) {

        // Set the path to ChromeDriver
        System.setProperty("webdriver.chrome.driver", "C:/Users/New Asus/Downloads/chromedriver-win64/chromedriver.exe");

        WebDriver driver = new ChromeDriver();
        try {
            // Open the website
            driver.get("https://www.saucedemo.com/");
            driver.manage().window().maximize();

            // Enter username and password
            driver.findElement(By.id("user-name")).sendKeys("standard_user");
            driver.findElement(By.id("password")).sendKeys("secret_sauce");

            // Click login
            driver.findElement(By.id("login-button")).click();

            // Assertion: check if the URL contains /inventory.html after login
            String currentUrl = driver.getCurrentUrl();
            if (!currentUrl.contains("/inventory.html")) {
                throw new IllegalStateException("Login failed! URL does not contain /inventory.html");
            }
            System.out.println("Login successful, assertion passed.");

            // Tunggu 5 saat sebelum quit driver supaya sempat tengok inventory page
            Thread.sleep(5000);

        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            // Always quit the driver
            if (driver != null) {
                driver.quit();
            }
        }
    }
}
