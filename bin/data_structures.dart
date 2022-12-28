/*
Created by Axmadjon Isaqov on 21:41:30 26.12.2022
© 2022 @axi_dev 
*/
/*
Theme:::Linked List
*/
import 'linked_list/linked_list.dart';
import 'stack/stack.dart';

void main(List<String> arguments) {
  // print(balanced('h((e))llo(world)()'));
  // print(balanced('(hello world'));
  // print(balanced('()[]{}'));
  // print(balanced('(hello world)'));

  // var head = Node<int>(value: 4);
  // var middle = Node<int>(value: 7);
  // var end = Node<int>(value: 9);
  // head.next = middle;
  // middle.next = end;
  // end.next = null;
  // print(head.toString());

  final linked = LinkedList<int>();

  linked.push(4);
  linked.push(7);
  linked.push(9);
  print(linked);
}

//? Challange 2

bool? balanced(String s) {
  final opened = Stack<String>.of(['[', '{', '(']);
  final closed = Stack<String>.of([']', '}', ')']);
  final checked = Stack<String>();
  for (var element in s.split('')) {
    if (opened.contains(element)) {
      checked.push(element);
    } else if (closed.contains(element)) {
      if (checked.isEmpty) {
        return false;
      } else {
        checked.pop();
      }
    }
  }
  return checked.isEmpty;
}
