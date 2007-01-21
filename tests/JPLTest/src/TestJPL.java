import java.util.Hashtable;
import java.util.Map;

import jpl.Atom;
import jpl.Compound;
import jpl.JPL;
import jpl.Query;
import jpl.Term;
import jpl.Variable;
import junit.framework.TestCase;


public class TestJPL extends TestCase {
private static boolean inited = false;
	
	@Override
	protected void setUp() throws Exception {
		if(!inited)
		{
			assertTrue(JPL.init());
			inited = true;
		}

	}
	
	public void testLikes()
	{
		Query q1 = 
		    new Query( 
		        "consult", 
		        new Term[] {new Atom("likes.pl")} 
		    );
		assertTrue(q1.hasSolution());
		
		Variable X = new Variable("X");
		Variable Y = new Variable("Y");


		
		Term goal = new Compound
		( "likes", 
				new Term[]{X,Y});
		
		Query q = new Query( goal );

		while ( q.hasMoreSolutions() ) { 
			Map binding = (Map) q.nextSolution(); 
			System.out.println( binding.get("X") + " likes "+ binding.get("Y"));
		}
	}
}
