import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:strong_pass/presentation/blocs/categories/categories_bloc.dart';
import 'package:strong_pass/presentation/blocs/categories/categories_state.dart';
import 'package:strong_pass/presentation/home/home_controller.dart';
import 'package:strong_pass/shared/utils/get_icon_pass_category.dart';
import 'package:strong_pass/shared/widgets/app_logo.dart';
import 'package:strong_pass/shared/widgets/content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 74,
            title: const AppLogo(),
          ),
          body: Content(
            child: BlocBuilder<CategoriesBloc, CategoriesState>(
              bloc: controller.categoriesBloc,
              builder: (context, state) {
                final list = state.passCategories;

                if (state is CategoriesInitialState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is CategoriesSuccessState) {
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final passCategory = list[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: InkWell(
                          onTap: () => controller.navigateToPass(passCategory),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: colorScheme.surfaceVariant,
                              ),
                            ),
                            child: ListTile(
                              leading: Icon(
                                getIconPassCategory(passCategory.type!),
                              ),
                              title: Text(passCategory.name!),
                              trailing: passCategory.totalPasswords != null && passCategory.totalPasswords! > 0
                                  ? Text(
                                      passCategory.totalPasswords.toString(),
                                      style: textTheme.titleMedium,
                                    )
                                  : const Icon(Icons.add),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }

                return Center(
                  child: Text(state.error!),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
