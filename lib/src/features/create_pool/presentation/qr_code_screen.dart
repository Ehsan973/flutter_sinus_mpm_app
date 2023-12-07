import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sinus_mpm_application/src/config/utils/logger.dart';
import 'package:sinus_mpm_application/src/config/utils/messages.dart';
import 'package:sinus_mpm_application/src/features/create_pool/cubit/create_pool_cubit.dart';
import 'package:sinus_mpm_application/src/features/join_pool/cubit/join_cubit.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../config/utils/text_seperator.dart';
import 'create_pool_screen.dart';

@RoutePage()
class QRViewScreen extends StatefulWidget {
  final bool isForJoin;
  final Function(
    Barcode result,
  ) afterCompleteScan;

  const QRViewScreen(
      {Key? key, required this.afterCompleteScan, this.isForJoin = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewScreenState();
}

class _QRViewScreenState extends State<QRViewScreen> {
  QRViewController? controller;
  final PanelController panelController = PanelController();
  bool isSendDuplicatedMsg = false;
  String? scanData;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        onPanelClosed: () {
          // AppMessages.showToast(context, message: 'فرآیند توسط مادرخرج لغو شد');
          // context.popRoute();
        },
        minHeight: 0,
        onPanelOpened: () {
          logInfo(
              '--------------------------  Panel opened----------------------------------------');
        },
        controller: panelController,
        panel: Form(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: !widget.isForJoin
                  ? BlocBuilder<CreatePoolCubit, CreatePoolState>(
                      builder: (context, state) {
                        if (state is CreatePoolLoading) {
                          return const CircularProgressIndicator();
                        } else if (state is CreatePoolInitial) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ListTile(
                                trailing: const Text('نام کاربر'),
                                leading: Text(state.lastCreatedUser != null
                                    ? state.lastCreatedUser!.name
                                    : 'نامشخص'),
                              ),
                              const Spacer(),
                              TextFormField(
                                // key: formKey,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'لطفا مبلغی را وارد کنید';
                                  } else {
                                    return null;
                                  }
                                },
                                controller:
                                    context.read<CreatePoolCubit>().userAmount,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  ThousandsSeparatorInputFormatter()
                                ],
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  suffixText: 'تومان',
                                  hintText: 'این کاربر قراره چقدر پرداخت کنه؟',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Expanded(
                                    child: FilledButton(
                                      onPressed: () {
                                        // if ( formKey.currentState!.validate()) {
                                        //   context
                                        //       .read<CreatePoolCubit>()
                                        //       .addCurrentUser(
                                        //         state.lastCreatedUser!,
                                        //       );
                                        // }

                                        context
                                            .read<CreatePoolCubit>()
                                            .addCurrentUser(
                                                state.lastCreatedUser!,
                                                context);
                                        panelController.hide();
                                        context.popRoute();
                                      },
                                      child: const Text('تایید و اضافه کردن'),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                        onPressed: () {
                                          panelController.close();
                                          context.popRoute();
                                        },
                                        child: const Text('لغو')),
                                  ),
                                ],
                              ),
                            ],
                          );
                        } else {
                          //TODO implement error state for this section. no time .
                          return const SizedBox();
                        }
                      },
                    )
                  : BlocBuilder<JoinCubit, JoinState>(
                      builder: (context, state) {
                      if (state is JoinLoading) {
                        return const CircularProgressIndicator();
                      } else if (state is JoinInitial && state.r != null) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ListTile(
                              trailing: const Text('نام کاربر'),
                              leading: Text(state.r!.name!),
                            ),
                            const Spacer(),
                            Text('مبلغ : ${state.r!.amount}'),
                            const Spacer(),
                            if (state.isUpdated)
                              Column(
                                children: [
                                  const Text(
                                    'از شنا کردن لذت ببرید',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: OutlinedButton(
                                            onPressed: () {
                                              panelController.close();
                                              context.popRoute();
                                            },
                                            child: const Text('تمام')),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            if (!state.isUpdated)
                              Row(
                                children: [
                                  Expanded(
                                    child: FilledButton(
                                      onPressed: () {
                                        // if ( formKey.currentState!.validate()) {
                                        //   context
                                        //       .read<CreatePoolCubit>()
                                        //       .addCurrentUser(
                                        //         state.lastCreatedUser!,
                                        //       );
                                        // }

                                        context
                                            .read<JoinCubit>()
                                            .updateUserPool(
                                                state.r!.id!, 'final');
                                      },
                                      child: const Text('تایید و اضافه کردن'),
                                    ),
                                  ),
                                ],
                              ),
                            if (!state.isUpdated)
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                        onPressed: () {
                                          panelController.close();
                                          context.popRoute();
                                        },
                                        child: const Text('لغو')),
                                  ),
                                ],
                              ),
                          ],
                        );
                      } else {
                        return const SizedBox();
                      }
                    }),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Stack(
              children: [
                _buildQrView(context),
                Positioned(
                    left: 28,
                    top: 28,
                    child: IconButton.filledTonal(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        context.popRoute();
                      },
                    )),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 300.0
        : 500.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return BlocBuilder<CreatePoolCubit, CreatePoolState>(
      builder: (context, state) {
        return QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
              borderColor: Colors.red,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: scanArea),
          onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
        );
      },
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      logSuccess('msg');
      if (this.scanData != scanData.code) {
        logSuccess('========== >>>Show btmsheet <<<< =========');
        !widget.isForJoin
            ? context
                .read<CreatePoolCubit>()
                .getUserInfoByUsername(scanData.code!)
            : context
                .read<JoinCubit>()
                .getCurrentTransactionInformationForJoin(scanData.code!);
        panelController.open();

        setState(() {
          this.scanData = scanData.code;
        });
        // context
        //     .read<CreatePoolCubit>()
        //     .addNewUserToken(scanData.code, 11, context);
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
