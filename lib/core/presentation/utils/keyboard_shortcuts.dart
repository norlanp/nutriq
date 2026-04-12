import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutriq/core/utils/navigation_options.dart';

class KeyboardShortcuts extends StatelessWidget {
  final Widget child;

  const KeyboardShortcuts({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyN):
            const NewEntryIntent(),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyS):
            const SaveIntent(),
        LogicalKeySet(LogicalKeyboardKey.escape): const BackIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          NewEntryIntent: _NewEntryAction(context),
          SaveIntent: _SaveAction(),
          BackIntent: _BackAction(context),
        },
        child: child,
      ),
    );
  }
}

class NewEntryIntent extends Intent {
  const NewEntryIntent();
}

class SaveIntent extends Intent {
  const SaveIntent();
}

class BackIntent extends Intent {
  const BackIntent();
}

class _NewEntryAction extends Action<NewEntryIntent> {
  final BuildContext context;

  _NewEntryAction(this.context);

  @override
  Object? invoke(NewEntryIntent intent) {
    Navigator.of(context).pushNamed(NavigationOptions.addMealRoute);
    return null;
  }
}

class _SaveAction extends Action<SaveIntent> {
  @override
  Object? invoke(SaveIntent intent) => null;
}

class _BackAction extends Action<BackIntent> {
  final BuildContext context;

  _BackAction(this.context);

  @override
  Object? invoke(BackIntent intent) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    return null;
  }
}
