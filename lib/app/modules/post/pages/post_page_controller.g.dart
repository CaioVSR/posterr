// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostPageController on _PostPageControllerBase, Store {
  late final _$textLengthAtom =
      Atom(name: '_PostPageControllerBase.textLength', context: context);

  @override
  int get textLength {
    _$textLengthAtom.reportRead();
    return super.textLength;
  }

  @override
  set textLength(int value) {
    _$textLengthAtom.reportWrite(value, super.textLength, () {
      super.textLength = value;
    });
  }

  late final _$_PostPageControllerBaseActionController =
      ActionController(name: '_PostPageControllerBase', context: context);

  @override
  void setTextLength(int length) {
    final _$actionInfo = _$_PostPageControllerBaseActionController.startAction(
        name: '_PostPageControllerBase.setTextLength');
    try {
      return super.setTextLength(length);
    } finally {
      _$_PostPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textLength: ${textLength}
    ''';
  }
}
