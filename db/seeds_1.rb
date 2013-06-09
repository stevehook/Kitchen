###############################################################################################################################
# pasta recipe

pasta_description = "
The English asparagus season is short so we like to make the most of it while
we can. We don't have any in the Zanzaneet garden (apparently its not all that
easy to grow) but we do know a nearby farm that offers pick your own, so that's
where we head if we fancy some really fresh asparagus when the late Spring sun
is shining. There is lots you can do with asparagus but this quick pasta dish
was just right for a light lunch.
"

pasta_ingredient_list = "
* A 200g bunch of fresh *asparagus*
* 200g dry *spaghetti*
* *olive oil* for shallow frying
* 1 clove of *garlic* peeled and finely chopped
* 12 cherry *tomatoes*
* A handful of fresh *basil* leaves
* *salt* and freshly ground *black pepper* to taste
* 20-30g of grated *pecorino* romano cheese (or parmesan)
"

pasta_preparation_method = "
1. First give the asparagus a good rinse (it is often grown in sandy soil so you may find some grit in the tips if you don't wash it throroughly). Then remove the woody base of each stem and chop into 4-5 cm long pieces.
1. Chop the cherry tomatoes into halves or quarters.
1. Boil the pasta in a large saucepan of water according to the instructions on the packet.
1. Whilst the pasta is cooking heat the olive oil in a non-stick pan over a medium heat.
1. When the oil is hot fry the garlic until soft but not brown.
1. Add the chopped asparagus to the pan with the garlic and stir fry until cooked. Normally this takes 2-4 minutes depending on the thickness of the stems. Try not to overcook it so that it remains a little crisp and keeps its subtle flavour.
1. Add the cherry tomatoes to the pan a minute or two before the asparagus is cooked so that they soften and warm through without breaking apart completely.
1. Strain the pasta and add it to the pan, then stir everything together, add salt to taste and a generous twist of black pepper.
1. Serve in warm bowls, sprinkle with grated pecorino (or parmesan) and drizzle with olive oil.
"

pasta_recipe = Recipe.create!(:title => 'Spaghetti with asparagus',
                    :synopsis => 'A quick and easy lunch with in-season English asparagus',
                    :preparation_time => 10,
                    :cooking_time => 15,
                    :description => pasta_description,
                    :ingredient_list => pasta_ingredient_list,
                    :preparation_method => pasta_preparation_method,
                    :category => 'vegetarian')
RecipePhoto.create!(:recipe => pasta_recipe, :title => 'pasta', :image => File.open('db/pictures/pasta1.jpg'))
RecipePhoto.create!(:recipe => pasta_recipe, :title => 'pasta', :image => File.open('db/pictures/pasta2.jpg'))
RecipePhoto.create!(:recipe => pasta_recipe, :title => 'pasta', :image => File.open('db/pictures/pasta3.jpg'))
RecipePhoto.create!(:recipe => pasta_recipe, :title => 'pasta', :image => File.open('db/pictures/pasta4.jpg'))
RecipePhoto.create!(:recipe => pasta_recipe, :title => 'pasta', :image => File.open('db/pictures/pasta5.jpg'))

