# posterr

### Getting started

- Before running this app, make sure that you have the Flutter version 3.0.5 installed.
- First run the command ```flutter pub get```.
- Then re-run you code editor analyzer.
- Last run the command ```flutter pub run build_runner build --delete-conflicting-outputs```.

### What to expect

On the first run the app will create 5 random users, every time you reload the app you will be provided another random user (keep in mind that you might get the same one).

You can quote or repost the original post from another repost.

You can use the "pull to refresh" method. Since this is a dummy app it will only update the hour information from the posts.

The architecture used in this project was the "Flutter Modular Architecture" developed by the Flutterando team. It is a kind of MVC but a little bit more refined.

Sit back and enjoy =)!

### Critique
- The thing that bothered me the most when I was writing this code  was writing it without at least the units tests. If I had more time, that would be my main concern.
- If I was developing an production app and thinking about scaling, I would definitely go with the clean architecture and micro-front-end approach.
- Another thing that I would do if I had more time was adding the proper error message for the user.
- Again, If this was a production app, the feed list would be paginated and preferably using some streamed data. All the methods for filtering and sorting would already been provided from the back-end service therefore removing the necessity of the data manipulation on the front-end side.
- If i got multiple crash reports about some specifics model I would resort to the Flutter inspector to check out how the app is performing, how my app is dealing with the memory and what is happening on the specif device during the debug. Assuming that the app has integration and ent-to-end tests, running these tests ont the Amazon device farm with some real devices would be another option to prevent these type of scenario.

### Demo
[loom](https://www.loom.com/share/2fe23803f49a46a0b7ef72f1e3178256)) to show it in action to 