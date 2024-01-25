
public class Producteur extends Thread implements Runnable {

	private String nameP;
	private int nb_production;
	private int nb_current;
	private Tapis tapis;
	
	public Producteur(String nameP, Tapis tapis, int nb_production) {
		this.nameP = nameP;
		this.tapis = tapis;
		this.nb_production = nb_production;
	}
	
	@Override
	public void run() {

		while(true) {
			int times = 0;
			synchronized (tapis) {
				if(tapis.getSize() > 0) {
					tapis.enfiler(new Paquet(nameP));
//					System.out.println(times + ": "+ nameP + "ajoute" + );
				}
			}
			times++;
		}
	
	}

	public String getNameP() {
		return this.nameP;
	}
	
	
}
