# Note App - Flutter ObjectBox

| **Name**               | **NRP**    |
| ---------------------- | ---------- |
| Reynaldi Neo Ramadhani | 5025221265 |

A simple note-taking app built with Flutter and **ObjectBox**. This project demonstrates how to integrate ObjectBox as a local database solution, using repository patterns and clean architecture.

# Building Step

## Init Flutter Project

```
flutter create note_app_flutter_objectbox
```

## Add Dependencies

Add object box dependencied based on [ObjectBox Documentation](https://docs.objectbox.io/getting-started#add-objectbox-to-your-project)

```bash
flutter pub add objectbox
flutter pub add objectbox_flutter_libs
flutter pub add path_provider
flutter pub add --dev objectbox_generator
flutter pub add --dev build_runner
```

## Make Entity Classes

Define our data model by creating a class with an ID property. Its also called as entity and will represent our model or table in relational database. More detail in [ObjectBox Documentation](https://docs.objectbox.io/getting-started#define-entity-classes)

In this project we will make the entity in [`lib/models/note.dart`](lib/models/note.dart)

## Generate ObjectBox code

Next, we generate some binding code based on the model defined in the previous step.

```bash
dart run build_runner build
```

ObjectBox generator will look for all `@Entity` annotations in your lib folder and create:

-   a single database definition [`lib/objectbox-model.json`](lib/objectbox-model.json) and
-   supporting code in [`lib/objectbox.g.dart`](lib/objectbox.g.dart).

## Create ObjectBox Store

Store is the entry point for using ObjectBox. Store is the direct interface to the database and manage Boxes. Typically, you want to only have a single Store (single database) and keep it open while your app is running, not closing it explicitly. More detail in [ObjectBox Documentation](https://docs.objectbox.io/getting-started#create-a-store)

In this project we will make it in [`lib/data/objectbox_store.dart`](lib/data/objectbox_store.dart)

## Create Repository File

In this project we will use repository pattern for separation of concern. This reposioty will act as a CRUD function to interact with the database. More detail in [ObjectBox Documentation](https://docs.objectbox.io/getting-started#basic-box-operations)

In this project the repository file is located in [`lib/data/note_repository.dart`](lib/data/note_repository.dart).

## Create UI

In this project the UI is stored in two folders: [`lib/pages`](lib/pages/notes_page.dart) and [`lib/widgets`](lib/widgets/note_tile.dart). The `pages` folder acts as the container for the current page, while the `widgets` folder contains reusable components that are called within the pages.
