# encoding: utf-8
Recipe.destroy_all

recipe1 = Recipe.create!(:title => 'Baingan ka Bharta',
               :synopsis => 'Scrumptious smoked aubergine mash made from simple ingredients, a popular choice of North India.',
               :ingredient_list => 'secret',
               :preparation_method => 'secret',
               :category => 'vegan')
RecipePhoto.create!(:recipe => recipe1, :title => 'Baingan ka Bharta', :image => File.open('db/pictures/baingankabharta1.jpeg'))
RecipePhoto.create!(:recipe => recipe1, :title => 'Baingan ka Bharta', :image => File.open('db/pictures/baingankabharta2.jpeg'))

recipe2 = Recipe.create!(:title => 'Dal Makhni',
               :synopsis => "Mixture of various lentils and a touch of cream - a well kept secret (or Not?) of every 'Dadiji' in a Punjabi family.",
               :ingredient_list => 'secret',
               :preparation_method => 'secret',
               :category => 'vegetarian')
RecipePhoto.create!(:recipe => recipe2, :title => 'Dal Makhni', :image => File.open('db/pictures/IMG_2785.jpeg'))

recipe3 = Recipe.create!(:title => 'Bhindi',
               :synopsis => 'My take on Bhindi (Okra) - cooked with simple ingredients like green chillies, garlic, tomatoes and peanuts (optional).',
               :ingredient_list => 'secret',
               :preparation_method => 'secret',
               :category => 'vegan')
RecipePhoto.create!(:recipe => recipe3, :title => 'Bhindi', :image => File.open('db/pictures/IMG_2787.jpeg'))

shepu_description =

"This recipe is from the western part of Indian (Maharashtra state) and called 'Shepu chi bhaji' locally. If I were to translate it to English literally, I will have to borrow a word from Hindi called 'Sabzi' which means a dry dish made from any vegetable. No, it's NOT a curry. So with my limited vocabulary in English, I have chosen to call it 'Dill Sabzi' which is simply a dry dish of Dill with no gravy.

Dill Sabzi is essentially a Maharashtrian farmer's meal, typically served with 'Bhakri' (A flat bread made out of barley or millet). Given a farmer's daughter that I am, I couldn't resist sharing this dish. For all those garlic and chilli fans like me, note that there's no hard and fast rule when it comes to using these two ingredients in food, so feel free to bend the rules and use as much garlic and chilli as you like OR as little as you like. I won't judge you although I might not invite you over dinner if you can't take the heat :P. So here you go.."

shepu_ingredient_list =
"* 2 tablespoons of *vegetable oil*
* 2 big bunches of *Dill* (you can get big bunches of Dill from any Indian grocery store)
* 5-6 hot *green chillies* (by hot I mean Indian chillies or bird's eyes green chillies from any store)
* 4-5 cloves of *garlic*
* 3 tablespoons of *Moong Dal* (*Mung lentils*) or *Chana Dal* (*yellow split pea* lentils) as per your taste.
* Salt as per your taste."

shepu_preparation_method =
"1. Sort each bunch of Dill leaving the bigger stem aside but picking the leaves and delicate stalk. Collect the leafy parts with their delicate stalks in a bowl. This is 'sorting' the dill i.e seperating gritty and chunky stems from the tasty leaves and stalks.

1. Coarsely chop the collected stalks with leaves and put them a bowl and pour some cold water in it to wash out all the grit. I generally pour the water down the drain and repeat the process twice but leave the water in bowl the last time.

1. Chop some green chillies and garlic.

1. Pour some oil in a frying pan. After the oil gets hot, put the chillies and garlic into it.

1. Collect the chopped dill from the bowl containing water and start adding it into the frying pan until all the dill is filtered from the bowl. I know filtering the dill from a bowl of water could get messy, so if you want you can use colander or sieve. Also note that the quantity of dill might appear huge in the frying pan but it will shrink down to a very small portion as it cooks. I suggest using a bigger sized pan for cooking dill.

1. Stir the pan to mix all the contents evenly before covering it with a lid to cook it on medium flame for 10 minutes. Keep stirring in between to make sure the dill has enough moisture left and has not dried out. Keep cooking until the dill is soft, moist yet dry."

recipe4 = Recipe.create!(:title => 'Dill Sabzi',
               :native_title => 'Shepu chi bhaji',
               :synopsis => "Made with fresh dill, garlic and green chillies, a simple and healthy Maharashtrian farmer's meal",
               :cooking_time => 20,
               :description => shepu_description,
               :ingredient_list => shepu_ingredient_list,
               :preparation_method => shepu_preparation_method,
               :category => 'vegan')
RecipePhoto.create!(:recipe => recipe4, :title => 'Dill Sabzi', :image => File.open('db/pictures/dill1.jpeg'))
RecipePhoto.create!(:recipe => recipe4, :title => 'Dill Sabzi', :image => File.open('db/pictures/dill_secondary.jpeg'))

recipe5_description =
"This dish is perfect for an evening meal with a nice bottle of wine. The sauce vierge is prepared from olive oil, tomatoe, lemon juice and torn basil. This is my take on the original French recipe so I have used dill instead of basil and some smashed garlic as it suits my palette. See if you like it ..."

recipe5_ingredient_list = 
"#### For the Salmon :

* 100g *salmon* fillet, skin removed
* 1 tbsp *olive oil*
* salt and freshly *ground black pepper*

#### For the sauce vierge :

* 1 tbsp *olive oil*
* 1 *tomato*, skin and seeds removed, cut into small dice
* 1/2 *lemon*, juice only
* 1/2 *lime*, juice only
* 1 clove of smashed *garlic* (optional)
* salt and freshly *ground black pepper*
* handful fresh *dill* leaves and stalks, torn. I used quite a lot of it because I like it :)

