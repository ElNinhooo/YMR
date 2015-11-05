import java.util.*;

//This class is to describe a recipe
//_title is the name of the recipe
//_userRecipe is the user who uploaded it
//_pictures is to store the different pictures
public class Recipe {
	private String _title;
	private User _userRecipe;
	private ArrayList<String> _pictures;
	private ArrayList<RecipePartIngredients> _recipeIngredients;
	private HashSet<String> _tools;
	private RecipeCat _cat;
	private HashMap<String,String> _recipeSteps;
	private static int _yum = 0;
	
	public Recipe(){
		this._pictures = new ArrayList<String>();
		this._recipeIngredients = new ArrayList<RecipePartIngredients>();
		this._tools = new HashSet<String>();
		this._recipeSteps = new HashMap<String,String>();
	}
	
	public String Title(){
		return this._title;
	}
	public void Title(String iTitle){
		this._title = iTitle;
	}
	
	public User UserRecipe(){
		return this._userRecipe;
	}
	public void UserRecipe(User iUserRecipe){
		this._userRecipe = iUserRecipe;
	}
	
	public ArrayList<String> Pictures(){
		return this._pictures;
	}
	public void Pictures(ArrayList<String> iPictures){
		this._pictures = iPictures;
	}
	
	public ArrayList<RecipePartIngredients> RecipeIngredients(){
		return this._recipeIngredients;
	}
	public void Ingredients(ArrayList<RecipePartIngredients> iRecipeIngredients){
		this._recipeIngredients = iRecipeIngredients;
	}
	
	public HashSet<String> Tools(){
		return this._tools;
	}
	public void Tools(HashSet<String> iTools){
		this._tools = iTools;
	}
	
	public RecipeCat Cat(){
		return this._cat;
	}
	public void Cat(RecipeCat iCat){
		this._cat = iCat;
	}
	
	public HashMap<String,String> RecipeSteps(){
		return this._recipeSteps;
	}
	public void RecipeSteps(HashMap<String,String> iRecipeSteps){
		this._recipeSteps = iRecipeSteps;
	}
	
	public int Yum(){
		return _yum;
	}
	public void AddYum(){
		_yum ++;
	}
	
	//Methods
	//Add pictures to the recipe
	public void AddPicturesToRecipe(String iPicturePath){
		this.Pictures().add(iPicturePath);
	}
	//Delete pictures from the recipe
	public void DeletePictureFromRecipe(String iPicturePath){
		this.Pictures().remove(iPicturePath);
	}
	//Add ingredients to the recipe
	
}
