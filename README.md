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
- **Story:** Displays current tech for the user in manner that shows them what is avalible, what to purchase, and background information.
- **Market:** Any individual interested or shop for tech
- **Habit:** This app can be used often or unoften daily based on the user's personal preference and involvement in tech.
- **Scope:** Inital focus on displaying tech items that are categorized respectively, then to adding articles and reviews into a feed. Large potential for being truly a one stop shop for tech. 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can sign in (and logout) of their own created Orion account
* Multiple views for different tech categories
* Pull to refresh on different views
* Filtering based on brands in certain views
* Prices for products
* Collection View of Most Used Tech listed in categories

**Optional Nice-to-have Stories**

* Push notifications on new releases
* Add articles on homepage
* Users get a curated feed of brands they like based on favorites and bookmarks
* 3rd Party Articles on popular brands
* Links to reviews of certain brands
* Sign in with Google OAuth
* Favoriting Products
* Search by brand and specific filtering
* Implemented other store API's
* Link to websites to buy


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
| price           | integer         | price of product  |
| bookmarked      | bool         | refs if a product is bookmarked or not|

### Networking
List of network requests by screen
- Home Feed Screen
  * (Read/GET) All trending products
  * (Read/GET) All recommended products (based on implementation of stretch likes)
- Details View
  * (Read/GET) Grabs photo
  * (Read/GET) Grabs description
  * (Read/GET) Grabs price
  * (Create/BOOKMARK) Creates a bookmark onto product
  * (Delete) Deletes product bookmark
  * (Read/GET) Grabs release date
- Bookmarked View
  * (Read/GET) Query all products where user has bookmarked item

**[OPTIONAL: Existing API Endpoints]**

**BestBuy:** https://developer.bestbuy.com/apis
