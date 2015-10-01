
public enum Measurement {
	l("Liter(s)"),
	g("Gram(s)"),
	cup("Cup(s)"),
	oz("Ounce(s)");
	
	private String _name;
	Measurement(String iName){
		this._name = iName;
	}
	
	public String ToString(){
		return this._name;
	}
}
