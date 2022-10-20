require 'recipe_repository'
# require 'database_connection'

RSpec.describe RecipeRepository do
    
    def reset_recipes_table
        seed_sql = File.read('spec/seeds_recipes.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
        connection.exec(seed_sql)
    end
      
    
    before(:each) do 
        reset_recipes_table
    end
      
    # (your tests will go here).
    it "returns the full list of recipes" do
        repo = RecipeRepository.new

        recipes = repo.all

        expect(recipes.length).to eq 2
        expect(recipes.first.id).to eq '1'
        expect(recipes.first.name).to eq 'Lentil Dahl'
        expect(recipes.first.avg_time).to eq '65'
        expect(recipes.first.rating).to eq '4'
    end

    it "returns a sinlge recipe" do
        repo = RecipeRepository.new

        recipe = repo.find(2)

        expect(recipe.id).to eq '2' 
        expect(recipe.name).to eq 'Beef Hotpot'
        expect(recipe.avg_time).to eq '85'
        expect(recipe.rating).to eq '2'
    end
    
    
    
    


end