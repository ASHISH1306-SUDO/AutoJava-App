import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class HelloWorldTest {
    @Test
    public void testGetMessage() {
        HelloWorld app = new HelloWorld();
        assertEquals("Hello, CI/CD World!", app.getMessage());
    }
}
