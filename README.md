Orion Official READ.ME
===

# Orion

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Orion is an application built to be an one stop shop for all your tech shoppings.

### App Evaluation
- **Category:** Informational/Shopping
- **Mobile:** Mobile first experience
- **Story:** 
  * Jack, an avid audiophile, checks Orion to see what headphones are out and decides when to buy a new pair
  * Jill uses Orion as an introductory into the smartwatch ecosystem (deciding which smartwatch is the best fit for her) to aid her fitness endeavors
  * Jason being the tech savy person he is uses Orion to stay up to date on what tech items are out on the market
- **Market:** People who use tech daily or are interested in buying tech items, young or old
- **Habit:** Could be used daily based on personal preference
- **Scope:** Inital focus on displaying tech items that are categorized respectively

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can sign in (and logout) of their own created Orion account
* Multiple views for different tech categories
* Pull to refresh on different views
* Filtering based on brands in certain views
* Link to websites to buy
* Collection View of Most Used Tech listed in categories
* ...

**Optional Nice-to-have Stories**

* Push notifications on new releases
* Users get a curated feed of brands they like based on favorites and bookmarks
* 3rd Party Articles on popular brands
* Links to reviews of certain brands
* Sign in with Google OAuth
* Search by brand and specific filtering
* Implemented other store API's

### 2. Screen Archetypes

* Login Screen
   * User can Login
* Registration Screen
   * User can register account
* Home Feed
    * Displays curated feed for User(including widgest of tech information)
* News Feed
    * Displays list of generic tech objects
    * When tapped can be lead to a collection view of releated tech objects
    * When tapped can be lead directly to related details view of tech item
* Bookmark Feed
    * Displays all user bookmarked tech objects in table view (stretch could add a filter)
    * When tapped on bookmarked tech object can be lead directly to related details view of tech item
* Search Feed
    * User can search for any tech object in database and is pulled up in search options (stretch could add a filter)
    * When tapped on searched item tech object can be lead directly to related details view of tech item
* Details View
    * Displays image of tech item as well as description and related artilces/videos about tech item
    * Has the ability to be bookmarked in order to add to bookmarked tab
* Profile Picture/Settings
    * Shows account pfp (and can add one if needed)
    * User can check account details, notification settings, and other general settings (including logout)

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home Feed
* News Feed
* Bookmarked
* Search Tab

**Flow Navigation** (Screen to Screen)

* Login Screen
   * Home
   * Registration Screen
* Registration Screen
   * Home
* News Feed
   * Product Collection View
   * =>Detail Product View
* Bookmarked
    * Detail Product View
* Search Results
    * Detail Product View

## Wireframes
<img src="https://github.com/myles-block/ProjectOrion/blob/main/Orion%20Wire-Frame.png" width=1000>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 

### Models
Product
| Property     | Type      | Description     |
| ------------- | ------------- | -------- |
| type          | string         | type of tech of product  |
| name           | string         | product name  |
| brand           | string         | brand of technology  |
| description     | string         | product description  |
| brand           | string         | brand of technology  |
| release date    | date         | when the item was relead |
| image           | URL         | image of product  |

### Networking
- API used
  * BestBuy: https://developer.bestbuy.com/apis
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
