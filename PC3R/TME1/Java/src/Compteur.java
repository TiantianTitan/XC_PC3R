
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
