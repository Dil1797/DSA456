                                        Lab 4
                       ===================
PART A: Implementation of a Singly Linked List in Python
A singly linked list is a dynamic data structure that consists of nodes, where each node contains two parts:
i.	Data – Stores the actual value.
ii.	Next pointer – Stores the reference to the next node in the list.
Unlike arrays, linked lists are not stored in contiguous memory locations. Instead, each node is connected to the next using a pointer.
Implementation of a Singly Linked List
We need to implement two classes:
i.	Node class – Represents a single node in the list.
ii.	SinglyLinkedList class – Manages the linked list and supports various operations.
Implementation:
1.	class Node:
    def __init__(self, data): 
         """Initializes a Node with data and sets next to None."""
        self.data = data
        self.next = None

2.	class SinglyLinkedList:
    def __init__(self):
         """Initializes an empty linked list with head pointing to None."""
        self.head = None

   def is_empty(self) -> bool:
        """Returns True if the linked list is empty, False otherwise."""
        return self.head is None

    def prepend(self, data):
        """Inserts a new node at the beginning of the linked list."""
        new_node = Node(data)
        new_node.next = self.head  # The new node points to the current head
        self.head = new_node  # Update head to new node

    def append(self, data):
        """Inserts a new node at the end of the linked list."""
        new_node = Node(data)
        if self.is_empty():
            self.head = new_node
            return
        
        current = self.head
        while current.next:  # Traverse to the last node
            current = current.next
        current.next = new_node  # Append new node at the end

    def insert_after(self, target: Node, data):
        """Inserts a new node containing data after the node target."""
        if target is None:
            return  # Target node must be valid
        
        new_node = Node(data)
        new_node.next = target.next
        target.next = new_node

    def delete(self, target: Node) -> bool:
        """Deletes the node target from the linked list."""
        if self.is_empty():
            return False
        
        # If head is the target
        if self.head == target:
            self.head = self.head.next
            return True

        current = self.head
        while current.next and current.next != target:
            current = current.next

        if current.next:  # Found target node
            current.next = current.next.next
            return True

        return False  # Node not found

    def delete_by_value(self, data) -> bool:
        """Deletes the first node containing the given data."""
        if self.is_empty():
            return False
        
        # If head contains the data
        if self.head.data == data:
            self.head = self.head.next
            return True

        current = self.head
        while current.next and current.next.data != data:
            current = current.next

        if current.next:  # Found the node
            current.next = current.next.next
            return True

        return False  # Value not found

    def search(self, data):
        """Searches the linked list for a node containing data."""
        current = self.head
        while current:
            if current.data == data:
                return current  # Found node
            current = current.next
        return None  # Not found

    def size(self) -> int:
        """Returns the number of nodes in the linked list."""
        count = 0
        current = self.head
        while current:
            count += 1
            current = current.next
        return count

    def to_list(self):
        """Returns a Python list containing all the linked list elements."""
        result = []
        current = self.head
        while current:
            result.append(current.data)
            current = current.next
        return result

    def print_list(self):
        """Prints all the elements in the linked list."""
        current = self.head
        while current:
            print(current.data, end=" -> ")
            current = current.next
        print("None")


# Example usage:
ll = SinglyLinkedList()
ll.append(10)
ll.append(20)
ll.prepend(5)
ll.print_list()  # Output: 5 -> 10 -> 20 -> None

PART B: Big-O Analysis
Big-O notation is used to analyze the time complexity of operations. It describes the worst-case runtime in terms of n, the number of nodes in the list. We also need to determine T(n), which represents the exact number of steps a function takes.

Analysis of Each Function
1.	Function: __init__(), T(n) = 1, 	O(n)  = O(1). Initializes an empty list.
2.	Function: is_empty(), T(n) = 1, O(n)  = O(1). Checks if head is None.
3.	Function: prepend(data), T(n) = 2, O(n) = O(1). Inserts a node at the beginning.
4.	Function: append(data), T(n) = n + 2, O(n) = O(n). Traverses the list to find the last node.
5.	Function: insert_after(target, data), T(n) = 2, O(n) = O(1). Directly inserts after target.
6.	Function: delete(target), T(n) = n + 2, O(n) = O(n). Traverses list to find target.
7.	Function: delete_by_value(data), T(n) = n + 2, O(n) = O(n). Traverses list to find data.
8.	Function: search(data), T(n) = n, O(n) = O(n), Worst case, it searches through all n nodes.
9.	Function: size(), T(n) = n, O(n) = O(n). Traverses the list to count elements.
10.	Function: to_list(), T(n) = n, O(n) = O(n), Traverses list to convert to Python list.
11.	Function: print_list(), T(n) = n, O(n) = O(n). Traverses list to print elements.

Understanding the Complexity
Constant Time (O(1)): is_empty(), prepend(), and insert_after() run in O(1) time because they do not traverse the list.
Linear Time (O(n)): append(), delete(), delete_by_value(), search(), size(), to_list(), and print_list() run in O(n) time because they require traversing the list.
