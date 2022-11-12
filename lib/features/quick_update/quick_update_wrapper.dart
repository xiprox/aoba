import 'package:aoba/features/quick_update/quick_update_sheet.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'quick_update_vm.dart';

class QuickUpdateWrapper extends StatelessWidget {
  const QuickUpdateWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      create: (_) => QuickUpdateViewModel(),
      child: const QuickUpdateSheet(),
    );
  }
}
