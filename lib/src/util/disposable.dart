abstract class Disposable {
  void dispose();

  static Disposable create(void Function() dispose) {
    return _AnonymousDisposable(action: dispose);
  }
}

class _AnonymousDisposable implements Disposable {
  final void Function() _action;

  _AnonymousDisposable({
    required void Function() action,
  }) : _action = action;

  @override
  void dispose() {
    _action();
  }
}
