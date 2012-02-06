require 'spec_helper'

describe 'recipes/index' do
  before( :each ) do
    assign( :recipes, 
      2.times.collect do |i|
        stub_model( Recipe,
          :name        => 'RecipeName',
          :description => 'RecipeDescription',
          :directions  => 'RecipeDirections'
        )
      end
    )
  end

  it 'renders a list of recipes' do
    render

    assert_select 'tr>td', :text => 'RecipeName'.to_s,        :count => 2
    assert_select 'tr>td', :text => 'RecipeDescription'.to_s, :count => 2
    assert_select 'tr>td', :text => 'RecipeDirections'.to_s,  :count => 2
  end
end
