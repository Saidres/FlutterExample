import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Santiago',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      home: const _MyAppStateful(),
    );
  }
}

class _MyAppStateful extends StatefulWidget {
  const _MyAppStateful();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<_MyAppStateful> {
  int _selectedIndex = 0; // Estado para realizar un seguimiento del ítem seleccionado
  final List<Color> _columnColors = [Colors.yellow, Colors.blue, Colors.red];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      drawer: _buildDrawer(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Santiago App'),
    );
  }

  Widget _buildBody() {

    

    switch (_selectedIndex) {
      case 0:
        return _buildHomeScreen();
      case 1:
        return _buildBusinessScreen();
      case 2:
        return _buildSchoolScreen();
      default:
        return Container();
    }
  }

  Widget _buildHomeScreen() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildColoredContainer(_columnColors[0]),
            _buildColoredContainer(_columnColors[1]),
            _buildColoredContainer(_columnColors[2]),
            _buildStarRow(),
            _buildElevatedButton('Cambiar color de la columna', () {
              setState(() {
                _columnColors.shuffle();
              });
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildBusinessScreen() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                hintText: 'Enter text',
              ),
            ),
            _buildUserCard('Santiago Chamorro', 'santiago@example.com'),
            const Spacer(),
            _buildExpansionTileButton('SizedBox Button', _buildListView()),
          ],
        ),
      ),
    );
  }

  Widget _buildSchoolScreen() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildElevatedButton('Widget específico de School', () {
            }),
          ],
        ),
      ),
    );
  }

  Container _buildColoredContainer(Color color) {
    return Container(
      color: color,
      width: 50,
      height: 100,
    );
  }

  Row _buildStarRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.star, color: Colors.amber),
        Icon(Icons.star, color: Colors.amber),
        Icon(Icons.star, color: Colors.amber),
      ],
    );
  }

  ElevatedButton _buildElevatedButton(String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }

  Card _buildUserCard(String name, String email) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(name),
        subtitle: Text(email),
      ),
    );
  }

  Widget _buildExpansionTileButton(String label, Widget content) {
    return ExpansionTile(
      title: ElevatedButton(
        onPressed: () {
          setState(() {
            // Cambiar el estado de la expansión de la lista
          });
        },
        child: Text(label),
      ),
      children: <Widget>[content],
    );
  }

  ListView _buildListView() {
    return ListView(
      children: const [
        ListTile(
          title: Text('Item 1'),
        ),
        ListTile(
          title: Text('Item 2'),
        ),
        ListTile(
          title: Text('Item 3'),
        ),
      ],
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Opciones',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          _buildDrawerItem('Home', () {
            setState(() {
              _selectedIndex = 0;
            });
            Navigator.pop(context); // Cierra el Drawer
          }),
          _buildDrawerItem('Business', () {
            setState(() {
              _selectedIndex = 1;
            });
            Navigator.pop(context); // Cierra el Drawer
          }),
          _buildDrawerItem('School', () {
            setState(() {
              _selectedIndex = 2;
            });
            Navigator.pop(context); // Cierra el Drawer
          }),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
      ],
      selectedItemColor: Colors.amber,
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
