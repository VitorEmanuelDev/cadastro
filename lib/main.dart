import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cadastro/screens/Dashboard.dart';

import 'components/Theme.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(BancoDigio());
    },
    blocObserver: LogBloc(),
  );
}

class LogBloc extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('${bloc.runtimeType} > $change');
    super.onChange(bloc, change);
  }
}

class BancoDigio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: digioBankTheme,
      home: DashboardContainer(),
      // home: TransactionAuthDialog(),
    );
  }
}
