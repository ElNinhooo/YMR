//The user of the application

public class User {
	private String _name;
	private String _email;
	private String _pwd;
	private String _language;
	
	public User(String iName, String iEmail, String iPwd){
		Name(iName);
		Email(iEmail);
		Pwd(iPwd);
	}
	
	public String Name(){
		return _name;
	}
	public void Name(String iName){
		this._name = iName;
	}
	
	public String Email(){
		return this._email;
	}
	
	public void Email(String iEmail){
		this._email = iEmail;
	}
	
	public void Pwd(String iPwd){
		this._pwd = iPwd;
	}
	protected String Pwd(){
		return this._pwd;
	}
	
	public String Language(){
		return this._language;
	}
	public void Language(String iLanguage){
		this._language = iLanguage;
	}
}
