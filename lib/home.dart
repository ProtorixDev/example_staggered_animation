import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0,left: 10,right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 32,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text('Staggered Animations',style: TextStyle(fontWeight: FontWeight.w800,color: Colors.black,fontSize: 30)),
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  child:  Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      controller: _tabController,
                      labelColor: Colors.black,
                      labelPadding: const EdgeInsets.only(left: 20,right: 20),
                      unselectedLabelColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: CircleTabIndicator(color: Colors.red,radius: 4),
                      isScrollable: true,
                      tabs: const [
                        Tab(text: 'Animation1'),
                        Tab(text: 'Animation2'),
                        Tab(text: 'Animation3'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children:   [
                      Animation1(),
                      Animation2(),
                      Animation3(),
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color:color,radius:radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {

    Paint _paint = Paint();

    _paint.color = color;

    _paint.isAntiAlias = true;

    final Offset circleOffset = Offset(cfg.size!.width/2,cfg.size!.height-radius);

    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }
}

Widget listTile(){
  return Row(
    children: [
      const Hero(
        tag: 'https://firebasestorage.googleapis.com/v0/b/fir-music-56f40.appspot.com/o/images%2FiPhone%2011%20Pro%20Max%20-%206(1).png?alt=media&token=bfa43f10-50ad-4d65-a0ac-bbcd5e52ddb1',
        child: ClipRRect(
          borderRadius: BorderRadius.only(bottomLeft: Radius
              .circular(10.0), topLeft: Radius.circular(10.0),),
          child: Image(
            image: NetworkImage(
              'https://firebasestorage.googleapis.com/v0/b/fir-music-56f40.appspot.com/o/images%2FiPhone%2011%20Pro%20Max%20-%206(1).png?alt=media&token=bfa43f10-50ad-4d65-a0ac-bbcd5e52ddb1',
            ), height: 150,
            width: 130, fit: BoxFit.fill,
          ),
        ),
      ),
      const SizedBox(
        width: 16,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: 8,
          ),
          Text(
            'Protorix',
            style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: Text(
              'Dui conubia vivamus gravida. Nibh nibh diam auctor turpis semper duis. Justo quam nisi semper convallis varius congue rutrum natoque natoque.',
              maxLines: 2,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ),

          Text(
            'Lets Flutter',
            style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: Colors.blue,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    ],
  );
}


class Animation1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return AnimationLimiter(
      child: ListView.builder(
        padding: EdgeInsets.all(_w / 30),
        physics:
        const BouncingScrollPhysics(parent: const AlwaysScrollableScrollPhysics()),
        itemCount: 20,
        itemBuilder: (BuildContext c, int i) {
          return AnimationConfiguration.staggeredList(
            position: i,
            delay: const Duration(milliseconds: 100),
            child: SlideAnimation(
              duration: const Duration(milliseconds: 2500),
              curve: Curves.fastLinearToSlowEaseIn,
              horizontalOffset: 30,
              verticalOffset: 300.0,
              child: FlipAnimation(
                duration: const Duration(milliseconds: 3000),
                curve: Curves.fastLinearToSlowEaseIn,
                flipAxis: FlipAxis.y,
                child: Container(
                  margin: EdgeInsets.only(bottom: _w / 20),
                  height: _w / 3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 40,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                  child: listTile(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Animation2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return AnimationLimiter(
      child: ListView.builder(
        padding: EdgeInsets.all(_w / 30),
        physics:
        const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 100),
            child: SlideAnimation(
              duration: const Duration(milliseconds: 2500),
              curve: Curves.fastLinearToSlowEaseIn,
              horizontalOffset: -300,
              verticalOffset: -850,
              child: Container(
                margin: EdgeInsets.only(bottom: _w / 20),
                height: _w / 3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(const Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 40,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: listTile(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Animation3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return AnimationLimiter(
      child: ListView.builder(
        padding: EdgeInsets.all(_w / 30),
        physics:
        const BouncingScrollPhysics(parent: const AlwaysScrollableScrollPhysics()),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 100),
            child: SlideAnimation(
              duration: const Duration(milliseconds: 2500),
              curve: Curves.fastLinearToSlowEaseIn,
              verticalOffset: -250,
              child: ScaleAnimation(
                duration: const Duration(milliseconds: 1500),
                curve: Curves.fastLinearToSlowEaseIn,
                child: Container(
                  margin: EdgeInsets.only(bottom: _w / 20),
                  height: _w / 3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(const Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 40,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                  child: listTile(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}