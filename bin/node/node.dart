class Node<E> {
  E value;
  Node<E>? next;
  Node({this.next, required this.value});
  @override
  String toString() {
    if (next == null) '$value';
    return '$value -> ${next.toString()}';
  }
}
