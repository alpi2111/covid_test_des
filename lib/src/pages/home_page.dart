import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabControllerHome;
  TabController _tabControllerStatistics;
  @override
  void initState() {
    super.initState();
    _tabControllerHome = TabController(length: 2, vsync: this);
    _tabControllerStatistics = TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    _tabControllerHome?.dispose();
    _tabControllerStatistics?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.drag_handle),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(Icons.notifications),
          ),
        ],
        elevation: 0.0,
      ),
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(
            icon: Icon(Icons.home),
            title: 'Inicio',
            isIconBlend: true,
          ),
          TabItem(
            icon: Icon(Icons.insert_chart),
            title: 'Estadísticas',
            isIconBlend: true,
          ),
        ],
        style: TabStyle.reactCircle,
        curve: Curves.easeInOut,
        backgroundColor: Colors.deepPurple,
        controller: _tabControllerHome,
      ),
      body: TabBarView(
        controller: _tabControllerHome,
        children: [
          _TabViewHome(size: _size),
          Stack(
            children: [
              Container(
                color: Colors.deepPurple,
              ),
              Column(
                children: [
                  Text('Estadísticas'),
                  ConvexAppBar(
                    items: [
                      TabItem(
                        icon: Image.asset('assets/img/flags/mexico.png'),
                        isIconBlend: false,
                        title: 'Mexico',
                      ),
                      TabItem(
                        icon: Image.asset('assets/img/flags/earth.png'),
                        isIconBlend: true,
                        title: 'Mundo',
                      ),
                    ],
                    controller: _tabControllerStatistics,
                    curveSize: 0.0,
                    top: 0.0,
                    backgroundColor: Colors.deepPurple,
                    elevation: 0.0,
                    curve: Curves.easeInOut,
                    style: TabStyle.react,
                    height: 70.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 160.0,
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.0,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      shrinkWrap: true,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.orange,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Afectados'),
                                Text('336,851'),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Muertos'),
                                Text('9,620'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 120.0,
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 15.0,
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      shrinkWrap: true,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Recuperados'),
                                Text('9,620'),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.lightBlue,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Activos'),
                                Text('9,620'),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.deepPurple[300],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Serios'),
                                Text('9,620'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 0.0,
                child: Container(
                  height: _size.height * 0.3,
                  width: _size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TabViewHome extends StatelessWidget {
  const _TabViewHome({
    Key key,
    @required Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        FractionallySizedBox(
          alignment: Alignment.topCenter,
          heightFactor: 0.40,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black87,
                  offset: Offset(0.5, 1),
                  blurRadius: 5.0,
                ),
              ],
              color: Colors.deepPurple,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Covid-19',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Container(
                          width: 140,
                          height: 40,
                          decoration: ShapeDecoration(
                            shape: StadiumBorder(),
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '¿Te sientes enfermo?',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Si te sientes enfermo con cualquiera de los síntomas de covid-19 por favor llama o envía un mensaje inmediatamente para ayudarte',
                      style: TextStyle(color: Colors.white60),
                    ),
                    // SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FlatButton.icon(
                          onPressed: () {},
                          label: Text(
                            'Llama Ahora',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          icon: Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                          color: Colors.red,
                          shape: StadiumBorder(),
                        ),
                        FlatButton.icon(
                          onPressed: () async {
                            if (await canLaunch('sms://7821234567')) {
                              try {
                                launch('sms://7821234567');
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                          label: Text(
                            'Envia un SMS',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          icon: Icon(
                            Icons.sms,
                            color: Colors.white,
                          ),
                          color: Colors.blue,
                          shape: StadiumBorder(),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: _size.height * 0.25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Prevencion'),
              SizedBox(height: 20.0),
              Wrap(
                spacing: 30.0,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/img/icons_menu/distancia.png',
                        height: _size.width / 4,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '''Manten tu
distancia''',
                        textScaleFactor: 0.7,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        child: Hero(
                          tag: 'lavar_manos',
                          child: Image.asset(
                            'assets/img/icons_menu/lavar_manos.png',
                            height: _size.width / 4,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed('lavar_manos');
                        },
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '''Lava tus manos
constantemente''',
                        textScaleFactor: 0.7,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/img/icons_menu/mascarilla.png',
                        height: _size.width / 4,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '''Usa una
mascarilla''',
                        textScaleFactor: 0.7,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 30.0,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: 120,
                width: _size.width - 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepPurple[300],
                      Colors.deepPurple,
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/img/icons_menu/mujer_escudo.png',
                      height: 150,
                    ),
                    SizedBox(width: 20.0),
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '¡Ház tu propio test!',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '''Sigue las instrucciones
para hacer tu test''',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: 25.0),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
