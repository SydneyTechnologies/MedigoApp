import 'package:flutter/material.dart';
import 'package:medigo_app/components/customWidgets.dart';
import 'package:medigo_app/services/LayoutManagerProvider.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey _childKey = GlobalKey();

    double childHeight = 0;

    // WidgetsBinding.instance.addPostFrameCallback(
    //   (timeStamp) {
    //     RenderBox? renderBox =
    //         _childKey.currentContext?.findRenderObject() as RenderBox?;
    //     if (renderBox != null) {
    //       childHeight = renderBox.size.height;
    //       print("Child widget height: $childHeight");
    //     }
    //   },
    // );

    return Consumer<LayoutManagerProvider>(builder: (context, value, child) {
      // value.storeChildHeight(_childKey, "PageTabs");
      return PageLayout(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RepaintBoundary(
              key: _childKey,
              child: Center(
                child: PageTabs(),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  ((value.widgetHeights["CustomNavbar"])!.toInt() +
                      childHeight +
                      104 +
                      50),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsetsDirectional.only(bottom: 10.0),
                    child: const DrugTile(),
                  );
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
