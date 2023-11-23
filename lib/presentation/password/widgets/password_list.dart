import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:strong_pass/core/data/models/password.dart';
import 'package:strong_pass/shared/controllers/clipboard_controller.dart';
import 'package:strong_pass/shared/cubits/visibility_password.dart';

class PasswordList extends StatelessWidget {
  final List<Password> passes;
  final void Function(Password password) onTapEdit;
  final void Function(String id) onTapDelete;

  const PasswordList({
    super.key,
    required this.passes,
    required this.onTapEdit,
    required this.onTapDelete,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    Widget titleDetail(String title) {
      return Text(
        title,
        style: textTheme.bodySmall?.copyWith(
          color: colorScheme.secondary,
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 88),
      itemCount: passes.length,
      itemBuilder: (context, index) {
        final password = passes[index];
        final firstLetter = password.name![0].toUpperCase();

        return Column(
          children: [
            ListTile(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: colorScheme.background,
                  showDragHandle: true,
                  enableDrag: true,
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      width: double.infinity,
                      height: 320,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: CircleAvatar(
                                    backgroundColor: colorScheme.surfaceVariant,
                                    child: Text(
                                      firstLetter,
                                      style: textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                titleDetail('Nome'),
                                Text(
                                  password.name!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                titleDetail('Id do usuário'),
                                Text(
                                  password.userId!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                titleDetail('Senha'),
                                BlocBuilder<VisibilityPasswordCubit, bool>(
                                  builder: (ctx, visible) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        GetBuilder<ClipBoardController>(
                                          init: ClipBoardController(),
                                          builder: (clipBoardController) {
                                            return IconButton(
                                              onPressed: () => clipBoardController.copy(
                                                password.password!,
                                              ),
                                              icon: Icon(clipBoardController.icon),
                                            );
                                          },
                                        ),
                                        Flexible(
                                          child: Text(
                                            visible ? password.password! : '********',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        // const SizedBox(width: 8),
                                        IconButton(
                                          onPressed: () => ctx.read<VisibilityPasswordCubit>().toggle(),
                                          icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () => onTapEdit(password),
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () => onTapDelete(password.id!),
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 12,
              leading: CircleAvatar(
                backgroundColor: colorScheme.surfaceVariant,
                child: Text(
                  firstLetter,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(password.name!),
              subtitle: Text(password.userId!),
              trailing: const Icon(Icons.expand_more),
            ),
            Visibility(
              visible: index != passes.length - 1,
              child: const Padding(
                padding: EdgeInsets.only(left: 40 + 12),
                child: Divider(
                  height: 0,
                  thickness: 0.6,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
