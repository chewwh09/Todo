import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageBlock extends StatelessWidget {
  final String blockName;
  final Color blockColor;
  final Icon iconDisplay;
  final String routingLocation;
  final String urlLocation;

  HomePageBlock(
      {@required this.blockName,
      @required this.blockColor,
      @required this.iconDisplay,
      this.routingLocation,
      this.urlLocation});

  _launchURL() async {
    final url = urlLocation;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GestureDetector(
            child: GridTile(
              header: Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  blockName,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 40),
                color: blockColor,
                child: FittedBox(fit: BoxFit.contain, child: iconDisplay),
              ),
            ),
            onTap: () {
              if (routingLocation != null) {
                Navigator.of(context).pushNamed(routingLocation);
              } else if (urlLocation != null) {
                _launchURL();
              }
            },
          )),
    );
  }
}

// Container(
//                 decoration: BoxDecoration(
//                     image: const DecorationImage(
//                         image: AssetImage(
//                             'assets/images/HomePageBlockPicture.jpg'),
//                         fit: BoxFit.fill)),
//                 padding: EdgeInsets.only(top: 60),
//                 // color: blockColor,
//                 child: FittedBox(fit: BoxFit.contain, child: iconDisplay),
//               ),
