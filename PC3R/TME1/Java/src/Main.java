
public class Main {

	
	public static void main(String [] args){

        final String[] produits = {"pomme", "poire", "orange", "kiwi", "banane"};
		final int nb_p = 5; 
		final int nb_c = 4; 
		final int cible_p = 2;
        final int taille_tapis = 10; 
		Tapis tapis = new Tapis(taille_tapis); 
		Compteur compteur = new Compteur(nb_p * cible_p);
		
		
		Thread[] p = new Thread[nb_p];
		Thread[] c = new Thread[nb_c];
		
        for (int i=0; i<nb_p; i++) 
		{ 
			p[i] = new Thread(new Producteur(produits[i],tapis,cible_p)); 
			p[i].start(); 
		} 

		for (int i=0; i<nb_c; i++) 
		{ 
			c[i] = new Thread(new Consommateur(i, tapis, compteur)); 
			c[i].start(); 
		} 
		
		
		for( int i = 0; i < nb_p; i++) {
			try {
				p[i].join();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		
		for( int i = 0; i < nb_c; i++) {
				try {
					c[i].join();
				} catch (InterruptedException e) {
					e.printStackTrace();
				}

		}

    }
	
	
	
	
	
	
	
	
	
}
