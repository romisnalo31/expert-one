
public class SimpleClass {
public void just()
{
	System.out.println(this+" started");
	try {
		Thread.sleep(10000);
	} catch (InterruptedException e) {
		e.printStackTrace();
	}
	System.out.println("Hi");
}
}
