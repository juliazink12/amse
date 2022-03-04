import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' as math;

const pi = math.pi;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'TP2';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyStatefulWidget(),
        Exercice1.routeName: (context) => Exercice1(),
        Exercice2.routeName: (context) => Exercice2(),
        Exercice3.routeName: (context) => Exercice3(),
        Exercice4.routeName: (context) => Exercice4(),
        Exercice5.routeName: (context) => Exercice5(),
        Exercice6.routeName: (context) => Exercice6(),
        Exercice7.routeName: (context) => Exercice7(),
      },
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  final exercices = ["Exercice 1", "Exercice 2", "Exercice 3",
    "Exercice 4", "Exercice 5", "Exercice 6", "Exercice 7", ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercices'),
        backgroundColor: Colors.deepPurple,
      ),

      body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: exercices.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildExercice(exercices[index]);
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ),
      );
  }


  Widget _buildExercice(String exercice) {
    return ListTile(
        title: Text(exercice),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          if (exercice == "Exercice 1") {
            Navigator.pushNamed(
              context,
              Exercice1.routeName,
              arguments: exercice,
            );
          }
          else if (exercice == "Exercice 2") {
            Navigator.pushNamed(
              context,
              Exercice2.routeName,
              arguments: exercice,
            );
          }
          if (exercice == "Exercice 3") {
            Navigator.pushNamed(
              context,
              Exercice3.routeName,
              arguments: exercice,
            );
          }
          if (exercice == "Exercice 4") {
            Navigator.pushNamed(
              context,
              Exercice4.routeName,
              arguments: exercice,
            );
          }
          if (exercice == "Exercice 5") {
            Navigator.pushNamed(
              context,
              Exercice5.routeName,
              arguments: exercice,
            );
          }
          if (exercice == "Exercice 6") {
            Navigator.pushNamed(
              context,
              Exercice6.routeName,
              arguments: exercice,
            );
          }
          if (exercice == "Exercice 7") {
            Navigator.pushNamed(
              context,
              Exercice7.routeName,
              arguments: exercice,
            );
          }
        }
    );
  }
}

class Exercice1 extends StatelessWidget {
  const Exercice1({Key? key}) : super(key: key);
  static const routeName = '/exercice1';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 1'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Image(image: NetworkImage('https://picsum.photos/512/1024')),
      ),
    );
  }
}

class Exercice2 extends StatefulWidget {
  const Exercice2({Key? key}) : super(key: key);
  static const routeName = '/exercice2';
  @override
  State<Exercice2> createState() => _Exercice2State();
}

