//import 'package:raahein_final/circular_image.dart';
import 'menu_page.dart';
import 'package:flutter/material.dart';
import 'zoom_scaffold.dart';
import 'package:provider/provider.dart';
import 'data1.dart';




class Raahein extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<Raahein> with TickerProviderStateMixin {
  MenuController menuController;
  var currentPage = images.length - 1.0;

  @override
  void initState() {
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener((){
      setState(() {
        currentPage=controller.page;
    });
  });
    return ChangeNotifierProvider(
      builder: (context) => menuController,
      child: ZoomScaffold(
        menuScreen: MenuScreen(),
        contentScreen: Layout(
            contentBuilder: (cc) => Container(
                  color: Colors.grey[200],
                  child: Container(
                    color: Colors.grey[200],
                  ),
                )),
      ),
    );
  }
}
