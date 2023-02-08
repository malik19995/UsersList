# Users List Challenge

## Data Layer
_________

Contains the constants and configurations required for the project. 

Contains the models for the application. These are the entities as extracted from the requirement. 

- User - Single User Entity as received from the endpoint. 
- ApiResponse - Single API response per call. 

## Domain Layer
_________

###  API

      Contains the OWWN Api Handler, configured using Retrofit. This allows us to generate the API Client with all the Endpoints configured. 

### Providers
   Riverpod Providers for the application 

   - Auth Provider
   
      Handles the interfaces for Authentication and holds the tokens in state. 
   - Users Provider 

      Handles the fetching and caching of the User lists. 
      
      Stores API Response models in state against pageNumbers. On repeat query, data is returned from the state and API call is not made. 

   - Repository Provider

      Provides a singleton instance of our OWWN Repository

   - Page Number Provider 
      
      Provides the pageNumber interface that can be mutated using the next page and previous page buttons.


### Repository 

   OWWN Repository that's extended to two implementations 
   
- ImplOWWNRepository : Repository with access to OWWNClient and this is responsible for making all the API calls.
- MockRepository : Mock Repository for testing purposes. 


## UI Layer
____
User Interface for the application. 

Pages: 
- Auth Page 
- Home Page

Sub-Sections: 
- Error Page
- Users Page

Widgets: 
- App List Tile
- App Text Button
- App Text
- App Text Field
- Utils - Utility / Constant widgets used accross the app. 



   