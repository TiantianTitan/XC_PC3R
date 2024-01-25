
public class Consommateur extends Thread implements Runnable{

	private String nameC;
	private int nb_consommation;
	private int nb_current;
	private Tapis[] tapis;
	
	public Consommateur(String nameC, Tapis[] tapis, int nb_consommation) {
		this.nameC = nameC;
		this.tapis = tapis;
		this.nb_consommation = nb_consommation;
	}
	
	@Override
	public void run() {
		// TODO Auto-generated method stub
		
	}

	public String getNameC() {
		return this.nameC;
	}


	
	
	
	


}
