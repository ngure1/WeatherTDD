# weather_tdd

A simple weather app that utilizes the clean architecture, test driven development approach.

## Notes
Thinking generally about any feature in an application, it's evident that the foundation of every application is the data needed to style and display it beautifully on the screen.

The data must be in the correct format to pass as properties to the respective widgets. For this reason, we introduce something called an entity in the clean architecture.

**What is an entity?** - An entity in the clean architecture represents the core business model of the application. It contains the fundamental data and logic that is central to the business rules of the app, independent of how the data is displayed or formatted for the UI.

However, an entity cannot work on its own. For an entity to exist, a user must trigger an action that would cause the entity to be manipulated. This action is represented as a use case.

**What is a use case?** -
A use case in clean architecture represents a specific action or operation related to the business logic. It defines how the application interacts with entities and repositories, encapsulating the logic necessary to fulfill a particular user action (e.g., fetching current weather data).


1. ### Folder structure
- #### The domain layer
The domain layer is the core of the application. It contains the business logic and defines the fundamental concepts of the application. 

**NB:** This layer is independent of any external frameworks or libraries.

1. ##### Entities:

**Located in:** `/lib/domain/$feature/entities`

**Purpose:** Define the core data structures of the application.

2. ##### Use Cases:

**Located in:** `/lib/domain/$feature/usecases`

**Purpose:** Contain the business logic and define how the application will interact with the entities.


3. ##### Repositories:

**Located in:** `/lib/domain/$feature/repositories`

**Purpose:** Define abstract classes that outline how data will be fetched and stored.

2. ### TDD workflow


### tutorial
[Flutter TDD and clean architecture](https://www.youtube.com/watch?v=g2Mup12MccU&t=201s)
