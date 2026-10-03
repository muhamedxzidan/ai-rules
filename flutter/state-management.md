# State Management (flutter_bloc)

## MUST
- Use **Cubit**, not Bloc, unless the feature truly needs events.
- States are a `sealed class` named `FeatureInitial / FeatureLoading / FeatureSuccess / FeatureFailure`. No generic `LoadingState` / `ErrorState`.
- Cubits contain no UI code and no `BuildContext`.
- All conditions, validations and calculations live in the Cubit.
- `setState` is FORBIDDEN. Only exception: purely UI local objects (AnimationController, FocusNode, TextEditingController) with zero business logic, preferably isolated in their own widget.
- Public Cubit methods have `///` doc comments (what, params, which states are emitted).

## buildWhen / listenWhen (always)
- `buildWhen`: rebuild only when the UI really changes. A builder that displays Loading/Initial MUST NOT filter them out.
- `listenWhen`: only for side effects (SnackBar, navigation), usually Success/Failure.

```dart
// Builder: rebuild when the state type changes (Loading shows, Success shows...)
BlocBuilder<OrderCubit, OrderState>(
  buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
  builder: (context, state) => switch (state) {
    OrderSuccess(:final orders) => OrderList(orders: orders),
    OrderFailure(:final message) => OrderErrorView(message: message),
    _ => const OrderLoadingView(),
  },
)

// Side effects: listen only to terminal states
BlocListener<LoginCubit, LoginState>(
  listenWhen: (p, c) => c is LoginSuccess || c is LoginFailure,
  listener: (context, state) {
    if (state is LoginSuccess) Navigator.pushNamed(context, AppRoutes.home);
    if (state is LoginFailure) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
    }
  },
  child: const LoginForm(),
)
```

## Debounced search (mandatory for any search)
Never hit the repository per keystroke. Wait 300-500 ms, cancel the previous timer, cancel in `close()`.

```dart
class SearchCubit extends Cubit<SearchState> {
  final SearchRepositoryBase _repo;
  Timer? _debounce;
  SearchCubit(this._repo) : super(SearchInitial());

  /// Called on each keystroke; searches 400 ms after the user stops typing.
  void onSearchChanged(String query) {
    _debounce?.cancel();
    if (query.trim().isEmpty) { emit(SearchInitial()); return; }
    _debounce = Timer(const Duration(milliseconds: 400), () => _search(query.trim()));
  }

  Future<void> _search(String query) async {
    emit(SearchLoading());
    try {
      emit(SearchSuccess(results: await _repo.search(query)));
    } catch (_) {
      emit(SearchFailure(message: AppStrings.searchFailed));
    }
  }

  @override
  Future<void> close() { _debounce?.cancel(); return super.close(); }
}
```
