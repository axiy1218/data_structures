import '../node/node.dart';

class _LinkedListIterator<E> implements Iterator<E> {
  _LinkedListIterator(LinkedList<E> list) : _list = list;
  final LinkedList<E> _list;
  Node<E>? _currentNode;
  bool _firstPass = true;
  @override
  E get current => _currentNode!.value;

  @override
  bool moveNext() {
    if (_list.isEmpty) return false;
    if (_firstPass) {
      _currentNode = _list.head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode!.next;
    }
    return _currentNode != null;
  }
}

abstract class LinkedListBase<E> extends Iterable<E> {
  LinkedListBase({this.head, this.tail});
  Node<E>? head;
  Node<E>? tail;

  @override
  bool get isEmpty;
  void push(E element);
  void append(E element);
  Node<E> nodeAt(int index);
  E? pop();
  E? removeAfter(Node<E> node);
  E? removeLast();
  Node<E> insertAfter(Node<E>? node, E value);
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
  void append(E element) {
    if (isEmpty) {
      push(element);
      return;
    }
    tail!.next = Node<E>(
      value: element,
    );
    tail = tail!.next!;
  }

  @override
  void push(E element) {
    head = Node<E>(value: element, next: head);
    tail ??= head;
  }

  @override
  Node<E> insertAfter(Node<E>? node, E value) {
    if (node == tail) {
      append(value);
      return tail!;
    }
    node!.next = Node<E>(value: value, next: node.next);
    return node.next!;
  }

  @override
  Node<E> nodeAt(int index) {
    var currentNode = head;
    var currentIndex = 0;
    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex++;
    }
    return currentNode!;
  }

  @override
  E? pop() {
    final value = head?.value;
    head = head?.next;
    if (isEmpty) tail = null;
    return value;
  }

  @override
  E? removeLast() {
    if (head!.next == null) return pop();
    var current = head;
    while (current!.next != tail) {
      current = current.next;
    }
    final value = tail!.value;
    tail = current;
    tail!.next = null;
    return value;
  }

  @override
  E? removeAfter(Node<E> node) {
    final value = node.next!.value;
    if (node.next == tail) tail = node;
    node.next = node.next!.next;
    return value;
  }

  @override
  Iterator<E> get iterator => _LinkedListIterator(this);
}
