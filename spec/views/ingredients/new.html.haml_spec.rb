require 'spec_helper'

describe 'ingredients/new' do
  before(:each) do
    assign(:ingredient, stub_model(Ingredient,
      :name        => 'MyString',
      :is_veg      => false,
      :description => 'MyText'
    ).as_new_record)
  end

  it 'renders new ingredient form' do
    render

    assert_select 'form', :action => ingredients_path, :method => "post" do
      assert_select 'input#ingredient_name',           :name => 'ingredient[name]'
      assert_select 'input#ingredient_is_veg',         :name => 'ingredient[is_veg]'
      assert_select 'textarea#ingredient_description', :name => 'ingredient[description]'
    end
  end
end