#### To serve :

* handful steamed *seaweed*
* oven glazed *ripe wine tomatoes* (optional)
* roasted *potatoes*"

recipe5_preparation_method = 
"1. For the Salmon, heat the olive oil in a griddle pan and cook the salmon for 5-7 minutes or until cooked through, turning it over halfway through. Season it with little salt and ground pepper as per your taste. (NB The salmon is cooked when the flesh is opaque.)

 1. For the sauce vierge, mix olive oil with chopped deseeded tomato with skin removed, lemon, lime and chopped dill leaves in a small bowl. Heat all the ingredients gently in a pan for 1-2 minutes until warmed through.

 1. To serve, put the salmon onto a plate with blushed wine tomatoes, steamed seaweed and roasted potatoes. Drizzle the sauce vierge around the outside of the plate."

recipe5 = Recipe.create!(:title => 'Salmon avec sauce vierge',
               :synopsis => "Mouthwatering and healthy Salmon dish drizzled with sauce vierge and Seaweed as a delicious accompaniment to go with it.",
               :description => recipe5_description,
               :ingredient_list => recipe5_ingredient_list,
               :preparation_method => recipe5_preparation_method,
               :category => 'non_vegetarian')
RecipePhoto.create!(:recipe => recipe5, :title => 'Salmon avec sauce vierge ', :image => File.open('db/pictures/salmoncloseup1.jpeg'))
RecipePhoto.create!(:recipe => recipe5, :title => 'Salmon avec sauce vierge ', :image => File.open('db/pictures/wholeplate.jpeg'))
RecipePhoto.create!(:recipe => recipe5, :title => 'Salmon avec sauce vierge ', :image => File.open('db/pictures/salmonweed1.jpeg'))


cauli_paratha_description =
"As a kid, I grew up in a family where breakfast was never always a bowl of cereal or a toast. My mum often treated us with tastier breakfasts that could also be packed away into a lunchbox (more colloquially called ‘Tiffin box’) to take to school. One of such savoury breakfast cum lunch delights was ‘Gobi Paratha’ which can be eaten anytime during the day.

It is typically served with yoghurt or a generous spoon of ghee or butter in India, but depending on whether you want to be vegan or vegetarian, you can have a half boiled egg to dunk these lovely bites of Parathas into runny egg yolk, just like soldiers ☺  OR even serve it with pickled vegetables and keep it low calorie by leaving out the butter/ghee altogether – take your pick!

This is a simple recipe that I use because I don’t like adding too many spices into it."

cauli_paratha_ingredient_list = 
"#### For dough making :

* 100 - 200 gms of *whole wheat flour*
* 1 – ½ a glass of water depending on your quantity of flour
* ½ a teaspoon of *ajwain* or *carom seeds*
* Salt as per your taste (optional). I tend not to put any salt here.

#### For filling :

* 1 -2 cups of grated *cauliflower*
* 1 or 2 chopped *green chillies* as per your taste or none at all ☺.
* Chopped *coriander leaves* depending on how much you like them.  I normally use 1-2 spoons of them.
* Salt to taste.

#### For rolling and light frying :

* 50 – 70 gms of whole wheat flour for dusting
* *Vegetable oil* to cook.

"
cauli_paratha_preperation_method =
"#### Making dough :

1. In a large bowl, mix flour, ajwain (carom seeds) together before adding water to the mixture in very small quantities, bit by bit to make soft dough. The best dough is kneaded with hands on a slightly greased surface to make it more palpable.

