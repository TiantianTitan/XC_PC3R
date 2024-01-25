
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
		if(size == capacity) {
			capacity *= 2;
			Paquet[] tmp = new Paquet[capacity];
			for(int i = 0; i < size; i++) {
				tmp[i] =  tapis[i];
			}
			this.tapis = tmp;
		}
		tapis[size] = paquet;
		sizeAsc();
	}
	
	public Paquet defiler() {
		if(size == 0) { return null; }
		Paquet ret = tapis[size-1];
		tapis[size-1] = null;
		sizeDec(); 
		return ret;	
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
