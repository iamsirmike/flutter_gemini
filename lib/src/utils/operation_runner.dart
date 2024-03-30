// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:map_chat/src/utils/base_provider.dart';
import 'package:map_chat/src/widgets/alert/alert_dialog.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

typedef Operation<T> = Future<T> Function();

abstract class OperationRunnerState<T extends StatefulWidget> extends State<T> {
  @protected
  // ignore: avoid_shadowing_type_parameters
  Future<T?> runOperation<T>(
    Operation operation, {
    BuildContext? contextE,
    bool showLoader = true,
  }) async {
    contextE ??= context;

    try {
      Provider.of<BaseProvider>(context, listen: false)
          .setState(ViewState.Busy);

      final result = await operation();

      Provider.of<BaseProvider>(context, listen: false)
          .setState(ViewState.Idle);

      return result as T;
    } on AuthException catch (e) {
      Provider.of<BaseProvider>(context, listen: false)
          .setState(ViewState.Idle);

      showAlertDialog(context, 'Registration \nFailed',
          subtext: e.message,
          imagePath: 'assets/images/fail.png', onPressed: () {
        Navigator.pop(context);
      });
    } catch (e) {
      Provider.of<BaseProvider>(context, listen: false)
          .setState(ViewState.Idle);

      showAlertDialog(context, 'An error occured',
          imagePath: 'assets/images/fail.png', onPressed: () {
        Navigator.pop(context);
      });
    }

    return null;
  }
}
