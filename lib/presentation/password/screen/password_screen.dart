import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:strong_pass/presentation/blocs/password/password_bloc.dart';
import 'package:strong_pass/presentation/blocs/password/password_state.dart';
import 'package:strong_pass/presentation/password/screen/password_controller.dart';
import 'package:strong_pass/presentation/password/widgets/password_list.dart';
import 'package:strong_pass/shared/widgets/content.dart';
import 'package:strong_pass/shared/widgets/empty_state.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PasswordController>(
      init: PasswordController(),
      builder: (controller) {
        return BlocBuilder<PasswordBloc, PasswordState>(
          bloc: controller.passwordBloc,
          builder: (context, state) {
            final passwords = state.passwords;

            return Scaffold(
              appBar: AppBar(
                title: Text(controller.passCategory.name!),
              ),
              body: Content(
                child: Builder(builder: (context) {
                  if (state is PasswordInitialState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is PasswordSuccessState) {
                    if (passwords.isEmpty) {
                      return const EmptyState(
                        message: "Nenhuma entrada encontrada",
                      );
                    }

                    return PasswordList(
                      onTapEdit: controller.editPassword,
                      onTapDelete: controller.deletePassword,
                      passes: passwords,
                    );
                  }

                  return Center(
                    child: Text(state.error!),
                  );
                }),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: controller.navigateToPassCreate,
                child: const Icon(Icons.add),
              ),
            );
          },
        );
      },
    );
  }
}
