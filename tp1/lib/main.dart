import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'TP1';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      //home: MyStatefulWidget(),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyStatefulWidget(),
        Details.routeName: (context) => const Details(),
      },
    );
  }
}

class Recipe {
  late String picPath;
  late String name;
  late String desc;
  late String prepTime;
  late String cookTime;
  late int servings;
  List ingredients;
  Recipe({required this.picPath,
          required this.name,
          required this.desc,
          required this.prepTime,
          required this.cookTime,
          required this.servings,
          required this.ingredients});
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  final recipes = [
    Recipe(
      picPath: 'images/gaufrettes.jpeg',
      name: 'Gaufrettes',
      desc: '',
      prepTime: '1h',
      cookTime: '1h',
      servings: 8,
      ingredients: [],
    ),
    Recipe(
      picPath: 'images/pain_epices.jpeg',
      name: "Pain d'épices",
      desc: '',
      prepTime: '1h',
      cookTime: '1h',
      servings: 8,
      ingredients: [],
    ),
    Recipe(
      picPath: 'images/royal_chocolat.jpeg',
      name: 'Royal au chocolat',
      desc: '',
      prepTime: '1h',
      cookTime: '1h',
      servings: 8,
      ingredients: [],
    ),
    Recipe(
      picPath: 'images/beignets.jpeg',
      name: 'Beignets de carnaval',
      desc: '-',
      prepTime: '1h',
      cookTime: '1h',
      servings: 8,
      ingredients: [],
    ),
    Recipe(
      picPath: 'images/tarte_citron.jpeg',
      name: 'Tarte au citron',
      desc: '',
      prepTime: '1h',
      cookTime: '1h',
      servings: 8,
      ingredients: [],
    ),
    Recipe(
      picPath: 'images/pancakes.jpeg',
      name: 'Pancakes',
      desc: '',
      prepTime: '1h',
      cookTime: '1h',
      servings: 8,
      ingredients: [],
    ),
    Recipe(
      picPath: 'images/cookies.jpeg',
      name: 'Cookies',
      desc: '',
      prepTime: '1h',
      cookTime: '1h',
      servings: 8,
      ingredients: [],
    ),
    Recipe(
      picPath: 'images/canneles.jpeg',
      name: 'Cannelés',
      desc: '',
      prepTime: '1h',
      cookTime: '1h',
      servings: 8,
      ingredients: [],
    ),
    Recipe(
      picPath: 'images/meringues.jpeg',
      name: 'Meringues',
      desc: '',
      prepTime: '1h',
      cookTime: '1h',
      servings: 8,
      ingredients: [],
    ),
    Recipe(
      picPath: 'images/shortbreads.jpeg',
      name: 'Shortbreads',
      desc: "Aka '123SBF'",
      prepTime: '1h',
      cookTime: '1h',
      servings: 8,
      ingredients: [],
    ),
    Recipe(
      picPath: 'images/tarte_mirabelles.jpeg',
      name: 'Tarte aux mirabelles',
      desc: '',
      prepTime: '1h',
      cookTime: '1h',
      servings: 8,
      ingredients: [],
    ),
    Recipe(
      picPath: 'images/gaufres_liegeoises.jpeg',
      name: 'Gaufres liégeoises',
      desc: '',
      prepTime: '1h',
      cookTime: '1h',
      servings: 8,
      ingredients: [],
    ),
  ];

  final savedRecipes = <Recipe> [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  get tabs => [
    ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: recipes.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildRecipe(recipes[index]);
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    ),
    ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: savedRecipes.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildRecipe(savedRecipes[index]);
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    ),
    const Center(child: Text('Created on Jan 27, 2022 by Julia Zink')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
        backgroundColor: Colors.deepPurple,
      ),

      body: tabs[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_rounded),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_rounded),
            label: 'About',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildRecipe(Recipe recipe) {
    final alreadySaved = savedRecipes.contains(recipe);
    return ListTile(
      leading : Image.asset(recipe.picPath),
      title: Text(
        recipe.name,
      ),
      trailing: IconButton(
        icon: Icon(alreadySaved ? Icons.star_rounded : Icons.star_border_rounded),
        color: alreadySaved ? Colors.yellow : null,
        onPressed: () {
          setState(() {
            if (alreadySaved) {
              savedRecipes.remove(recipe);
            } else {
              savedRecipes.add(recipe);
            }
          });
        },
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          Details.routeName,
          arguments: Recipe(
            picPath: recipe.picPath,
            name: recipe.name,
            desc: recipe.desc,
            prepTime: recipe.prepTime,
            cookTime: recipe.cookTime,
            servings: recipe.servings,
            ingredients: recipe.ingredients,
          ),
        );
      }
    );
  }
}

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);
  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final recipe = ModalRoute.of(context)!.settings.arguments as Recipe;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            //Expanded(child: Text(recipe.name)),
            Text(recipe.name),
            const SizedBox(height: 25),
            Expanded(child: Image.asset(recipe.picPath)),
            const SizedBox(height: 10),
            Row(
              children: [
                Column(
                  //fill with ingredients
                ),
                Expanded(child: Text(recipe.desc)),
                //keep desc here
                Expanded(child: Text(recipe.prepTime)),
                Expanded(child: Text(recipe.cookTime)),
                Expanded(child: Text(recipe.servings.toString())),
              ],
            ),
          ],
        ),
      ),
    );
  }
}