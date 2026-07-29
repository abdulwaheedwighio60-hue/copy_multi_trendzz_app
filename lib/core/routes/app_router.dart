import 'package:multi_trendzz/core/model/chat_user_model.dart';
import 'package:multi_trendzz/core/model/product_detail_item.dart';
import 'package:multi_trendzz/core/model/track_order_model.dart';
import 'package:multi_trendzz/presentation/auth_screens/forget_password/reset_password_screen.dart';
import 'package:multi_trendzz/presentation/auth_screens/forget_password/verify_email_screen.dart';
import 'package:multi_trendzz/presentation/auth_screens/forget_password/verify_otp_screen.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/chat/chat_detail_screen.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/chat/chat_list_screen.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/coupon/coupon_screen.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/my_order/my_order_screen.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/my_order/track_order_screen.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/proceed_to_check_out_screen/proceed_to_check_out_screen.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/product_detail_screen/product_detail_screen.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/settings/setting_screen.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/shipping_address/add_new_shipping_address.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/shipping_address/shipping_address_screen.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/user_profile_screen/edit_profile_screen.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/user_profile_screen/user_profile_screen.dart';
import 'package:multi_trendzz/presentation/auth_screens/complete_profile_screen/complete_profile_screen.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/dashboard_screen/dashboard_screen.dart';
import 'package:multi_trendzz/presentation/auth_screens/sign_up_screen/sign_up_screen.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/cart/cart_screen.dart';
import 'package:multi_trendzz/presentation/auth_screens/login_screen/login_screen.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/wallet/add_money_screen.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/wallet/wallet_screen.dart';
import 'package:multi_trendzz/presentation/notification/notification_screen.dart';
import 'package:multi_trendzz/presentation/payment_method/add_card_screen.dart';
import 'package:multi_trendzz/presentation/payment_method/payment_method_screen.dart';
import 'package:multi_trendzz/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:multi_trendzz/presentation/seller/analytics/analytics_screen.dart';
import 'package:multi_trendzz/presentation/seller/coupons/create_coupon_screen.dart';
import 'package:multi_trendzz/presentation/seller/coupons/seller_coupon_detail_screen.dart';
import 'package:multi_trendzz/presentation/seller/coupons/seller_coupon_screen.dart';
import 'package:multi_trendzz/presentation/seller/customer/customer_detail_screen.dart';
import 'package:multi_trendzz/presentation/seller/customer/customer_screen.dart';
import 'package:multi_trendzz/presentation/seller/inventory/inventory_screen.dart';
import 'package:multi_trendzz/presentation/seller/notification/notification_screen.dart';
import 'package:multi_trendzz/presentation/seller/order/order_detail_screen.dart';
import 'package:multi_trendzz/presentation/seller/order/order_screen.dart';
import 'package:multi_trendzz/presentation/seller/products/add_product_screen/add_product_screen.dart';
import 'package:multi_trendzz/presentation/seller/products/my_product_screen.dart';
import 'package:multi_trendzz/presentation/seller/root/seller_root_screen.dart';
import 'package:multi_trendzz/presentation/seller/shipping/shopping_detail_screen.dart';
import 'package:multi_trendzz/presentation/seller/shipping/shopping_screen.dart';
import 'package:multi_trendzz/presentation/seller/wallet/seller_wallet_screen.dart';
import 'package:multi_trendzz/presentation/welcome_screen/welcome_screen.dart';
import 'package:multi_trendzz/presentation/splash_screen/splash_screen.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/buyer_root_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.sellerCouponScreen,
    routes: [
      GoRoute(
        path: AppRoutes.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.welcomeScreen,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.signUpScreen,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: AppRoutes.completeProfileScreen,
        builder: (context, state) => const CompleteProfileScreen(),
      ),
      GoRoute(
        path: AppRoutes.rootScreen,
        builder: (context, state) => const RootScreen(),
      ),
      GoRoute(
        path: AppRoutes.dashboardScreen,
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: AppRoutes.productDetailScreen,
        builder: (context, state) {
          final ProductDetailModel? product =
          state.extra as ProductDetailModel?;

          return ProductDetailScreen(
            product: product,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.cartScreen,
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: AppRoutes.proceedToCheckOutScreen,
        builder: (context, state) => const ProceedToCheckOutScreen(),
      ),
      GoRoute(
        path: AppRoutes.userProfileScreen,
        builder: (context, state) => const UserProfileScreen(),
      ),
      GoRoute(
        path: AppRoutes.editProfileScreen,
        builder: (context, state) => const EditProfileScreen(),
      ),

      GoRoute(
        path: AppRoutes.paymentMethodScreen,
        builder: (context, state) => const PaymentMethodScreen(),
      ),

      GoRoute(
        path: AppRoutes.shippingAddressScreen,
        builder: (context, state) => const ShippingAddressScreen(),
      ),
      GoRoute(
        path: AppRoutes.addNewShippingAddress,
        builder: (context, state) => const AddNewShippingAddressScreen(),
      ),
      GoRoute(
        path: AppRoutes.addCardScreen,
        builder: (context, state) => const AddCardScreen(),
      ),
      GoRoute(
        path: AppRoutes.verifyEmailScreen,
        builder: (context, state) => const VerifyEmailScreen(),
      ),
      GoRoute(
        path: AppRoutes.verifyOtpScreen,
        builder: (context, state) {
          final String email = state.extra?.toString() ?? '';
          return VerifyOtpScreen(
            email: email,
          );
        },
      ),

      GoRoute(
          path: AppRoutes.resetPasswordScreen,
          builder: (context ,state){
            final String email = state.extra?.toString() ?? '';
            return ResetPasswordScreen(email: email);
          }
      ),

      GoRoute(
        path: AppRoutes.myOrderScreen,
        builder: (context, state) => const MyOrdersScreen(),
      ),

      GoRoute(
        path: AppRoutes.trackOrderScreen,
        builder: (context, state) {
          final TrackOrderModel? order = state.extra as TrackOrderModel?;

          return TrackOrderScreen(
            order: order,
          );
        },
      ),

      GoRoute(
        path: AppRoutes.walletScreen,
        builder: (context, state) => const WalletScreen(),
      ),

      GoRoute(
        path: AppRoutes.addMoneyScreen,
        builder: (context, state) => const AddMoneyScreen(),
      ),

      GoRoute(
        path: AppRoutes.couponScreen,
        builder: (context, state) => const CouponScreen(),
      ),
      GoRoute(
        path: AppRoutes.settingScreen,
        builder: (context, state) => const SettingScreen(),
      ),

      GoRoute(
        path: AppRoutes.notificationScreen,
        builder: (context, state) => const NotificationScreen(),
      ),

      GoRoute(
        path: AppRoutes.chatListScreen,
        builder: (context, state) {
          return const ChatListScreen();
        },
      ),

      GoRoute(
        path: AppRoutes.chatDetailScreen,
        builder: (context, state) {
          final ChatUserModel? user = state.extra as ChatUserModel?;

          return ChatDetailScreen(user: user);
        },
      ),

      ///Seller Router
      GoRoute(
        path: AppRoutes.sellerRootScreen,
        builder: (context, state) => const SellerRootScreen(),
      ),

      GoRoute(
        path: AppRoutes.myProductScreen,
        builder: (context, state) => const MyProductsScreen(),
      ),

      GoRoute(
        path: AppRoutes.addProductScreen,
        builder: (context, state) => const AddProductScreen(),
      ),

      GoRoute(
        path: AppRoutes.orderScreen,
        builder: (context, state) => const OrderScreen(),
      ),

      GoRoute(
        path: AppRoutes.orderDetailScreen,
        builder: (context, state) => const OrderDetailsScreen(),
      ),

      GoRoute(
        path: AppRoutes.analyticsScreen,
        builder: (context, state) => const AnalyticsScreen(),
      ),


      GoRoute(
        path: AppRoutes.sellerWalletScreen,
        builder: (context, state) => const SellerWalletScreen(),
      ),

      GoRoute(
        path: AppRoutes.inventoryScreen,
        builder: (context, state) => const InventoryScreen(),
      ),


      GoRoute(
        path: AppRoutes.customerDetailScreen,
        builder: (context, state) => const CustomerDetailScreen(),
      ),

      GoRoute(
        path: AppRoutes.customerScreen,
        builder: (context, state) => const CustomerScreen(),
      ),

      GoRoute(
        path: AppRoutes.sellerNotificationScreen,
        builder: (context, state) => const SellerNotificationScreen(),
      ),

      GoRoute(
        path: AppRoutes.shoppingScreen,
        builder: (context, state) => const ShoppingScreen(),
      ),
      GoRoute(
        path: AppRoutes.shoppingDetailScreen,
        builder: (context, state) => const ShoppingDetailScreen(),
      ),


      GoRoute(
        path: AppRoutes.sellerCouponScreen,
        builder: (context, state) => const SellerCouponScreen(),
      ),

      GoRoute(
        path: AppRoutes.sellerCouponDetailScreen,
        builder: (context, state) => const SellerCouponDetailScreen(),
      ),

      GoRoute(
        path: AppRoutes.createCouponScreen,
        builder: (context, state) => const CreateCouponScreen(),
      ),
    ],
  );
}