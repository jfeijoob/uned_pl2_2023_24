package compiler.pec;

import compiler.lexical.Token;

public class AccionesSemanticas {

	
	public void accionDeclaracionFuncion( Token nombreFuncion ) {
		System.out.println( nombreFuncion.getLexema() );
	}
}
