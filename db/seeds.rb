# encoding: utf-8
Recipe.destroy_all

bharta_description =
"I love this dish because I love the flavours that blend perfectly with the smokiness of aubergines. This dish has been my all time favourite and it’s so easy to cook.

I tend to cook this with baby aubergines because they are packed with flavours in their seeds than the usual big size aubergines.  You can choose either.

As said before, I like to cook with simple ingredients and here’s the recipe for it."

bharta_ingredient_list =
"* 8-12 *baby aubergines* or 1 big size *aubergine*
* 4-6 cloves of *garlic*, thinly sliced
* 1 tablespoon *vegetable oil*
* 1 teaspoon *mustard seeds*
* 1 teaspoon *cumin seeds*
* ½ teaspoon *turmeric powder*
* 2-3 medium sized *shallots* or 1 big *onion*, finely chopped
* 2-3 *green chillies*, sliced
* 2 medium sized *tomatoes* or 1 big tomato
* ½ inch *ginger*, chopped into thin slits (optional)
* chopped *coriander* 
* salt to taste"

bharta_preperation_method =
"1. Using fingers, tear off the green skin at the bottom of aubergine stalk without breaking or removing the stalk itself. Lightly grease the baby aubergines with oil from outside and roast each one of them on a medium flame of cooker until the skin gets charred. Place them on a kitchen towel to cool down for 10 mins.

1. Start by peeling the charred skin of aubergines using fingers. 
Top tip: You could make this fiddly job slightly easy by dipping your fingers into a bowl of water each time you peel the skin off the aubergine.

1. Randomly chop or mash the smoked and peeled aubergines.

1. Heat oil in a pan or ('Kadhai' as I tend to do). Add mustard and cumin seeds and leave them to splutter in the pan.

1. Add chopped garlic, shallots and green chillies to the mixture in the pan and sauté gently till the garlic and onion get slightly cooked.

1. Now add turmeric powder and mashed aubergines into the pan (or 'Kadhai'). Mix the aubergines well with the spices in the pan and cover it with a lid for 1 minute.

1. Add the chopped tomatoes and optionally, ginger. Let it cook with the lid on for another 5 – 6 minutes until the aubergine and it’s stalks get tender. Serve hot with bread or chapati."

bharta_recipe = Recipe.create!(:title => 'Smoked aubergine mash',
                    :native_title => 'Baingan ka bharta',
                    :synopsis => 'Fire roasted aubergines cooked with garlic, onions, green chillies and tomatoes. Vegan and gluten free dish',
                    :preparation_time => 40,
                    :cooking_time => 10,
                    :description => bharta_description,
                    :ingredient_list => bharta_ingredient_list,
                    :preparation_method => bharta_preperation_method,
                    :category => 'vegan')

RecipePhoto.create!(:recipe => bharta_recipe, :title => 'Baingan ka bharta', :image => File.open('db/pictures/bharta1.jpeg'))
RecipePhoto.create!(:recipe => bharta_recipe, :title => 'Smoked aubergine mash', :image => File.open('db/pictures/burntaubergine.jpeg'))
RecipePhoto.create!(:recipe => bharta_recipe, :title => 'Smoked aubergine mash', :image => File.open('db/pictures/bharta2.jpeg'))

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

###############################################################################################################################
# Quinoa recipe

quinoa_description = "
Quinoa is a seed that is a staple diet in parts of South America. It has recently become popular in other parts of the world
having been touted as a so-called superfood, and is supposed to have various health benefits. That is all fine with us,
but we like it because it tastes good. If you have never tried it give it a go, you'll find it has a slightly nutty flavour and unusual
texture. And if you don't like it so much or just havn't got any in the cupboard you could always try this recipe with cous cous or bulgar wheat.

The peppers in this recipe are roasted over a flame to blacken the skin before allowing them to cool and peel. This process is a bit of a pain
but it really brings out a sweetness and flavour intensity so we think its worth it. But if you don't have time then you could always stir fry them.

Finally a quick word about those pomegranites, open them carefully and separate the seeds from the pith inside the fruit. If you have an apron
then we won't judge you for wearing it, but whatever you do don't wear your favourite white t-shirt,
we find that pomengranite juice is strangely attracted to white clothing and stains can be tricky to remove.
"

quinoa_ingredient_list = "
* 2 large whole *red pepper*s
* 200g *quinoa* (a mixture of white and red)
* *olive oil* for shallow frying
* 1 teaspoon of *cumin* seeds
* 1/2 teaspoon of *coriander* seeds (roughly crushed in a pestle and mortar)
* 1-6 fresh *green chillies* (according to taste) chopped
* 1 large white *onion*
* 200g *brocolli* cut into small florets
* 1 fresh *pomegranite*
* a handful of chopped fresh *coriander* leaves
* 100g greek yoghurt
* *salt* to taste
"

quinoa_preperation_method = "
1. First prepare the peppers. First wash and then blacken the skins over a gas flame (you could use a kitchen blow torch if you have one).
   The skins should be partly blackened and blistered but the flesh should not be cooked through. Place the peppers inside a polythene bag and set them aside to cool off.
1. Boil the quinoa according to the instructions on the packet.
1. Whilst the quinoa is cooking open the pomegranite and carefully extract the seeds. Set the seeds to one side and discard the skin and pith.
1. In a stir-fry pan heat the oil over a medium heat.
1. When the oil is hot add the cumin and coriander seeds and cook for a minute or until they start to brown (but be careful not to burn them).
1. Add the onion and fry until it starts to take a little colour.
1. Add the brocolli and stir fry over a medium-low heat for 3-4 minutes. If you prefer your brocolli well done you can add a spoon full of water and leave the lid on for a couple of minutes to generate some steam.
1. Whilst the brocolli is cooking remove the blackened skin from the peppers and chop roughly.
1. Add the fresh coriander, cooked peppers and drained quinoa to the pan and give it a good toss to mix it all together with the other ingredients.
1. Serve in warm plates, add a dollop of yoghurt and sprinkle the pomengranite seeds on top. Enjoy with a glass of your preferred beverage.
"

quinoa_recipe = Recipe.create!(:title => 'Quinoa with red peppers and brocolli',
                    :synopsis => 'Roasted red peppers, spicy stir-fried vegetables and quinoa with a pomegranite and yoghurt topping',
                    :preparation_time => 20,
                    :cooking_time => 20,
                    :description => quinoa_description,
                    :ingredient_list => quinoa_ingredient_list,
                    :preparation_method => quinoa_preperation_method,
                    :category => 'vegetarian')
RecipePhoto.create!(:recipe => quinoa_recipe, :title => 'Quinoa', :image => File.open('db/pictures/quinoa.jpeg'))


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

