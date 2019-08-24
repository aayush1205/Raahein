import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'data.dart';
import 'navi.dart';
import 'package:raahein_final/payment/main.dart';
import 'package:raahein_final/combo/lib/main.dart';
import 'package:raahein_final/history/home_page.dart';


class ZoomScaffold extends StatefulWidget {
  final Widget menuScreen;
  final Layout contentScreen;

  ZoomScaffold({
    this.menuScreen,
    this.contentScreen,
  });

  @override
  _ZoomScaffoldState createState() => new _ZoomScaffoldState();
}

var cardAspectRatio = 14.0 / 20.0;
var widgetAspectRatio = cardAspectRatio * 1.2;
var verticalInset=20.0;

class _ZoomScaffoldState extends State<ZoomScaffold>
    with TickerProviderStateMixin {
      
      int _page = 0;
      var currentPage = images.length - 1.0;
      int count = 0;
      

  GlobalKey _bottomNavigationKey =  GlobalKey();
  Curve scaleDownCurve = new Interval(0.0, 0.3, curve: Curves.easeOut);
  Curve scaleUpCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideOutCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideInCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);

  

  createContentDisplay() {
  
    
    return zoomAndSlideContent(new Container(

  
      child: new Scaffold(
        backgroundColor: Colors.black,
        appBar: new AppBar(
            title: Text("Hi Ayushi!", style: TextStyle(fontFamily: "Nunito", color: Colors.amber)),
            backgroundColor: Colors.black,
            elevation: 0.0,
            leading: new IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.amber,
                ),
                onPressed: () {
                  Provider.of<MenuController>(context, listen: true).toggle();
                }),
            ),
            bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 2,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.payment, size: 30, color: Colors.blue),
            Icon(Icons.directions_bus, size: 30, color: Colors.blue),
            Icon(Icons.home, size: 30, color: Colors.blue),
            Icon(Icons.location_searching, size: 30, color: Colors.blue),
            Icon(Icons.history, size: 30, color: Colors.blue),
          ],
          color: Colors.black,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.black,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            /*if (index==2) {
              Navigator.push(context, MaterialPageRoute(
                    builder: (context) => NaviPage()
                    ),
                    );
            }*/
          if (index==0){
            Navigator.push(context, MaterialPageRoute(
                    builder: (context) => MyApp()
                    ),
                    );
          }
          else if(index==1){
            Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ComboApp()
                    ),
                    );

          }
          else if(index==4){
            Navigator.push(context, MaterialPageRoute(
                    builder: (context) => History()
                    ),
                    );

          }

          },
        ),
        
        body: buildBody(context),
      ),
    ));
  }

  zoomAndSlideContent(Widget content) {
    var slidePercent, scalePercent;

    switch (Provider.of<MenuController>(context, listen: true).state) {
      case MenuState.closed:
        slidePercent = 0.0;
        scalePercent = 0.0;
        break;
      case MenuState.open:
        slidePercent = 1.0;
        scalePercent = 1.0;
        break;
      case MenuState.opening:
        slidePercent = slideOutCurve.transform(
            Provider.of<MenuController>(context, listen: true).percentOpen);
        scalePercent = scaleDownCurve.transform(
            Provider.of<MenuController>(context, listen: true).percentOpen);
        break;
      case MenuState.closing:
        slidePercent = slideInCurve.transform(
            Provider.of<MenuController>(context, listen: true).percentOpen);
        scalePercent = scaleUpCurve.transform(
            Provider.of<MenuController>(context, listen: true).percentOpen);
        break;
    }

    final slideAmount = 275.0 * slidePercent;
    final contentScale = 1.0 - (0.2 * scalePercent);
    final cornerRadius =
        16.0 * Provider.of<MenuController>(context, listen: true).percentOpen;

    return new Transform(
      transform: new Matrix4.translationValues(slideAmount, 0.0, 0.0)
        ..scale(contentScale, contentScale),
      alignment: Alignment.centerLeft,
      child: new Container(
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.black12,
              offset: const Offset(0.0, 5.0),
              blurRadius: 15.0,
              spreadRadius: 10.0,
            ),
          ],
        ),
        child: new ClipRRect(
            borderRadius: new BorderRadius.circular(cornerRadius),
            child: content),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Scaffold(
            body: widget.menuScreen,
          ),
        ),
        createContentDisplay()
      ],
    );
  }

  Widget buildBody(context){
   if (count == 0)
   {
     return NaviPage();
   }
   if (count == 1)
   {
     return NaviPage();
   }
   if (count == 2)
   {
     return NaviPage();
   }
   if (count == 3)
   {
     return NaviPage();
   }
   if (count == 4)
   {
     return NaviPage();
   }
   else 
   {
     return NaviPage();
   }
  }

}

class ZoomScaffoldMenuController extends StatefulWidget {
  final ZoomScaffoldBuilder builder;

  ZoomScaffoldMenuController({
    this.builder,
  });

  @override
  ZoomScaffoldMenuControllerState createState() {
    return new ZoomScaffoldMenuControllerState();
  }
}

class ZoomScaffoldMenuControllerState
    extends State<ZoomScaffoldMenuController> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(
        context, Provider.of<MenuController>(context, listen: true));
  }
}

typedef Widget ZoomScaffoldBuilder(
    BuildContext context, MenuController menuController);

class Layout {
  final WidgetBuilder contentBuilder;

  Layout({
    this.contentBuilder,
  });
}

class MenuController extends ChangeNotifier {
  final TickerProvider vsync;
  final AnimationController _animationController;
  MenuState state = MenuState.closed;

  MenuController({
    this.vsync,
  }) : _animationController = new AnimationController(vsync: vsync) {
    _animationController
      ..duration = const Duration(milliseconds: 250)
      ..addListener(() {
        notifyListeners();
      })
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            state = MenuState.opening;
            break;
          case AnimationStatus.reverse:
            state = MenuState.closing;
            break;
          case AnimationStatus.completed:
            state = MenuState.open;
            break;
          case AnimationStatus.dismissed:
            state = MenuState.closed;
            break;
        }
        notifyListeners();
      });
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  get percentOpen {
    return _animationController.value;
  }

  open() {
    _animationController.forward();
  }

  close() {
    _animationController.reverse();
  }

  toggle() {
    if (state == MenuState.open) {
      close();
    } else if (state == MenuState.closed) {
      open();
    }
  }
}

enum MenuState {
  closed,
  opening,
  open,
  closing,
}
