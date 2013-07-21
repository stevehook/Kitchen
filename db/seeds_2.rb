###############################################################################################################################
# risotto recipe

risotto_description = "
The secret of a tasty risotto is a rich flavourful stock. We had some home-made
chicken stock left-over from a chicken biriyani (made from just chicken and
water cooked in a pressure cooker) which had all the flavour we needed but you
can use any decent quality vegetable or chicken stock for this recipe.

You can add the scallops to this dish at the last minute so this dish works
well if you are catering for vegetarians as well as sea food lovers.

There are quite a few things to bring together towards the end of the cooking
process so its worth making sure you get all of your vegetables prepared and
scallops ready to fry before you turn the cooker on. Risotto is best served
immediately, before the rice has had chance to absorb all the moisture in the
sauce and go stodgy.
"

risotto_ingredient_list = "
* 800 ml vegetable or chicken *stock*
* 100 ml of white *wine*
* A 200g bunch of fresh *asparagus*
* A medium sized *brocolli*
* 100g of frozen *peas*
* 200g Arborio or Carnaroli *rice* (Arborio is widely available, but our excellent local Italian restaurant reckon that Carnaroli is the better choice. We would not argue.)
* *olive oil* for shallow frying
* 1 medium-sized *onion*
* 2 sticks of *celery*
* 1 clove of *garlic* peeled and finely chopped
* A few sprigs of *lemon thyme*
* *salt* and freshly ground *black pepper* to taste
* a large knob of *butter*
* 20-30g of grated *parmesan* cheese (for vegetarians) or 6-8 large fresh scallops
"

risotto_preparation_method = "
1. First wash the asparagus thoroughly. Then remove the woody base of each stem and chop into 4-5 cm long pieces.
1. Wash the brocolli and chop into florets. You need some fairly small pieces so larger florets will need to be cut into 2-4 pieces. If you like your brocolli well cooked, steam it for 2 minutes so that it is par-cooked and then set aside.
1. Finely chop the onion, garlic and celery.
1. Warm the stock in a saucepan. Season the stock with salt if necessary.
1. Take a small amount of the stock and add to the peas. Grind to a puree with a stick blender or food processor.
1. Fry the garlic, onion and celery in the olive oil over a medium heat until they are cooked but not browned.
1. Add the rice to the pan and stir so that each grain is coated in oil. After a minute add the white wine which will quickly be absorbed by the rice.
1. Start adding the stock to the risotto one or two ladle fulls at a time, stirring and waiting for the rice to absorb the liquid before adding the next ladle. The rice takes about 20 minutes to cook.
1. Add the par-cooked brocolli, asparagus and lemon thyme to the risotto after 14 minutes so that the vegetables have chance to cook before the risotto is finished.
1. As soon as you have added the vegetables you should start cooking your scallops. Shallow fry in a mixture of olive oil and butter until they are just cooked through but have started to caramelise on the outside.
1. Add the pea puree after 18 minutes and continue cooking until the rice is cooked to your liking. Make sure that the risotto does not dry out, you are looking for a fairly runny consistency - remember that the rice will continue to absorb moisture after you serve.
1. When the rice is cooked add the butter, three-quarters of the parmesan cheese (if you not serving scallops) and a generous helping of freshly ground black pepper.
1. Serve the risotto immediately in warm bowls, with the scallops added or parmesan sprinkled on top.
"

risotto_recipe = Recipe.create!(:title => 'Risotto with peas, brocolli, asparagus and scallops',
                    :synopsis => 'A rich and luxurious supper.',
                    :preparation_time => 30,
                    :cooking_time => 25,
                    :description => risotto_description,
                    :ingredient_list => risotto_ingredient_list,
                    :preparation_method => risotto_preparation_method,
                    :category => 'non_vegetarian')
RecipePhoto.create!(:recipe => risotto_recipe, :title => 'risotto', :image => File.open('db/pictures/risotto1.jpeg'))
RecipePhoto.create!(:recipe => risotto_recipe, :title => 'risotto', :image => File.open('db/pictures/risotto2.jpeg'))

