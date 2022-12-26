abstract class StackBase<E> {
  E pop();
  void push(E element);
  E get peek;
  bool get isEmpty;
  bool get isNotEmpty;
  bool contains(E element);
}

class Stack<E> extends StackBase<E> {
  final List<E> _storage;

  Stack() : _storage = <E>[];
  Stack.of(Iterable<E> iterable) : _storage = List<E>.of(iterable);

  @override
  void push(E element) => _storage.add(element);

  @override
  E pop() => _storage.removeLast();

  @override
  String toString() {
    return '''-----Top-----\n
    ${_storage.reversed.join('\n')}
    ----------\n
    ''';
  }

  @override
  bool get isEmpty => _storage.isEmpty;

  @override
  bool get isNotEmpty => _storage.isNotEmpty;

  @override
  E get peek => _storage.last;

  @override
  bool contains(E element) {
    return _storage.contains(element);
  }
}
