import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/config/routes/routes.dart';
import 'package:restaurant_app/features/cart/domain/entities/section.dart';
import 'package:restaurant_app/features/cart/presentation/providers/cart_providers.dart';
import 'package:restaurant_app/features/cart/presentation/providers/categories_providers.dart';
import 'package:restaurant_app/features/cart/presentation/providers/products_providers.dart';
import 'package:restaurant_app/features/cart/presentation/providers/sections_providers.dart';
import 'package:restaurant_app/features/cart/presentation/widgets/grid_products.dart';
import 'package:restaurant_app/features/cart/presentation/widgets/product_list.dart';
import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:restaurant_app/features/orders/presentation/providers/orders_provider.dart';
import 'package:restaurant_app/features/shared/widgets/custom_text_form_field.dart';
import 'package:badges/badges.dart' as badges;

class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sectionsState = ref.watch(sectionsProvider);
    final categoriesState = ref.watch(categoriesProvider);
    final productsState = ref.watch(productsByNameProvider);
    final filterProducts = ref.watch(productNameProvider);
    final orderDetails = ref.watch(orderDetailsProvider);
    final activeOrder = ref.watch(activeOrderProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Menu'),
          actions: [
            badges.Badge(
              badgeContent: Text(orderDetails.length.toString()),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  if (activeOrder != null) {
                    ref.read(activeOrderProvider.notifier).clearActiveOrder();
                    context.pop();
                  } else {
                    context.push(Routes.cart);
                  }
                },
              ),
            ),
          ],
        ),
        body: sectionsState.when(
          error: (error, stackTrace) => MenuScreenError(
            error: error,
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          data: (data) => SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CustomTextFormField(
                  label: 'Search',
                  hint: filterProducts,
                  onChanged: (p0) => ref
                      .read(productNameProvider.notifier)
                      .changeProductName(p0),

                  // onChanged: (value) {
                  //   ref
                  //       .read(activeSectionProvider.notifier)
                  //       .searchSections(value);
                  // },
                ),
                const SizedBox(height: 16),
                filterProducts.isNotEmpty
                    ? Column(
                        children: [
                          Text('Search results for: $filterProducts '),
                          ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                GridProducts(products: productsState)
                              ]),
                        ],
                      )
                    : Column(
                        children: [
                          // Expanded(child: Center(child: Text('lajkfd'),))
                          SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: AllMenu(sections: data))
                        ],
                      )
                // : Column(
                //     children: [
                //       ListView(
                //           shrinkWrap: true,
                //           physics: NeverScrollableScrollPhysics(),
                //           children: [AllMenu(sections: data)]),
                //     ],
                // ),
                // AllMenu(sections: data,),
              ],
            ),
          ),
        ));
  }
}

class AllMenu extends ConsumerWidget {
  final List<Section> sections;
  const AllMenu({
    super.key,
    required this.sections,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DynamicTabBarWidget(
      isScrollable: true,
      showBackIcon: false,
      showNextIcon: false,
      onTabControllerUpdated: (p0) {
        // ref.read(activeSectionProvider.notifier).setActiveSection(sections[p0.index]);
      },
      onTabChanged: (p0) {
        if (p0 != null) {
          ref
              .read(activeSectionProvider.notifier)
              .setActiveSection(sections[p0]);
        }
      },
      dynamicTabs: <TabData>[
        for (var section in sections)
          if (section.isActive)
            TabData(
              index: section.order,
              title: Tab(
                child: Text(section.name),
              ),
              content: const ProductList(),

              // content: Text(section.name),
            ),
      ],
    );
  }
}

class MenuScreenError extends ConsumerWidget {
  final Object error;
  const MenuScreenError({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Error: $error'),
          ElevatedButton(
            onPressed: () {
              ref.refresh(sectionsProvider);
            },
            child: const Text('Try again'),
          ),
        ],
      ),
    );
  }
}
