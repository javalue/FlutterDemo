import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          new FavIcon(),
          new Text('41')
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.red, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(Colors.amberAccent, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Layout Test"),
        ),
        body: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/sky.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Icon(icon, color: color),
        new Container(
          margin: const EdgeInsets.only(top: 8),
          child: new Text(
            label,
            style: new TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class FavIcon extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FavIconState();
  }
}

class FavIconState extends State<FavIcon> {
  var fav = 0;

  void _fav() {
    setState(() {});
    if (fav == 0) {
      fav = 1;
    } else {
      fav = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new IconButton(
      icon: new Icon(fav == 0 ? Icons.star_border : Icons.star),
      color: fav == 0 ? null : Colors.red[500],
      onPressed: () {
        setState(() {
          _fav();
        });
      },
    );
  }
}
