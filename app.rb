require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'

DatabaseConnection.connect('recipes_directory')

recipe_repository = RecipeRepository.new

recipe_1 = recipe_repository.find(1)

p "#{recipe_1.name} takes #{recipe_1.avg_time} minutes."

recipe_repository.all.each do |recipe|
    p recipe
end




