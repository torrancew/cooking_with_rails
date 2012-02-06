class RecipesController < ApplicationController
  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all

    respond_to do |format|
      format.html
      format.xml  { render_for_api :public, :xml  => @recipes, :location => :recipes }
      format.json { render_for_api :public, :json => @recipes, :location => :recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render_for_api :public, :xml  => @recipe }
      format.json { render_for_api :public, :json => @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.json
  def new
    @recipe = Recipe.new

    respond_to do |format|
      format.html
      format.xml  { render_for_api :public, :xml  => @recipe }
      format.json { render_for_api :public, :json => @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(params[:recipe])

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, :notice => 'Recipe was successfully created.' }
        format.xml  { render_for_api :public, :xml  => @recipe, :status => :created, :location => @recipe }
        format.json { render_for_api :public, :json => @recipe, :status => :created, :location => @recipe }
      else
        format.html { render :action => "new" }
        format.json { render :json => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to @recipe, :notice => 'Recipe was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :ok }
    end
  end
end
