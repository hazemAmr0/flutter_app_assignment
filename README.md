# 🧑‍💻 Flutter User Manager _ Assignment

A beautiful, responsive, and smart Flutter application for managing users with search, profile details, offline mode, and add-new-user form — built using **Provider**, REST API integration, and clean UI/UX architecture.

---

## 🚀 Key Features

### 🏠 Home Page - User Grid
- Responsive grid layout (adapts to mobile, tablet, desktop)
- Animated user cards with names, emails, and company
- Integrated **search bar** for instant filtering

### 🧑‍🎓 User Details Page
- Full profile view: Name, Username, Email, Phone, Website
- Nested Address details and Geo location
- Company data: Name, Catch Phrase, Business line
- Smooth UI transitions and responsive layout

### ➕ Add New User Form
- Sectioned form: Basic Info, Address, Company
- Real-time validation
- Local state update via Provider
- Clean Material 3 UI and user-friendly layout

### 📴 Offline Support
- Detects lack of internet with animated UI
- Helpful tips + Retry button
- Uses `connectivity_plus` package

---

## 🧠 Tech Stack

- ✅ **Flutter 3.x** – Cross-platform UI
- ✅ **Dart** – App logic
- ✅ **REST API** – Using [JSONPlaceholder](https://jsonplaceholder.typicode.com/users)
- ✅ **Provider** – State management
- ✅ **ScreenUtil** – Responsive sizing
- ✅ **Connectivity Plus** – Internet status tracking


---

## 📸 App Preview

| Home Page | Details Page | Add User | Offline |
|-----------|--------------|----------|---------|
| ![home_page](https://github.com/user-attachments/assets/bbdcdf5c-936c-4ac7-a345-2dfb86cb466f) | ![details_user](https://github.com/user-attachments/assets/0a95ee55-497b-4d0c-9d63-2bdd147f6603) | ![add_user](https://github.com/user-attachments/assets/733c9de6-72c0-4197-8aa3-a27a3eaf06e4) | ![no_internet](https://github.com/user-attachments/assets/521ef440-33c8-48ce-af35-1467defcc3c6) |



---

## 🛠 Getting Started

### Clone & Run

```bash
git clone https://github.com/yourusername/flutter_user_manager.git
cd flutter_user_manager
flutter pub get
flutter run


