
/**
* <code> Consommateur.java </code> 
* @author Haotian XUE & HeJun CAO
* @date 25 janv. 2024
* @Description
* La classe Consommateur.java représente un consommateur dans un scénario producteur-consommateur. Chaque instance de Consommateur fonctionne comme un thread qui consomme des objets Paquet d'un tapis partagé jusqu'à ce que le compteur atteigne zéro.
*/

public class Consommateur extends Thread implements Runnable{

	private int id;
	private Compteur compteur;
	private Tapis tapis;
	
	public Consommateur(int id, Tapis tapis, Compteur compteur) {
		this.id = id;
		this.tapis = tapis;
		this.compteur = compteur;
	}
	
	@Override
	public void run() {
		while(compteur.getValue() > 0){
			Paquet top = null;
			synchronized (tapis) {
				if (tapis.getSize() > 0) {
					top= tapis.defiler(this.compteur);
					try {
						sleep(500);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			}
			if(top != null) {
				System.out.println("C" + getID() +  " mange " + top.getName() );
			}
		}
	}


	public int getID() {
		return this.id;
	}


}
