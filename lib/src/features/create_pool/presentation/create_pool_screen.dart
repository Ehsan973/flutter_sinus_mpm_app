import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sinus_mpm_application/src/config/routes/routes.dart';
import 'package:sinus_mpm_application/src/config/utils/logger.dart';
import 'package:sinus_mpm_application/src/config/utils/messages.dart';
import 'package:sinus_mpm_application/src/config/utils/text_seperator.dart';

import '../cubit/create_pool_cubit.dart';

@RoutePage()
class CreatePoolScreen extends StatelessWidget {
  const CreatePoolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: BlocBuilder<CreatePoolCubit, CreatePoolState>(
          builder: (context, state) {
            if (state is CreatePoolInitial && state.lastCreatedUser != null) {
              return FloatingActionButton.extended(
                  label: const Text('ایجاد استخر'),
                  onPressed: () async {
                    logInfo('Last created user is not null ');
                    context.read<CreatePoolCubit>().createNewPool();
                  });
            } else {
              return const SizedBox();
            }
          },
        ),
        appBar: AppBar(
          title: const Text(
            'ایجاد استخر جدید',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
          actions: [],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('عنوان استخر'),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            hintText: 'عنوانی وارد کنید'),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text('توضیحاتی اگر دارید بنویسید'),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: 'توضیحات (اختیاری)',
                          border: OutlineInputBorder(),
                          filled: true,
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text('شناگران'),
                      SizedBox(
                        height: 14,
                      ),
                      AddedUsersList(),
                    ],
                  ),
                ),
                BlocBuilder<CreatePoolCubit, CreatePoolState>(
                  builder: (context, state) {
                    if (state is CreatePoolInitial && state.poolModel != null) {
                      return QrImageView(
                        data: state.poolModel!.id!,
                        version: QrVersions.auto,
                        size: 200.0,
                      );
                    } else {
                      return const Text(
                          'بعد از اتمام اسکن نفرات، روی دکمه ایجاد استخر کلیک کنید');
                    }
                  },
                ),
              ],
            ),
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
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (bloc.addedUsersList.isEmpty)
                const Text('هیچ شناگری تو این اطراف نیست ! '),
              ...List.generate(bloc.addedUsersList.length, (index) {
                final item = bloc.addedUsersList[index];
                return Container(
                  height: 71,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        const CircleAvatar(),
                        Text(item.name),
                        Text(
                          item.amount!.formatNumberWithComma(),
                        ),
                        IconButton(
                          onPressed: () {
                            AppMessages.showAlertDialog(
                              context,
                              title: 'آیا می خواهید این کاربر را حذف کنید ؟ ',
                              dialogText:
                                  'با انتخاب بله ، ${item.name}از لیست برداشته می شود. البته می توانید دوباره اضافه کنید.',
                              onTapYes: () async {
                                context
                                    .read<CreatePoolCubit>()
                                    .removeCurrentUser(item);
                                context.popRoute();
                              },
                            );
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ]),
                );
              }),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: BlocBuilder<CreatePoolCubit, CreatePoolState>(
                      builder: (context, state) {
                        return OutlinedButton.icon(
                          style: ButtonStyle(
                            fixedSize: const MaterialStatePropertyAll(
                              Size.fromHeight(46),
                            ),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            context.router.push(
                              QRViewRoute(
                                afterCompleteScan: (p0) {
                                  logSuccess('Scan Completed ');
                                },
                              ),
                            );
                          },
                          icon: state is CreatePoolLoading
                              ? const CircularProgressIndicator()
                              : const Icon(Icons.qr_code_scanner_rounded),
                          label: state is CreatePoolLoading
                              ? const LinearProgressIndicator()
                              : const Text('اضافه کردن مشارکت کننده'),
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
