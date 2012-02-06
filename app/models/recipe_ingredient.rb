class RecipeIngredient
  include Mongoid::Document

  # Access name, description and vegetarian? properties through referenced Ingredient
  delegate :name, :description, 'vegetarian?'.to_sym, :to => :ingredient

  # Define a numeric quantity
  field :quantity, :type => Float
  validates_presence_of :quantity

  # Define a unit of measurement
  field :unit, :type => String
  validates_presence_of :unit

  # A RecipeIngredient refers to an existing Ingredient
  belongs_to :ingredient
  validates_presence_of :ingredient

  # Recipe Ingredients are embedded properties of Recipes
  embedded_in :recipe

  # Expose the RecipeIngredient to the API as a usable, dereferenced ingredient
  acts_as_api
  api_accessible :public do |template|
    template.add :quantity
    template.add :unit
    template.add :name
    template.add :description
    template.add 'vegetarian?'.to_sym, :as => :is_veg
  end
end

