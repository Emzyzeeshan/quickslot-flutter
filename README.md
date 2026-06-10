# QuickSlot Flutter App

## Overview

QuickSlot is a Flutter application that allows users to browse sports venues, view available slots, book slots, manage bookings, and cancel bookings.

The application communicates with the QuickSlot Backend through REST APIs.

---

## Features

* User Selection
* Venue Listing
* Slot Availability View
* Slot Booking
* Booking Conflict Handling
* My Bookings
* Booking Cancellation
* Loading States
* Empty States
* Error Handling

---

## Tech Stack

* Flutter
* Provider
* Dio
* Material Design

---

## Project Structure

```text
lib/

core/
 ├── network/
 └── widgets/

models/

providers/

services/

screens/
 ├── login/
 ├── venues/
 └── bookings/

main.dart
```

---

## Setup Instructions

### 1. Clone Repository

```bash
git clone <repository-url>
cd quickslot_flutter
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Configure API URL

Update:

```dart
lib/core/network/api_client.dart
```

Example:

```dart
class ApiClient {
  static const baseUrl =
      'http://192.168.1.100:5000';
}
```

For Android Emulator:

```dart
class ApiClient {
  static const baseUrl =
      'http://10.0.2.2:5000';
}
```

---

### 4. Run Application

```bash
flutter run
```

---

## Application Flow

```text
User Selection
        ↓
Venue List
        ↓
Venue Details
        ↓
Available Slots
        ↓
Book Slot
        ↓
My Bookings
        ↓
Cancel Booking
```

---

## State Management

Provider is used for state management.

Providers:

* UserProvider
* VenueProvider
* SlotProvider
* BookingProvider
* MyBookingProvider

This approach keeps UI and business logic separated and maintains a simple architecture suitable for the hackathon scope.

---

## Booking Conflict Handling

If a slot is booked by another user before the current booking request completes:

* Backend returns HTTP 409 Conflict
* Flutter displays a booking conflict dialog
* User can select another available slot

---

## Error Handling

The application includes:

* Loading States
* Empty States
* API Error Handling
* Booking Conflict Handling

---

## What Was Intentionally Excluded

* Authentication
* Offline Caching
* Push Notifications
* Real-Time Synchronization

These were excluded to prioritize the core booking workflow.

---

## Future Improvements

* Authentication & Authorization
* Offline Support
* WebSocket Updates
* Push Notifications
* Dark Mode
* Booking Filters

---

## AI Usage Note

AI tools were used for architecture planning, API integration guidance, and implementation support.

All generated code was reviewed, tested, and modified manually before final submission.
