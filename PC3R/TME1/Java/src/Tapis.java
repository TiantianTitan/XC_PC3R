

/**
* <code> Tapis.java </code> 
* @author Haotian XUE & HeJun CAO
* @date 25 janv. 2024
* @Description
* Tapis est une implémentation de tampon partagé pour le modèle de production-consommation, où les producteurs placent des Paquets dans le tampon et les consommateurs les retirent. La classe utilise des méthodes synchronisées pour assurer une manipulation sûre du tampon dans un environnement multithread.
*/


public class Tapis {

	private int size;
	private int capacity;
	private Paquet[] tapis;
	
	public Tapis(int capacity) {
		this.size = 0;

		this.capacity = capacity;
		this.tapis =  new Paquet[capacity];
	}

	public void enfiler(Paquet paquet) {
		synchronized(this) {
			while(size == capacity) {
				try {
					this.wait();
				} catch (InterruptedException e) {
		
					e.printStackTrace();
				}
			}
			if(size == 0) this.notify();
			tapis[size] = paquet;	
			sizeAsc();
		}
	}
	
	public Paquet defiler(Compteur compteur) {
		synchronized(this) {
			while(size == 0) { 
				try {
					this.wait();
				} catch (InterruptedException e) {
					e.printStackTrace();
				} 
			}
			if(size == capacity) { this.notify();}
			Paquet ret = tapis[size-1];
			tapis[size-1] = null;
			sizeDec();
			compteur.decCount();
			return ret;	
		}
	}
	
	public int getSize() {
		return this.size;
	}
	
	public int getCapacity() {
		return this.capacity;
	}
	
	
	void sizeDec() {
		this.size--;
	}
	
	void sizeAsc() {
		this.size++;
	}
	
}
