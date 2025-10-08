//
//  README.md
//  Activity5_API Challenge
//
//  Created by Alumno on 06/10/25.
//

# Rick & Morty API Explorer

This is a SwiftUI application for iOS that demonstrates how to build a multi-screen app that fetches, parses, and displays data from the public Rick and Morty API. It showcases a three-level navigation hierarchy: a main character list, a character detail screen, and a location detail screen.

## App Navigation Flow

[Character List] → `Tap Character` → [Character Detail] → `Tap Origin` → [Location Detail]

---

## Features

* Browse a list of characters from the Rick and Morty universe.
* View detailed information for each character, including their status, species, and origin.
* Tap on a character's origin to navigate to a third screen with details about that location (type, dimension, etc.).
* Structured with the **MVVM (Model-View-ViewModel)** architectural pattern.
* Robust error handling for network failures and a user-friendly loading state.
* Built with modern SwiftUI and Swift Concurrency (`async/await`).

---

## API Endpoints Used

* **Characters:** `https://rickandmortyapi.com/api/character`
* **Locations:** Dynamically loaded from URLs provided by the character endpoint (e.g., `https://rickandmortyapi.com/api/location/{id}`)

---

## How to Run the App

1.  Clone this repository.
2.  Open the `.xcodeproj` file in **Xcode 26**.
3.  Select an iOS simulator or a physical device running **iOS 26** or later.
4.  Press the "Run" button (or `Cmd+R`).

---

## Technical Details

-   **Language:** Swift
-   **UI Framework:** SwiftUI
-   **Architecture:** MVVM (Model-View-ViewModel)
-   **Concurrency:** `async/await`
-   **Dependencies:** None (uses native iOS frameworks)
