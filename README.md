# 🛍️ My Store App

Modern E-Commerce Flutter Application built with Clean Architecture, BLoC, and REST APIs.

---

# 📱 Features

✅ Authentication
✅ Products Listing
✅ Categories
✅ Product Details
✅ Shopping Cart
✅ Favorites
✅ Orders
✅ Address Management
✅ Payment Integration (Stripe)
✅ Search
✅ Dark / Light Theme
✅ Pagination
✅ Shimmer Loading
✅ Responsive UI
✅ Carousel Slider
✅ Clean Architecture

---

# 🧱 Project Architecture

The project follows:

* Clean Architecture
* Feature-Based Structure
* BLoC State Management
* Repository Pattern

---

# 📂 Folder Structure

```bash
lib
│
├── core
│   ├── common_models
│   ├── common_widgets
│   ├── error
│   ├── network
│   ├── services
│   ├── theme
│   └── utils
│
├── features
│   ├── address
│   ├── auth
│   ├── bottom_nav_bar
│   ├── cart
│   ├── category
│   ├── favorite
│   ├── home
│   ├── orders
│   ├── payment
│   ├── products
│   ├── search
│   ├── settings
│   └── shipping
│
├── injection_container.dart
└── main.dart
```

---

# 🏛️ Clean Architecture

Each feature contains:

```bash
feature/
│
├── data
│   ├── data_source
│   ├── models
│   └── repository_impl
│
├── domain
│   ├── entities
│   ├── mapper
│   ├── use_case
│   └── repository
│
└── presentation
    ├── controller
    └── screen
```

---

# ⚙️ State Management

The project uses:

```yaml
flutter_bloc
```

# 🌐 Networking

The app uses:

* Dio
* Retrofit
* REST APIs

Files:

```bash
core/network/
```

Includes:

* dio_client.dart
* rest_client.dart
* api_constants.dart
* api_result.dart

---

# 💳 Payment

Stripe payment integration using:

```yaml
flutter_stripe
```

---

# 🎨 UI & UX

Packages used:

* shimmer
* carousel_slider
* smooth_page_indicator
* cached_network_image

Features:

✅ Responsive UI
✅ Skeleton Loading
✅ Modern UI
✅ Image Caching
✅ Smooth Animations

---

# 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.8
  flutter_bloc: ^9.1.1
  equatable: ^2.0.5
  get_it: ^7.6.0
  dio: ^5.9.2
  pretty_dio_logger: ^1.4.0
  dartz: ^0.10.1
  go_router: ^13.0.0
  cached_network_image: ^3.3.0
  shared_preferences: ^2.5.4
  retrofit: ^4.9.2
  json_annotation: ^4.11.0
  shimmer: ^3.0.0
  flutter_stripe: ^12.6.0
  confetti: ^0.8.0
  flutter_dotenv: ^5.0.2
  carousel_slider: ^5.1.2
  smooth_page_indicator: ^2.0.1
```

---

# 🚀 Getting Started

## 1️⃣ Clone Project

```bash
git clone https://github.com/QassemAbied/my_store
```

---

## 2️⃣ Install Packages

```bash
flutter pub get
```

---

## 3️⃣ Generate Files

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 4️⃣ Run App

```bash
flutter run
```

---

# 🔥 Features In Progress

* Wishlist Animation
* Push Notifications
* Product Reviews
* Search Suggestions
* Advanced Filtering

---

# 🛠️ Tech Stack

* Flutter
* Dart
* BLoC
* Clean Architecture
* Dio
* Retrofit
* Stripe API
* Shared Preferences
* REST API

---

# 📸 App Screens

## 🔐 Authentication

| Register | Create Profile |
|----------|----------------|
| <img src="assets/screenshots/register.png" width="250"/> | <img src="assets/screenshots/profile_create.png" width="250"/> |

---

## 🏠 Home & Products

| Home | Products |
|------|----------|
| <img src="assets/screenshots/home.png" width="250"/> | <img src="assets/screenshots/products.png" width="250"/> |

---

## 🔎 Search & Categories

| Search | Categories |
|---------|------------|
| <img src="assets/screenshots/search.png" width="250"/> | <img src="assets/screenshots/category.png" width="250"/> |

---

## 📦 Product Details

| Product Details |
|-----------------|
| <img src="assets/screenshots/product_details.png" width="250"/> |

---

## 🛒 Cart & Checkout

| Cart | Addresses | Shipping |
|------|------------|-----------|
| <img src="assets/screenshots/cart.png" width="250"/> | <img src="assets/screenshots/address.png" width="250"/> | <img src="assets/screenshots/shipping.png" width="250"/> |

| Payment | Stripe |
|----------|---------|
| <img src="assets/screenshots/payment.png" width="250"/> | <img src="assets/screenshots/stripe.png" width="250"/> |

---

## ✅ Orders

| Order Success | Order Tracking |
|---------------|----------------|
| <img src="assets/screenshots/order_success.png" width="250"/> | <img src="assets/screenshots/order_tracking.png" width="250"/> |

| My Orders |
|------------|
| <img src="assets/screenshots/orders.png" width="250"/> |

---

## ⚙️ Settings & Address

| Settings | 
|-----------|
| <img src="assets/screenshots/settings.png" width="250"/> | 

# 👨‍💻 Developer

Built with ❤️ using Flutter.
