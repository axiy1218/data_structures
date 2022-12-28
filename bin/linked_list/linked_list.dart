import '../node/node.dart';

abstract class LinkedListBase<E> {
  LinkedListBase({this.head, this.tail});
  Node<E>? head;
  Node<E>? tail;

  bool get isEmpty;
  void push(E element);
  void append(E element);
  void insertAfter(E element, [int start = 0]);
}

class LinkedList<E> extends LinkedListBase<E> {
  @override
  bool get isEmpty => head == null;

  @override
  String toString() {
    if (head == null) return 'Empty List';
    return head.toString();
  }

  @override
  void append(E element) {}

  @override
  void insertAfter(E element, [int start = 0]) {
    // TODO: implement insertAfter
  }

  @override
  void push(E element) {
    head = Node<E>(value: element, next: head);
    tail ??= head;
  }
}
