
public class Producteur extends Thread implements Runnable {

	private String nameP;
	private int nb_production;
	private int nb_current;
	private Tapis tapis;
	
	public Producteur(String nameP, Tapis tapis, int nb_production) {
		this.nameP = nameP;
		this.tapis = tapis;
		this.nb_production = nb_production;
		this.nb_current = 0;
	}
	
	@Override
	public void run() {

		while(nb_current < nb_production) {
			synchronized (tapis) {
				tapis.enfiler(new Paquet(nameP));
				nb_current++;
				System.out.println(this.nameP + " " +this.nb_current);
			}
		}
	}

	public String getNameP() {
		return this.nameP;
	}
	
	

	
}
