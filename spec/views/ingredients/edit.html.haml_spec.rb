require 'spec_helper'

describe 'ingredients/edit' do
  before(:each) do
    @ingredient = assign(:ingredient, stub_model(Ingredient,
      :name        => 'MyString',
      :is_veg      => false,
      :description => 'MyText'
    ))
  end

  it 'renders the edit ingredient form' do
    render

    assert_select 'form', :action => ingredients_path(@ingredient), :method => 'post' do
      assert_select 'input#ingredient_name',           :name => 'ingredient[name]'
      assert_select 'input#ingredient_is_veg',         :name => 'ingredient[is_veg]'
      assert_select 'textarea#ingredient_description', :name => 'ingredient[description]'
    end
  end
end
