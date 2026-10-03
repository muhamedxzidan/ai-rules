# Errors & Security

## Errors
- API/Firebase calls never fail silently: structured `try/catch`, return a Result/Failure to the Cubit.
- Specific messages, never "Something went wrong":
  "Invalid email or password", "Network connection failed", "You don't have permission to access this resource".
- Error strings live in `AppStrings`.

## Security
- Never hardcode API keys, tokens or credentials. Use environment variables or `flutter_secure_storage`.
