import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'TP1';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class Recipe {
  late String picPath;
  late String name;
  late String desc;
  bool isSaved;
  Recipe({required this.picPath, required this.name, required this.desc, required this.isSaved});
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
      isSaved: false,
    ),
    Recipe(
      picPath: 'images/pain_epices.jpeg',
      name: "Pain d'épices",
      desc: '',
      isSaved: false,
    ),
    Recipe(
      picPath: 'images/royal_chocolat.jpeg',
      name: 'Royal au chocolat',
      desc: '',
      isSaved: false,
    ),
    Recipe(
      picPath: 'images/beignets.jpeg',
      name: 'Beignets de carnaval',
      desc: '-',
      isSaved: false,
    ),
    Recipe(
      picPath: 'images/tarte_citron.jpeg',
      name: 'Tarte au citron',
      desc: '',
      isSaved: false,
    ),
    Recipe(
      picPath: 'images/pancakes.jpeg',
      name: 'Pancakes',
      desc: '',
      isSaved: false,
    ),
    Recipe(
      picPath: 'images/cookies.jpeg',
      name: 'Cookies',
      desc: '',
      isSaved: false,
    ),
    Recipe(
      picPath: 'images/canneles.jpeg',
      name: 'Cannelés',
      desc: '',
      isSaved: false,
    ),
    Recipe(
      picPath: 'images/meringues.jpeg',
      name: 'Meringues',
      desc: '',
      isSaved: false,
    ),
    Recipe(
      picPath: 'images/shortbreads.jpeg',
      name: 'Shortbreads',
      desc: "Aka '123SBF'",
      isSaved: false,
    ),
    Recipe(
      picPath: 'images/tarte_mirabelles.jpeg',
      name: 'Tarte aux mirabelles',
      desc: '',
      isSaved: false,
    ),
    Recipe(
      picPath: 'images/gaufres_liegeoises.jpeg',
      name: 'Gaufres liégeoises',
      desc: '',
      isSaved: false,
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
              recipe.isSaved = false;
            } else {
              savedRecipes.add(recipe);
              recipe.isSaved = true;
            }
          });
        },
      ),
      onTap: () {
        //remplir
      },
    );
  }

}
