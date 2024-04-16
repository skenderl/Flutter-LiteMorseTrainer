extension ListExtension<E> on List<E> {
  E? firstWhereOrNull(bool Function(E element) test) {
    for (final element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }

  bool equals(List<E>? other) {
    if (identical(this, other)) {
      return true;
    }

    if (other == null) {
      return false;
    }

    final it1 = iterator;
    final it2 = other.iterator;
    while (true) {
      final hasNext = it1.moveNext();
      if (hasNext != it2.moveNext()) {
        return false;
      }

      if (!hasNext) {
        return true;
      }

      if (it1.current != it2.current) {
        return false;
      }
    }
  }

  Iterable<R> mapIndexed<R>(R Function(int index, E element) convert) sync* {
    for (var index = 0; index < length; index++) {
      yield convert(index, this[index]);
    }
  }
}
