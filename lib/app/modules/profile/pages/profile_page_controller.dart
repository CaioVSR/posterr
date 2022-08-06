import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:posterr/app/modules/profile/enums/filter_enum.dart';

part 'profile_page_controller.g.dart';

class ProfilePageController = _ProfilePageControllerBase with _$ProfilePageController;

abstract class _ProfilePageControllerBase with Store {
  @observable
  ObservableList<FilterEnum> filters = <FilterEnum>[...FilterEnum.values].asObservable();

  @action
  toggleFilter(FilterEnum filter) {
    if (filters.contains(filter)) {
      filters.remove(filter);
    } else {
      filters.add(filter);
    }
  }

  togglePosts() => toggleFilter(FilterEnum.posts);
  toggleReposts() => toggleFilter(FilterEnum.reposts);
  toggleQuotes() => toggleFilter(FilterEnum.quotes);

  bool isFilterSelected(FilterEnum filter) => filters.contains(filter);

  bool get isPostSelected => filters.contains(FilterEnum.posts);
  bool get isRepostSelected => filters.contains(FilterEnum.reposts);
  bool get isQuoteSelected => filters.contains(FilterEnum.quotes);
}