1. Cover the dough with a damp cloth and let it rest for 10 minutes.

#### Making filling for the dough:

1. Squeeze out water/moisture from the grated cauliflower by pressing it in between your hands. Make sure the cauliflower is dry enough. Also, never use a blender or food processor to shred or grate the cauliflower. I do it manually using a grater.

1. Add coriander, chillies and salt to the cauliflower and mix well.

#### Making the Paratha:

1. Divide the dough into 5 -  6 medium sized balls.

1. Take one ball of dough and roll it into a very small sized flatbread using rolling pin. If it sticks the board, dust it with the flour.

1. Take small portion of cauliflower mixture, in a slightly smaller proportion to the ball of dough and place it on top of the half rolled dough.

1. Cover and seal the cauliflower mix with the dough by bringing the round edges of the half rolled dough together. Once sealed, dust your hands with flour and try to flatten it with hands.

1. Now start rolling the dough with mixture again into a bigger size than earlier until the cauliflower mixture gets evenly spread on a flat surface.

1. Put this rolled Paratha onto a flat hot pan (or tava).

1. Once it gets cooked on one side, flip it to cook on the other side.

1. Brush the top of Paratha with oil or ghee.

1. Flip it again to brush the other side with oil or ghee.

1. Let the Paratha cook until it's light brown on both the sides.

1. Place the cooked Parathas on plate and serve it with yoghurt or butter or pickled carrots, chillies or lime etc.


You can follow the same recipe to make 'Parathas' of all sorts, using radish or potatoes or cottage cheese as filling."

cauli_paratha_recipe = Recipe.create!(:title => 'Stuffed cauliflower flatbread',
                    :native_title => 'Gobi Paratha',
                    :synopsis => 'Popular Indian flatbread stuffed with cauliflower, coriander and green chillies.',
                    :preparation_time => 20,
                    :cooking_time => 20,
                    :description => cauli_paratha_description,
                    :ingredient_list => cauli_paratha_ingredient_list,
                    :preparation_method => cauli_paratha_preperation_method,
                    :category => 'vegetarian')

RecipePhoto.create!(:recipe => cauli_paratha_recipe, :title => 'Stuffed cauliflower flatbread', :image => File.open('db/pictures/cauli_paratha_primary.jpeg'))
RecipePhoto.create!(:recipe => cauli_paratha_recipe, :title => 'Stuffed cauliflower flatbread', :image => File.open('db/pictures/cauli_paratha_secondary.jpeg'))
RecipePhoto.create!(:recipe => cauli_paratha_recipe, :title => 'Stuffed cauliflower flatbread', :image => File.open('db/pictures/cauli_grating.jpeg'))
RecipePhoto.create!(:recipe => cauli_paratha_recipe, :title => 'Stuffed cauliflower flatbread', :image => File.open('db/pictures/dough.jpeg'))
RecipePhoto.create!(:recipe => cauli_paratha_recipe, :title => 'Stuffed cauliflower flatbread', :image => File.open('db/pictures/mixture.jpeg'))
RecipePhoto.create!(:recipe => cauli_paratha_recipe, :title => 'Stuffed cauliflower flatbread', :image => File.open('db/pictures/presseddough.jpeg'))
RecipePhoto.create!(:recipe => cauli_paratha_recipe, :title => 'Stuffed cauliflower flatbread', :image => File.open('db/pictures/rollit.jpeg'))
RecipePhoto.create!(:recipe => cauli_paratha_recipe, :title => 'Stuffed cauliflower flatbread', :image => File.open('db/pictures/fryparatha.jpeg'))


User.destroy_all
User.create!(:email => 'rieethaa@zanzaneet.com', :password => 'secret', :password_confirmation => 'secret')

BlogPost.destroy_all
BlogPost.create!(:title => 'Washing up Indian style',
    :content =>
"Have you ever wondered why your vessels are left mucky despite all the effort you put into your washing-up?
Well its because you are doing it all wrong! Let Mummyji put you straight...
First of all drain away all that mucky water, thats right, unplug the sink - we are going to be washing under clean running water.
Grab a suitably abrasive wire scrub and get to work on those stainless steel vessels with plenty of elbow grease.
Don't worry if your arm starts to ache - that just means you are doing a decent job of it.")

BlogPost.create!(:title => 'Get your spluttering action on',
    :content =>
"Its really important to allow time (and heat) to let the oils (and flavour) get released from your whole spices.
Don't be in too much of a hurry to put the garlic and other wet ingredients into the vessel.
Make sure you get some serious spluttering action first!")

