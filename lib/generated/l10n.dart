// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Log In`
  String get login {
    return Intl.message(
      'Log In',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to YouIn`
  String get hello_to_youin {
    return Intl.message(
      'Welcome to YouIn',
      name: 'hello_to_youin',
      desc: '',
      args: [],
    );
  }

  /// `Log In to YouIn Store`
  String get login_to_store {
    return Intl.message(
      'Log In to YouIn Store',
      name: 'login_to_store',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enter_your_email {
    return Intl.message(
      'Enter your email',
      name: 'enter_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get pass {
    return Intl.message(
      'Password',
      name: 'pass',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enter_pass {
    return Intl.message(
      'Enter your password',
      name: 'enter_pass',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forget_pass {
    return Intl.message(
      'Forgot your password?',
      name: 'forget_pass',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dont_have {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dont_have',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get have_account {
    return Intl.message(
      'Already have an account?',
      name: 'have_account',
      desc: '',
      args: [],
    );
  }

  /// `Create a new account`
  String get register {
    return Intl.message(
      'Create a new account',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Sign up now and enjoy the features`
  String get enjoy_with_us {
    return Intl.message(
      'Sign up now and enjoy the features',
      name: 'enjoy_with_us',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get verify_pass {
    return Intl.message(
      'Confirm Password',
      name: 'verify_pass',
      desc: '',
      args: [],
    );
  }

  /// `This field must not be empty`
  String get validate {
    return Intl.message(
      'This field must not be empty',
      name: 'validate',
      desc: '',
      args: [],
    );
  }

  /// `This is not a valid email`
  String get condition_email {
    return Intl.message(
      'This is not a valid email',
      name: 'condition_email',
      desc: '',
      args: [],
    );
  }

  /// `Password is too short`
  String get condition_pass {
    return Intl.message(
      'Password is too short',
      name: 'condition_pass',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Name`
  String get name_text {
    return Intl.message(
      'Enter Your Name',
      name: 'name_text',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get mobile_number {
    return Intl.message(
      'Phone Number',
      name: 'mobile_number',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Phone Number`
  String get mobile_number_text {
    return Intl.message(
      'Enter your Phone Number',
      name: 'mobile_number_text',
      desc: '',
      args: [],
    );
  }

  /// `Please phone number must be valid`
  String get condition_phone {
    return Intl.message(
      'Please phone number must be valid',
      name: 'condition_phone',
      desc: '',
      args: [],
    );
  }

  /// `password is wrong`
  String get validate_password_verify {
    return Intl.message(
      'password is wrong',
      name: 'validate_password_verify',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get category {
    return Intl.message(
      'Categories',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get orders {
    return Intl.message(
      'My Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get main {
    return Intl.message(
      'Home',
      name: 'main',
      desc: '',
      args: [],
    );
  }

  /// `My Account`
  String get profile {
    return Intl.message(
      'My Account',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notify {
    return Intl.message(
      'Notifications',
      name: 'notify',
      desc: '',
      args: [],
    );
  }

  /// `Shopping Cart`
  String get shopCar {
    return Intl.message(
      'Shopping Cart',
      name: 'shopCar',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Refundable Balance`
  String get cash {
    return Intl.message(
      'Refundable Balance',
      name: 'cash',
      desc: '',
      args: [],
    );
  }

  /// `Registration Date`
  String get dateRegister {
    return Intl.message(
      'Registration Date',
      name: 'dateRegister',
      desc: '',
      args: [],
    );
  }

  /// `Edit Account`
  String get edit_profile {
    return Intl.message(
      'Edit Account',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `All Orders`
  String get MyAllOrders {
    return Intl.message(
      'All Orders',
      name: 'MyAllOrders',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Offers`
  String get offers {
    return Intl.message(
      'Offers',
      name: 'offers',
      desc: '',
      args: [],
    );
  }

  /// `All Shops`
  String get allShops {
    return Intl.message(
      'All Shops',
      name: 'allShops',
      desc: '',
      args: [],
    );
  }

  /// `DashBoard`
  String get controlPage {
    return Intl.message(
      'DashBoard',
      name: 'controlPage',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logOut {
    return Intl.message(
      'Logout',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Product Information`
  String get detailsOrder {
    return Intl.message(
      'Product Information',
      name: 'detailsOrder',
      desc: '',
      args: [],
    );
  }

  /// `No Notifications`
  String get noNotify {
    return Intl.message(
      'No Notifications',
      name: 'noNotify',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPass {
    return Intl.message(
      'Reset Password',
      name: 'resetPass',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get resetButton {
    return Intl.message(
      'Reset',
      name: 'resetButton',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the email associated with your account,\nthen click the send button to receive a message on your email to reset your password.`
  String get containResetPass {
    return Intl.message(
      'Please enter the email associated with your account,\nthen click the send button to receive a message on your email to reset your password.',
      name: 'containResetPass',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get sure {
    return Intl.message(
      'Confirm',
      name: 'sure',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verifyButton {
    return Intl.message(
      'Verify',
      name: 'verifyButton',
      desc: '',
      args: [],
    );
  }

  /// `Verification Code`
  String get verifyCode {
    return Intl.message(
      'Verification Code',
      name: 'verifyCode',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the 4-digit code sent to your email`
  String get pleaseEnterCoderContain {
    return Intl.message(
      'Please enter the 4-digit code sent to your email',
      name: 'pleaseEnterCoderContain',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive the code?`
  String get QSend {
    return Intl.message(
      'Didn\'t receive the code?',
      name: 'QSend',
      desc: '',
      args: [],
    );
  }

  /// `Resend Again`
  String get resendAgain {
    return Intl.message(
      'Resend Again',
      name: 'resendAgain',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get NewPassword {
    return Intl.message(
      'New Password',
      name: 'NewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get VerifyNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'VerifyNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get ChangePasswordButton {
    return Intl.message(
      'Change Password',
      name: 'ChangePasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been successfully linked to your phone number`
  String get verifyDoneSuccess {
    return Intl.message(
      'Your account has been successfully linked to your phone number',
      name: 'verifyDoneSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Best Discounts`
  String get BestDiscount {
    return Intl.message(
      'Best Discounts',
      name: 'BestDiscount',
      desc: '',
      args: [],
    );
  }

  /// `Lowest Price`
  String get lowestPrice {
    return Intl.message(
      'Lowest Price',
      name: 'lowestPrice',
      desc: '',
      args: [],
    );
  }

  /// `Addresses`
  String get Addresses {
    return Intl.message(
      'Addresses',
      name: 'Addresses',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get Details {
    return Intl.message(
      'Details',
      name: 'Details',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get AddToCar {
    return Intl.message(
      'Add to Cart',
      name: 'AddToCar',
      desc: '',
      args: [],
    );
  }

  /// `Complete Purchase`
  String get ContinueButtonBuy {
    return Intl.message(
      'Complete Purchase',
      name: 'ContinueButtonBuy',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Address`
  String get Address {
    return Intl.message(
      'Delivery Address',
      name: 'Address',
      desc: '',
      args: [],
    );
  }

  /// `Add New Address`
  String get AddNewAddress {
    return Intl.message(
      'Add New Address',
      name: 'AddNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `Tell us anything we should know when delivering your order`
  String get TellUsDetails {
    return Intl.message(
      'Tell us anything we should know when delivering your order',
      name: 'TellUsDetails',
      desc: '',
      args: [],
    );
  }

  /// `Detailed address for delivery location (required)`
  String get TellUsAddress {
    return Intl.message(
      'Detailed address for delivery location (required)',
      name: 'TellUsAddress',
      desc: '',
      args: [],
    );
  }

  /// `Choose District`
  String get chooseDistrict {
    return Intl.message(
      'Choose District',
      name: 'chooseDistrict',
      desc: '',
      args: [],
    );
  }

  /// `Choose City`
  String get chooseCity {
    return Intl.message(
      'Choose City',
      name: 'chooseCity',
      desc: '',
      args: [],
    );
  }

  /// `Choose Region`
  String get chooseRegion {
    return Intl.message(
      'Choose Region',
      name: 'chooseRegion',
      desc: '',
      args: [],
    );
  }

  /// `Alternative Phone Number`
  String get AnotherPhone {
    return Intl.message(
      'Alternative Phone Number',
      name: 'AnotherPhone',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get Hello {
    return Intl.message(
      'Hello',
      name: 'Hello',
      desc: '',
      args: [],
    );
  }

  /// `Total Balance`
  String get AllCash {
    return Intl.message(
      'Total Balance',
      name: 'AllCash',
      desc: '',
      args: [],
    );
  }

  /// `Account Activated`
  String get DoneAccount {
    return Intl.message(
      'Account Activated',
      name: 'DoneAccount',
      desc: '',
      args: [],
    );
  }

  /// `Number of Orders`
  String get NumberOfOrders {
    return Intl.message(
      'Number of Orders',
      name: 'NumberOfOrders',
      desc: '',
      args: [],
    );
  }

  /// `Total Sales`
  String get AllSells {
    return Intl.message(
      'Total Sales',
      name: 'AllSells',
      desc: '',
      args: [],
    );
  }

  /// `+ Shipping Fees`
  String get rosom {
    return Intl.message(
      '+ Shipping Fees',
      name: 'rosom',
      desc: '',
      args: [],
    );
  }

  /// `Grand Total`
  String get AllCounts {
    return Intl.message(
      'Grand Total',
      name: 'AllCounts',
      desc: '',
      args: [],
    );
  }

  /// `(Including Tax Value)`
  String get valueAdded {
    return Intl.message(
      '(Including Tax Value)',
      name: 'valueAdded',
      desc: '',
      args: [],
    );
  }

  /// `Additional Information`
  String get ExtraInfo {
    return Intl.message(
      'Additional Information',
      name: 'ExtraInfo',
      desc: '',
      args: [],
    );
  }

  /// `Value Added Tax Amount`
  String get ExtraInfoValue {
    return Intl.message(
      'Value Added Tax Amount',
      name: 'ExtraInfoValue',
      desc: '',
      args: [],
    );
  }

  /// `Total Invoice Value in Saudi Riyals`
  String get CountsPound {
    return Intl.message(
      'Total Invoice Value in Saudi Riyals',
      name: 'CountsPound',
      desc: '',
      args: [],
    );
  }

  /// `Go To Home Page`
  String get EnterToHome {
    return Intl.message(
      'Go To Home Page',
      name: 'EnterToHome',
      desc: '',
      args: [],
    );
  }

  /// `Price :`
  String get thePriceInDetail {
    return Intl.message(
      'Price :',
      name: 'thePriceInDetail',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get amount {
    return Intl.message(
      'Quantity',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Rate`
  String get rate {
    return Intl.message(
      'Rate',
      name: 'rate',
      desc: '',
      args: [],
    );
  }

  /// `Choose the delivery method`
  String get deliveryMethod {
    return Intl.message(
      'Choose the delivery method',
      name: 'deliveryMethod',
      desc: '',
      args: [],
    );
  }

  /// `Added to cart successfully`
  String get successAddedToCar {
    return Intl.message(
      'Added to cart successfully',
      name: 'successAddedToCar',
      desc: '',
      args: [],
    );
  }

  /// `Standard shipping`
  String get StandardShipping {
    return Intl.message(
      'Standard shipping',
      name: 'StandardShipping',
      desc: '',
      args: [],
    );
  }

  /// `Address In Detail`
  String get AddressLabel {
    return Intl.message(
      'Address In Detail',
      name: 'AddressLabel',
      desc: '',
      args: [],
    );
  }

  /// `Read More`
  String get readMore {
    return Intl.message(
      'Read More',
      name: 'readMore',
      desc: '',
      args: [],
    );
  }

  /// `Empty Car`
  String get noShop {
    return Intl.message(
      'Empty Car',
      name: 'noShop',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Read Less`
  String get readLess {
    return Intl.message(
      'Read Less',
      name: 'readLess',
      desc: '',
      args: [],
    );
  }

  /// `There are no favourites`
  String get noFav {
    return Intl.message(
      'There are no favourites',
      name: 'noFav',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `shop Now`
  String get shopNow {
    return Intl.message(
      'shop Now',
      name: 'shopNow',
      desc: '',
      args: [],
    );
  }

  /// `Confirm phone number`
  String get verifyPhone {
    return Intl.message(
      'Confirm phone number',
      name: 'verifyPhone',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get SeeMore {
    return Intl.message(
      'See All',
      name: 'SeeMore',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get FullName {
    return Intl.message(
      'Full Name',
      name: 'FullName',
      desc: '',
      args: [],
    );
  }

  /// `Not specified`
  String get known {
    return Intl.message(
      'Not specified',
      name: 'known',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
