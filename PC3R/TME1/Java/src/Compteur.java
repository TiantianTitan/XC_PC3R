

/**
* <code> Compteur.java </code> 
* @author Haotian XUE & HeJun CAO
* @date 25 janv. 2024
* @Description
*  La classe Compteur est conçue pour gérer une valeur de comptage. 
*/

public class Compteur {

	int count;
	
	
	Compteur(int count){
		this.count = count;
	}
	
	public int getValue() {
		return this.count;
	}
	
	public void ascCount() {
		this.count++;
	}
	
	public void decCount() {
		this.count--;
	}
	
}
