import java.util.ArrayList;

public class RecipePartIngredients {
	private String _title;
	private ArrayList<Ingredient> _ingredientsList;

	public RecipePartIngredients(){
		this._ingredientsList = new ArrayList<Ingredient>();
	}
	
	public String Title(){
		return this._title;
	}
	public void Title(String iTitle){
		this._title = iTitle;
	}
	
	public ArrayList<Ingredient> IngredientsList(){
		return this._ingredientsList;
	}
	public void IngredientsList(ArrayList<Ingredient> iIngredientsList){
		this._ingredientsList = iIngredientsList;
	}
	
	//Method
	public void AddIngredient(Ingredient iIngredient){
		this.IngredientsList().add(iIngredient);
	}
	public void RemoveIngredient(Ingredient iIngredient){
		this.IngredientsList().remove(iIngredient);
	}
}
