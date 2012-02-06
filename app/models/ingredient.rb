class Ingredient
  include Mongoid::Document

  # Ingredients must have unique names
  field :name, :type => String
  validates_presence_of   :name, :message        => 'Name cannot be blank'
  validates_uniqueness_of :name, :case_sensitive => false

  # Ingredients define whether or not they are vegetarian-friendly
  field :is_veg,      :type => Boolean, :default => false
  # Ingredients have a space for a description
  field :description, :type => String,  :default => ''

  def vegetarian?
    is_veg == true
  end

  # Serialize the object for API output
  acts_as_api
  api_accessible :public do |template|
    template.add :name
    template.add :description
    template.add :is_veg, :as => :vegetarian
  end
end
