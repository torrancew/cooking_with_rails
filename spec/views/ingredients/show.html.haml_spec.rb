require 'spec_helper'

describe 'ingredients/show' do
  before(:each) do
    @ingredient = assign(:ingredient, stub_model(Ingredient,
      :name        => 'Name',
      :is_veg      => false,
      :description => 'MyText'
    ))
  end

  it 'renders attributes in <p>' do
    render

    rendered.should match(/Name/)
    rendered.should match(/no/)
    rendered.should match(/MyText/)
  end
end
