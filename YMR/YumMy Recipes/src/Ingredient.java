
public class Ingredient {
	private Measurement _measure;
	private String _name;
	
	Ingredient(){
	}
	
	public String Name(){
		return this._name;
	}
	public void Name(String iName){
		this._name = iName;
	}
	
	public Measurement Measure(){
		return this._measure;
	}
	public void Measure(Measurement iMeasure){
		this._measure = iMeasure;
	}
	
	@Override
	public boolean equals(Object o){
		if (!(o instanceof Ingredient))
			return false;
		
		Ingredient obj = (Ingredient)o;
		return (this.Name() == obj.Name()) && (this.Measure() == obj.Measure());
	}
	
}
