# 🛍️ My Store App

Modern AI-Powered E-Commerce Flutter Application built with Clean Architecture, BLoC, REST APIs, Offline Storage, and AI Features.

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
✅ Offline Support  
✅ Local Caching with Hive  
✅ Optimistic UI Updates  
✅ Clean Architecture  

---

# 🤖 AI Features

✅ AI Smart Chat  
✅ AI Vision Chat (Image + Text Understanding)  
✅ AI Product Recommendations  
✅ AI Smart Product Search  
✅ Real-Time Streaming AI Responses  
✅ Markdown Rendering  
✅ Syntax Highlighted AI Messages  

---

# 🧱 Project Architecture

The project follows:

* Clean Architecture
* Feature-Based Structure
* BLoC State Management
* SOLID Principles
* Repository Pattern
* Dependency Injection (GetIt)
* Offline-First Architecture
* Scalable & Maintainable Codebase

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
│   ├── ai
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
````

---

# 🏛️ Clean Architecture

Each feature contains:

```bash
feature/
│
├── data
│   ├── data_source
│   │   ├── remote_data_source
│   │   └── local_data_source
│   │
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

Architecture flow:

```txt
UI → Cubit → UseCase → Repository → Data Source
```

---

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
* network_info.dart

---

# 💾 Offline Storage

The project supports Offline-First Architecture using:

```yaml
hive_ce
hive_ce_flutter
```

Features:

✅ Local Caching
✅ Offline Cart
✅ Offline Addresses
✅ Offline Orders
✅ Cached Products
✅ Cached Categories
✅ Optimistic UI Updates
✅ Server Sync Support

---

# 🔄 Offline & Sync Flow

The app supports:

```txt
Remote First + Local Fallback
```

Flow:

```txt
Server Available:
Remote → Cache Local → UI

Server Offline:
Local Cache → UI
```

Includes:

* Local Data Sources
* Hive Adapters
* Repository Cache Handling
* Offline Persistence

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
* flutter_markdown_plus
* syntax_highlight

Features:

✅ Responsive UI
✅ Skeleton Loading
✅ Modern UI
✅ Image Caching
✅ Smooth Animations
✅ Optimistic UI
✅ Markdown Rendering
✅ Syntax Highlighting

---

# 🤖 AI System

The application integrates AI-powered features using OpenAI APIs.

Includes:

* AI Smart Chat
* AI Vision Chat
* AI Search
* AI Product Recommendations
* Streaming AI Responses

AI Features Support:

✅ Real-Time Streaming
✅ Image + Text Understanding
✅ Markdown Responses
✅ Syntax Highlighted Code Blocks
✅ AI Recommendation Engine

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
  retrofit: ^4.9.2
  pretty_dio_logger: ^1.4.0

  dartz: ^0.10.1

  go_router: ^13.0.0

  cached_network_image: ^3.3.0

  shared_preferences: ^2.5.4

  json_annotation: ^4.11.0

  hive_ce: ^2.13.0
  hive_ce_flutter: ^2.3.1

  shimmer: ^3.0.0

  flutter_stripe: ^12.6.0

  confetti: ^0.8.0

  flutter_dotenv: ^5.0.2

  carousel_slider: ^5.1.2

  smooth_page_indicator: ^2.0.1

  flutter_markdown_plus: ^1.0.7

  syntax_highlight: ^0.5.0
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
* Order Tracking Improvements
* Voice AI Assistant

---

# 🛠️ Tech Stack

* Flutter
* Dart
* BLoC
* Clean Architecture
* Dio
* Retrofit
* Hive
* Offline Storage
* Stripe API
* Shared Preferences
* OpenAI API
* Markdown Rendering
* Syntax Highlighting

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

| Product Details |
|-----------------|
| <img src="assets/screenshots/product_details.png" width="250"/> |

---

## 🔎 Search & Categories

| Search | Categories |
|--------|------------|
| <img src="assets/screenshots/search.png" width="250"/> | <img src="assets/screenshots/category.png" width="250"/> |

---

## 🤖 AI Features

| AI Chat | AI Collection |
|---------|---------------|
| <img src="assets/screenshots/ai_chat.png" width="250"/> | <img src="assets/screenshots/ai_collection.png" width="250"/> |

| AI Screen | AI Recommendation |
|------------|------------------|
| <img src="assets/screenshots/ai.png" width="250"/> | <img src="assets/screenshots/ai_recommandtion.png" width="250"/> |

| Product Details + AI |
|----------------------|
| <img src="assets/screenshots/details_ai.png" width="250"/> |

---

## 🛒 Cart & Checkout

| Cart | Address |
|------|----------|
| <img src="assets/screenshots/cart.png" width="250"/> | <img src="assets/screenshots/address.png" width="250"/> |

| Shipping | Payment |
|-----------|----------|
| <img src="assets/screenshots/shipping.png" width="250"/> | <img src="assets/screenshots/payment.png" width="250"/> |

| Stripe |
|---------|
| <img src="assets/screenshots/stripe.png" width="250"/> |

---

## 📦 Orders

| Orders | Order Success |
|--------|----------------|
| <img src="assets/screenshots/orders.png" width="250"/> | <img src="assets/screenshots/order_success.png" width="250"/> |

| Order Tracking |
|----------------|
| <img src="assets/screenshots/order_tracking.png" width="250"/> |

---

## ⚙️ Settings

| Settings |
|-----------|
| <img src="assets/screenshots/settings.png" width="250"/> |
```



# 🎥 Demo Video

Check out the full app demo on LinkedIn:

[▶ Watch Demo Video](https://www.linkedin.com/posts/qassem-abied-14bb14233_flutter-dart-mobiledevelopment-ugcPost-7458859294504034304-MAef)

---

# 👨‍💻 Developer

Built with ❤️ using Flutter, AI, and Clean Architecture.
```


