class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/recipes" do
    @recipes = Recipe.all

    erb :index
  end

  get "/recipes/new" do
    @recipe = Recipe.new

    erb :new
  end

  post "/recipes" do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])

    redirect "/recipes/#{@recipe.id}"
  end

  #show 
    get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])

    erb :show
  end

  #edit
  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])

    erb :edit
  end

  #update
  patch "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.name = parans[:name]
    @recipe.ingredients = parans[:ingredients]
    @recipe.cook_time = parans[:cook_time]
    @recipe.save
    
    redirect "/recipes/#{@recipe.id}"
  end

  #delete
  delete "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.delete

    redirect "/recipes"
  end

end
