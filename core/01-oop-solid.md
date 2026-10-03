# OOP + SOLID (always on)

## Purpose
Every class has one clear job and depends on abstractions.

## MUST
- **SRP**: one class = one reason to change. `LoginCubit` handles login only; `OrderRepository` handles orders only.
- **OCP**: add behavior by adding a class (extend/implement), not by editing working code.
- **LSP**: a subtype must work wherever its parent is used. Keep generics typed (see example).
- **ISP**: split fat abstractions into small focused ones.
- **DIP**: Cubits depend on `*RepositoryBase` abstractions, never concrete repositories.
- **Encapsulation**: private fields by default (`_firestore`), expose only the public API.
- Dependencies are explicit through constructors.
- Prefer composition over inheritance. Inherit only for a real "is-a".

## MUST NOT
- God classes, or vague `Helper` / `Manager` / `Utils` dumping grounds.
- Base classes created only to share a few lines.
- Abstractions with no current need (apply SOLID pragmatically).

## Examples
```dart
// SRP
// OK: class OrderRepository { Future<OrderModel> fetchOrder(String id) ... }
//     class InvoiceRepository { Future<void> sendInvoice(OrderModel o) ... }
// BAD: OrderRepository that also sends invoices

// LSP + no dynamic: generic base keeps subtypes substitutable
abstract class BaseRepository<T> {
  Future<List<T>> fetchAll();
}
class OrderRepository implements BaseRepository<OrderModel> {
  @override
  Future<List<OrderModel>> fetchAll() async => [];
}

// ISP
abstract class Readable<T> { Future<List<T>> fetchAll(); }
abstract class Writable<T> { Future<void> save(T item); }
class OrderRepository implements Readable<OrderModel>, Writable<OrderModel> { /* ... */ }
class ReportRepository implements Readable<ReportModel> { /* read only */ }

// DIP
abstract class AuthRepositoryBase {
  Future<UserModel> login(String email, String password);
}
class LoginCubit extends Cubit<LoginState> {
  final AuthRepositoryBase _repo; // abstraction
  LoginCubit(this._repo) : super(LoginInitial());
}
```

## Checklist
- [ ] Each touched class still has one responsibility
- [ ] Cubits depend on abstractions
- [ ] No unnecessary abstraction added
