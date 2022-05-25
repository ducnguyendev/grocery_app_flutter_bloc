import 'package:flutter/material.dart';

import '../../../domain/model/product.dart';
import '../../../../utils/constants.dart';
import '../details/details_screen.dart';
import 'components/cart_details_view.dart';
import 'components/cart_short_view.dart';
import 'components/header.dart';
import 'components/product_card.dart';
import 'home_controller.dart';

// Today i will show you how to implement the animation
// So starting project comes with the UI
// Run the app

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  late AnimationController _animationController;
  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.7) {
      // controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 12) {
      // controller.changeHomeState(HomeState.normal);
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: const Color(0xFFEAEAEA),
          child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, _) {
                return LayoutBuilder(
                  builder: (context, BoxConstraints constraints) {
                    return Stack(
                      children: [
                        AnimatedPositioned(
                          duration: panelTransition,
                          // top: controller.homeState == HomeState.normal
                          //     ? headerHeight
                          //     : -(constraints.maxHeight -
                          //         cartBarHeight * 2 -
                          //         headerHeight),
                          left: 0,
                          right: 0,
                          height: constraints.maxHeight -
                              headerHeight -
                              cartBarHeight,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft:
                                    Radius.circular(defaultPadding * 1.5),
                                bottomRight:
                                    Radius.circular(defaultPadding * 1.5),
                              ),
                            ),
                            child: GridView.builder(
                              itemCount: demoProducts.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.75,
                                mainAxisSpacing: defaultPadding,
                                crossAxisSpacing: defaultPadding,
                              ),
                              itemBuilder: (context, index) => ProductCard(
                                product: demoProducts[index],
                                press: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 500),
                                      reverseTransitionDuration:
                                          const Duration(milliseconds: 500),
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          FadeTransition(
                                        opacity: animation,
                                        child: DetailsScreen(
                                          product: demoProducts[index],
                                          onProductAdd: () {
                                            // controller.addProductToCart(
                                            //     demoProducts[index]);
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        // Card Panel
                        AnimatedPositioned(
                          duration: panelTransition,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          // height: controller.homeState == HomeState.normal
                          //     ? cartBarHeight
                          //     : (constraints.maxHeight - cartBarHeight),
                          height: cartBarHeight,
                          child: GestureDetector(
                            onVerticalDragUpdate: _onVerticalGesture,
                            child: Container(
                              padding: const EdgeInsets.all(defaultPadding),
                              color: const Color(0xFFEAEAEA),
                              alignment: Alignment.topLeft,
                              child: const AnimatedSwitcher(
                                duration: panelTransition,
                                // child: controller.homeState == HomeState.normal
                                //     ? CardShortView(controller: controller)
                                //     : CartDetailsView(controller: controller),
                              ),
                            ),
                          ),
                        ),
                        // Header
                        const AnimatedPositioned(
                          duration: panelTransition,
                          // top: controller.homeState == HomeState.normal
                          //     ? 0
                          //     : -headerHeight,
                          top: 0,
                          right: 0,
                          left: 0,
                          height: headerHeight,
                          child: HomeHeader(),
                        ),
                      ],
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}
