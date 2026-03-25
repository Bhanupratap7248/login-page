# OTP Authentication Implementation

This Flutter project now includes a complete OTP (One-Time Password) authentication system for user registration and verification.

## Features

✅ **OTP Generation**: Generates random 6-digit OTP  
✅ **Signup Form Validation**: Email, password matching, and input validation  
✅ **OTP Verification Page**: User-friendly interface to enter OTP  
✅ **OTP Timer**: 5-minute expiration timer with countdown  
✅ **Resend OTP**: Allow users to resend OTP after expiration  
✅ **Error Handling**: Clear error messages for validation and verification failures  

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── pages/
│   ├── signup.dart          # Signup page with OTP flow
│   ├── login.dart           # Login page
│   ├── home.dart            # Home page
│   └── otp.dart             # OTP verification page
└── services/
    └── otp_service.dart     # OTP logic and utilities
```

## How It Works

### 1. **Signup Flow**
- User fills in username, email, password, and confirm password
- Form validation is performed
- If valid, OTP is generated and sent to the email
- User is navigated to OTP verification page

### 2. **OTP Verification**
- User receives a 6-digit OTP
- User enters the OTP digit by digit
- OTP has a 5-minute expiration timer
- If OTP is correct, account is created successfully
- If OTP is incorrect, error message is shown
- If OTP expires, user can request a new one

### 3. **Error Handling**
- Username required
- Valid email format required
- Password minimum 6 characters
- Passwords must match
- OTP must be all 6 digits
- OTP must match within expiration time

## Files Created/Modified

### New Files:
1. **`lib/services/otp_service.dart`** - OTP generation and verification logic
2. **`lib/pages/otp.dart`** - OTP verification UI page

### Modified Files:
1. **`lib/pages/signup.dart`** - Updated with OTP integration
2. **`lib/main.dart`** - Added OTP page import

## Usage

### Running the App
```bash
flutter pub get
flutter run
```

### Testing OTP
1. Navigate to Sign Up page
2. Fill in all form fields:
   - Username: Any username
   - Email: Any valid email format
   - Password: At least 6 characters
3. Click "Sign Up"
4. Check console for generated OTP (printed for testing)
5. Enter the OTP in the verification screen
6. Click "Verify" to complete registration

### Resending OTP
- If OTP expires (5 minutes), the "Resend" button becomes active
- Click "Resend" to get a new OTP with a fresh timer

## Customization

### Change OTP Length
In `lib/services/otp_service.dart`:
```dart
static const int otpLength = 6; // Change to desired length
```

### Change OTP Expiration Time
In `lib/services/otp_service.dart`:
```dart
static const int expirationSeconds = 300; // Change to desired time in seconds
```

### Send OTP via Email/SMS
In `lib/pages/signup.dart`, modify the `_handleSignup()` method to integrate with:
- Email service (e.g., Firebase, SendGrid)
- SMS service (e.g., Twilio)

## Real-World Integration

For production use, replace the print statement with actual email/SMS sending:

```dart
// In _handleSignup() method
// Instead of just printing:
// print('Generated OTP: $generatedOTP');

// Implement actual email sending:
await emailService.sendOTP(_emailController.text, generatedOTP);

// Or SMS sending:
await smsService.sendOTP(_phoneNumber, generatedOTP);
```

## Security Considerations

⚠️ **For Testing Only**: Currently, OTP is printed to console for easy testing.

**For Production:**
- Remove console logging of OTP
- Use secure email/SMS services
- Store OTP hash instead of plain text
- Implement rate limiting for OTP requests
- Use HTTPS for all communications
- Implement account lockout after failed attempts
- Store user data securely (hashed passwords)

## Dependencies

Currently uses only Flutter built-in packages:
- `flutter`: ^3.11.1
- `material` design

No additional packages required for this basic implementation.

## Future Enhancements

- [ ] Add SMS OTP option
- [ ] Implement backend API integration
- [ ] Add biometric verification
- [ ] Add email verification status
- [ ] Implement OTP attempt limiting
- [ ] Add password strength indicator
- [ ] Store user sessions securely
- [ ] Add social login options

## Troubleshooting

**OTP not appearing in console?**
- Check Flutter console output
- Ensure hot reload/restart has completed

**OTP page not navigating?**
- Verify OTPVerification import in signup.dart
- Check console for any errors

**Timer not working?**
- Ensure TimerPeriodic is properly cancelled in dispose()
- Check if state is being maintained

## License

This implementation is part of your Flutter project.
