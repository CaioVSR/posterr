// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfilePageController on _ProfilePageControllerBase, Store {
  late final _$postsListAtom =
      Atom(name: '_ProfilePageControllerBase.postsList', context: context);

  @override
  ObservableList<PostModel> get postsList {
    _$postsListAtom.reportRead();
    return super.postsList;
  }

  @override
  set postsList(ObservableList<PostModel> value) {
    _$postsListAtom.reportWrite(value, super.postsList, () {
      super.postsList = value;
    });
  }

  @override
  String toString() {
    return '''
postsList: ${postsList}
    ''';
  }
}
