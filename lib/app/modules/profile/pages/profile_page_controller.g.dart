// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfilePageController on _ProfilePageControllerBase, Store {
  late final _$filtersAtom =
      Atom(name: '_ProfilePageControllerBase.filters', context: context);

  @override
  ObservableList<FilterEnum> get filters {
    _$filtersAtom.reportRead();
    return super.filters;
  }

  @override
  set filters(ObservableList<FilterEnum> value) {
    _$filtersAtom.reportWrite(value, super.filters, () {
      super.filters = value;
    });
  }

  late final _$_ProfilePageControllerBaseActionController =
      ActionController(name: '_ProfilePageControllerBase', context: context);

  @override
  dynamic toggleFilter(FilterEnum filter) {
    final _$actionInfo = _$_ProfilePageControllerBaseActionController
        .startAction(name: '_ProfilePageControllerBase.toggleFilter');
    try {
      return super.toggleFilter(filter);
    } finally {
      _$_ProfilePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filters: ${filters}
    ''';
  }
}
