require 'spec_helper'

describe 'ingredients/index' do
  before(:each) do
    assign(:ingredients,
      2.times.collect do |i|
        stub_model( Ingredient,
          :name        => 'IngredientName',
          :description => 'IngredientDescription',
          :is_veg      => false
        )
      end
    )
  end

  it 'renders a list of ingredients' do
    render

    assert_select 'tr>td', :text => 'IngredientName'.to_s,        :count => 2
    assert_select 'tr>td', :text => 'IngredientDescription'.to_s, :count => 2
    assert_select 'tr>td', :text => 'no'.to_s,                    :count => 2
  end
end
