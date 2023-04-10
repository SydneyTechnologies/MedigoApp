import 'package:flutter/material.dart';
import 'package:medigo_app/components/customWidgets.dart';
import 'package:medigo_app/constants.dart';
import 'package:medigo_app/services/LayoutManagerProvider.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LayoutManagerProvider>(
      builder: (context, value, child) => WillPopScope(
        onWillPop: () async {
          Navigator.pushNamed(context, "/home");
          value.switchMenu(menuState.home, 200);
          return true;
        },
        child: PageLayout(
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: PageTabs(),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          padding:
                              const EdgeInsetsDirectional.only(bottom: 10.0),
                          child: const DrugTile(),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
