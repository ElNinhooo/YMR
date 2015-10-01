import java.util.*;

public class RecipeBook {
	private User _recipeBookUser;
	private Hashtable<String, Recipe> _recipes;
	
	public RecipeBook()
	{
		this._recipes = new Hashtable<String,Recipe>();
	}
	public RecipeBook(User iUser)
	{
		this._recipes = new Hashtable<String,Recipe>();
		RecipeBookUser(iUser);
	}
	
	public User RecipeBookUser(){
		return this._recipeBookUser;
	}
	public void RecipeBookUser(User iUser){
		this._recipeBookUser = iUser;
	}
	
	public Hashtable<String, Recipe> Recipes(){
		return this._recipes;
	}
	public void Recipes(Hashtable<String, Recipe> iRecipes){
		this._recipes = iRecipes;
	}
	
	//Methods
	//Add a recipe to the cook book
	public void AddRecipeToBook(Recipe iRecipe){
		this.Recipes().put(iRecipe.Title(), iRecipe);
	}
	public void AddRecipeToBook(Recipe iRecipe, String iTitle){
		this.Recipes().put(iTitle, iRecipe);
	}
	//Delete a recipe from the cook book
	public void DeleteRecipeFromBook(String iTitle){
		this.Recipes().remove(iTitle);
	}
	
	
}
