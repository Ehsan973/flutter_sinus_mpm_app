import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinus_mpm_application/src/app.dart';
import 'package:sinus_mpm_application/src/config/routes/routes.dart';
import 'package:sinus_mpm_application/src/config/utils/logger.dart';
import 'package:sinus_mpm_application/src/config/utils/messages.dart';
import 'package:sinus_mpm_application/src/features/create_pool/presentation/qr_code_screen.dart';

import '../cubit/create_pool_cubit.dart';

@RoutePage()
class CreatePoolScreen extends StatelessWidget {
  const CreatePoolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('افزودن افراد '),
        actions: [
          BlocBuilder<CreatePoolCubit, CreatePoolState>(
            builder: (context, state) {
              return ElevatedButton.icon(
                onPressed: () {
                  context.router.push(QRViewRoute(
                    afterCompleteScan: (p0) {
                      logSuccess('Scan Completed ');
                    },
                  ));
                },
                icon: state is CreatePoolLoading
                    ? const CircularProgressIndicator()
                    : const Icon(Icons.scanner),
                label: state is CreatePoolLoading
                    ? const Text('لطفا صبر کنید')
                    : const Text('ایجاد پرداخت جدید'),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('لیست افراد اضافه شده و اسکن شده '),
              const AddedUsersList(),
            ],
          ),
        ),
      ),
    );
  }
}

class AddedUsersList extends StatelessWidget {
  const AddedUsersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePoolCubit, CreatePoolState>(
      builder: (context, state) {
        final bloc = context.read<CreatePoolCubit>();
        return Column(
          children: [
            ...List.generate(bloc.addedUsersList.length, (index) {
              final item = bloc.addedUsersList[index];
              return ListTile(
                title: Text(item.name),
                leading: Text(
                  item.amount.toString(),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () {
                    AppMessages.showAlertDialog(
                      context,
                      title: 'آیا می خواهید این کاربر را حذف کنید ؟ ',
                      dialogText:
                          'با انتخاب بله ، ${item.name}از لیست برداشته می شود. البته می توانید دوباره اضافه کنید.',
                      onTapYes: () async {
                        context.read<CreatePoolCubit>().removeCurrentUser(item);
                    context.popRoute();

                      },
                    );
                  },
                ),
              );
            })
          ],
        );
      },
    );
  }
}
