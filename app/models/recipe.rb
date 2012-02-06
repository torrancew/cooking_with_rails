class Recipe
  include Mongoid::Document

  # Define and validate a recipe name
  field :name, :type => String
  validates_presence_of   :name, :message        => 'Name cannot be blank'
  validates_uniqueness_of :name, :case_sensitive => false

  # Define description and direction fields
  field :description, :type => String, :default => ''
  field :directions,  :type => String, :default => ''

  # A Recipe embeds several RecipeIngredients
  embeds_many :recipe_ingredients

  # Determine if a Recipe is vegetarian based on
  # whether or not its ingredients are all vegetarian
  def vegetarian?
    # Collect an array of the vegetarian state of each ingredient
    # and check it for any 'false' entries
    self.recipe_ingredients.collect do |ingredient|
      ingredient.vegetarian?
    end.include?( false ) == false
  end

  # Expose Recipes to the API
  acts_as_api
  api_accessible :public do |template|
    template.add :name
    template.add :description
    template.add :directions
    template.add :recipe_ingredients,  :as => :ingredients
    template.add 'vegetarian?'.to_sym, :as => :is_veg
  end
end

