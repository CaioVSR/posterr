# posterr

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# challenge

# Strider Mobile assessment - 2.1

# Briefing

View test instructions, submission instructions, and evaluation criteria in the briefing:

[Strider Technical Assessment Briefing ](https://www.notion.so/Strider-Technical-Assessment-Briefing-ecf69c8281e34c14ab1d29a46eeb5cdf)

# Project Description

## Overview

The Project Manager you work with wants to build a new product, a new social media application called Posterr. Posterr is very similar to Twitter, but it has far fewer features.

Posterr only has two screens, the home (default), and the user profile screen, which are described below. Other data and actions are also detailed below.

### Screens

**Home**

- The home, by default, will show a feed of all posts (including reposts and quote posts) from all users
- New posts can be written from this screen

**User profile**

- Shows data about the user:
    - Username
    - Date joined Posterr, formatted as such: "March 25, 2021"
    - Count of number of posts the user has made per type (e.g posts: 1, reposts: 3, quote-posts: 1)
- Shows a feed of all posts the user has made (including reposts and quote posts)
- New posts can be written from this screen: for the sake of this assessment, when writing a post from the profile screen, the profile's user should be set as the author of the new content.

### More Details

**Users**

- Only alphanumeric characters can be used for username
- Maximum 14 characters for username
- Do not build authentication
- Do not build user creation/editing/deletion, users should be read-only (please define a list of at least 4 users)
- To make your application function, you should hard-code the default user, setting it to one of the predefined options

**Posts**

Posts are the equivalent of Twitter's tweets. They are text-only, user-generated content. Users can write original posts and interact with other users' posts by reposting or quote-posting. For this project, you should implement all three — original posts, reposts, and quote-posting

- Users are not allowed to post more than 5 posts in one day (including reposts and quote posts)
- Posts can have a maximum of 777 characters
- When writing a post, a user should see how many characters she/he has left
- Users cannot update or delete their posts
- Reposting: Users can repost other users' posts (like Twitter Retweet)
- Quote-post: Users can repost other user's posts and leave a comment along with it (like Twitter Quote Tweet)

## Phase 1, coding

Estimated time: 5 hours

- Build out a mobile app using a framework of your choice that covers the features described in this assessment
- This app should be built with a RESTful API in mind but it must work entirely with local data for the initial version, allowing evaluators to fully test and demo it.
- Do not implement additional features beyond what is explained in the overview.
- Do not build the backend / API endpoints
- UX and UI should be reasonably good but they're not the main focus of the challenge, you're free to use any app as a visual reference.

## Phase 2, demo

Estimated time: 15 minutes

To demo software is always a risky move so your product manager asked you to record the app behavior (e.g using [loom](https://www.loom.com/screen-recorder)) to show it in action to some potential investors during a pitch presentation. 
The record should show off **all the app features** and be attached to your project zip file.

- The video should have a max of 3 minutes
- Speaking and showing up yourself in the video is optional
- Make sure you show the features in an organized way

## Phase 3, self-critique & scaling

Estimated time: 30 minutes

In any project, it is always a challenge to get the code perfectly how you'd want it. Here is what you need to do for this section:

**Please provide as much detail as possible!**

- Reflect on this project, and write what you would improve if you had more time.
- Assuming you've got multiple crash reports and reviews saying the app is not working properly and is slow for specific models, what would be your strategy to tackle the problem? (assuming the app is supposed to work well for these models)
- Assuming your app has now thousands of users thus a lot of posts to show in the feed. What do you believe should be improved in this initial version and what strategies/proposals you could formulate for such a challenge?

This should be added as a section called "Critique" in the README.