class _Exercice2State extends State<Exercice2> {
  double rotateX = 0;
  double rotateY = 0;
  double scaleValue = 1;
  bool mirror = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercice 2"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              height: 400,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(color: Colors.white),
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationX(rotateX)..rotateY(rotateY+pi*(mirror?1:0))..scale(scaleValue),
                child: Image.network('https://picsum.photos/1024/1024'),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Rotate X: "),
                Expanded(
                  child: Slider(
                    value: rotateX,
                    min: -pi,
                    max: pi,
                    onChanged: (double value) {
                      setState(() {
                        rotateX = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Rotate Y: "),
                Expanded(
                  child: Slider(
                    value: rotateY,
                    min: -pi,
                    max: pi,
                    onChanged: (double value) {
                      setState(() {
                        rotateY = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("   Scale:   "),
                Expanded(
                  child: Slider(
                    value: scaleValue,
                    min: 0,
                    max: 1,
                    onChanged: (double value) {
                      setState(() {
                        scaleValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Mirror: "),
                Checkbox(
                  value: mirror,
                  onChanged: (value) {
                    setState(() {
                      mirror = value as bool;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Exercice3 extends StatelessWidget {
  const Exercice3({Key? key}) : super(key: key);
  static const routeName = '/exercice3';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice3'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: const SizedBox(height: 50),
      ),
    );
  }
}

class Tile {
  String imageURL;
  Alignment alignment;
  Tile({required this.imageURL, required this.alignment});
  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }
}

class Exercice4 extends StatefulWidget {
  const Exercice4({Key? key}) : super(key: key);
  static const routeName = '/exercice4';
  @override
  State<Exercice4> createState() => _Exercice4State();
}

class _Exercice4State extends State<Exercice4> {
  Tile tile = new Tile(
      imageURL: 'https://picsum.photos/1024/1024',
      alignment: Alignment.center,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 4'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
              children: [
                SizedBox(
                  width: 150.0,
                  height: 150.0,
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    child: this.createTileWidgetFrom(tile),
                  ),
                ),
                Container(
                  width: 400,
                  height: 400,
                  child: buildWidget(tile),
                ),
              ],
          ),
      ),
    );
  }
  Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile.croppedImageTile(),
      onTap: () {
        print("tapped on tile");
      },
    );
  }
  Widget buildWidget(Tile tile) {
    return Image.network(tile.imageURL);
  }
  Widget buildCroppedWidget(Tile tile) {
    return FittedBox(
        child: Image.network(tile.imageURL, fit: BoxFit.cover),
        fit: BoxFit.fill
    );
  }
}

class Exercice5 extends StatefulWidget {
  const Exercice5({Key? key}) : super(key: key);
  static const routeName = '/exercice5';
  @override
  State<Exercice5> createState() => _Exercice5State();
}

class _Exercice5State extends State<Exercice5> {
  Image image = Image.network('https://picsum.photos/1024/1024');
  double sections = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercice 5"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: SizedBox(
                width: 400,
                height: 400,
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: sections.round(),
                    childAspectRatio: 1,
                  ),
                  children: List<Widget>.generate((sections*sections).round(), (int i) {
                    return Builder(builder: (BuildContext context) {
                      return croppedImages(image, sections)[i];
                    });
                  }),
                ),
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Cases: "),
                Expanded(
                  child: Slider(
                    value: sections,
                    min: 3,
                    max: 7,
                    divisions: 4,
                    onChanged: (double value) {
                      setState(() {
                        sections = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  List<Widget> croppedImages(Image image, double sections) {
    List<Widget> widgetList = [];
    for (int i=0; i<sections; i++) {
      for (int j=0; j<sections; j++) {
        widgetList.add(
          Container(
            padding: const EdgeInsets.all(1),
            child: FittedBox(
              fit: BoxFit.fill,
              child: ClipRect(
                child: Container(
                  child: Align(
                    alignment: Alignment(-1+2*j/(sections-1), -1+2*i/(sections-1)),
                    widthFactor: 1/sections,
                    heightFactor: 1/sections,
                    child: image,
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }
    return widgetList;
  }
}

class Exercice6 extends StatefulWidget {
  const Exercice6({Key? key,}) : super(key: key);
  static const routeName = '/exercice6';
  @override
  State<Exercice6> createState() => _Exercice6State();
}

class _Exercice6State extends State<Exercice6> {
  Image image = Image.network('https://picsum.photos/1024/1024');
  double sections = 3;
  int currentPosition = 0;
  int newPosition = 0;
  late List<Widget> widgetList = croppedImages(image, sections);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercice 6"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: SizedBox(
                width: 400,
                height: 400,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: sections.round(),
                    childAspectRatio: 1,
                  ),
                  itemCount: (sections*sections).round(),
                  itemBuilder: (BuildContext context, int i) {
                    return InkWell(
                      child: widgetList[i],
                      onTap: () {
                        setState(() {
                          updateCroppedImages(i);
                        });
                      },
                    );
                  }
                ),
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Cases: "),
                Expanded(
                  child: Slider(
                    value: sections,
                    min: 3,
                    max: 7,
                    divisions: 4,
                    onChanged: (double value) {
                      setState(() {
                        sections = value;
                        currentPosition = 0;
                        newPosition = 0;
                        widgetList = croppedImages(image, sections);
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  List<Widget> croppedImages(Image image, double sections) {
    List<Widget> widgetList = [];
    for (int i=0; i<sections; i++) {
      for (int j=0; j<sections; j++) {
        widgetList.add(
          Container(
            padding: const EdgeInsets.all(1),
            child: FittedBox(
              fit: BoxFit.fill,
              child: ClipRect(
                child: Container(
                  child: Align(
                    alignment: Alignment(-1+2*j/(sections-1), -1+2*i/(sections-1)),
                    widthFactor: 1/sections,
                    heightFactor: 1/sections,
                    child: image,
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }
    widgetList[0] = Container(
      alignment: Alignment.center,
      child: Icon(Icons.star_border_rounded, color: Colors.deepPurple),
      color: Colors.deepPurple[100],
    );
    return widgetList;
  }
  void updateCroppedImages(int m) {
    if (areAdjacent(currentPosition, m, sections)) {
      Widget move = widgetList[currentPosition];
      widgetList[currentPosition] = widgetList[m];
      widgetList[m] = move;
      currentPosition = m;
    }
    else {
      return;
    }
  }
  bool areAdjacent(int w1, int w2, double sections) {
    int k = sections.round();
    if (w2==w1+1 && w2%k!=0) {
      return true;
    }
    else if (w2==w1-1 && w1%k!=0) {
      return true;
    }
    else if (w2==w1+k && w2>k-1) {
      return true;
    }
    else if (w2==w1-k && w1>k-1) {
      return true;
    }
    return false;
  }
}

class Exercice7 extends StatefulWidget {
  const Exercice7({Key? key,}) : super(key: key);
  static const routeName = '/exercice7';
  @override
  State<Exercice7> createState() => _Exercice7State();
}

class _Exercice7State extends State<Exercice7> {
  Image image = Image.network('https://picsum.photos/1024/1024');
  double sections = 3;
  int currentPosition = 0;
  int newPosition = 0;
  late List<Widget> widgetList = croppedImages(image, sections);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercice 7"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: SizedBox(
                width: 400,
                height: 400,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: sections.round(),
                      childAspectRatio: 1,
                    ),
                    itemCount: (sections*sections).round(),
                    itemBuilder: (BuildContext context, int i) {
                      return InkWell(
                        child: widgetList[i],
                        onTap: () {
                          setState(() {
                            updateCroppedImages(i);
                          });
                        },
                      );
                    }
                ),
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Cases: "),
                Expanded(
                  child: Slider(
                    value: sections,
                    min: 3,
                    max: 7,
                    divisions: 4,
                    onChanged: (double value) {
                      setState(() {
                        sections = value;
                        currentPosition = 0;
                        newPosition = 0;
                        widgetList = croppedImages(image, sections);
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  List<Widget> croppedImages(Image image, double sections) {
    List<Widget> widgetList = [];
    for (int i=0; i<sections; i++) {
      for (int j=0; j<sections; j++) {
        widgetList.add(
          Container(
            padding: const EdgeInsets.all(1),
            child: FittedBox(
              fit: BoxFit.fill,
              child: ClipRect(
                child: Container(
                  child: Align(
                    alignment: Alignment(-1+2*j/(sections-1), -1+2*i/(sections-1)),
                    widthFactor: 1/sections,
                    heightFactor: 1/sections,
                    child: image,
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }
    //widgetList.shuffle();
    int p;
    int t = (sections*sections).round();
    for (p=0; p<100*t; p++) {
      int w = math.Random().nextInt(t-1);
      if (areAdjacent(currentPosition, w, sections)) {
        Widget move = widgetList[currentPosition];
        widgetList[currentPosition] = widgetList[w];
        widgetList[w] = move;
        currentPosition = w;
      }
    }
    Widget w0 = widgetList[0];
    widgetList[0] = Stack(
      children: <Widget> [
        w0,
        Align(
          alignment: Alignment.center,
          child: Icon(Icons.star_rounded, color: Colors.white),
        )
      ],
    );
    currentPosition = 0;
    newPosition = 0;
    return widgetList;
  }
  void updateCroppedImages(int m) {
    if (areAdjacent(currentPosition, m, sections)) {
      Widget move = widgetList[currentPosition];
      widgetList[currentPosition] = widgetList[m];
      widgetList[m] = move;
      currentPosition = m;
    }
    else {
      return;
    }
  }
  bool areAdjacent(int w1, int w2, double sections) {
    int k = sections.round();
    if (w2==w1+1 && w2%k!=0) {
      return true;
    }
    else if (w2==w1-1 && w1%k!=0) {
      return true;
    }
    else if (w2==w1+k && w2>k-1) {
      return true;
    }
    else if (w2==w1-k && w1>k-1) {
      return true;
    }
    else {
      return false;
    }
  }
}