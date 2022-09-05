# data layer

Represents the data layer of the application. The Data module, which is a part of the outermost layer, is responsible for data retrieval. This can be in the form of API calls to a server and/or a local database. It also contains repository implementations.

> 資料層，負責存取 app 外的資料。

# domain layer

Domain Layer is the innermost part of the layers (no dependencies with other layers) and it contains Entities, Use Cases & Repository Interfaces. The domain should only be concerned with the business logic of the application, not with the implementation details.

> 領域，包含「問題」以及「解決方案」

# Presentation layer

This is the presentation layer of the application, it is the most framework-dependent layer, as it contains the UI and the event handlers of the UI.

> 畫面呈現層
