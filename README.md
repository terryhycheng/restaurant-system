# Makers Week 1-2 : Solo Project - Restautrant System

## Overview

This is a solo project to test my golden square skills overall, including TTD by using `RSpec`, OOP by `Ruby` and mocking by `double` from `RSpec`. Only 4 user stories were given, and I had to design a system from scratch to cater for their needs.

- [Makers Week 1-2 : Solo Project - Restautrant System](#makers-week-1-2--solo-project---restautrant-system)
  - [Overview](#overview)
  - [User Stories](#user-stories)
  - [System Design Diagram](#system-design-diagram)
  - [Class Interface Design](#class-interface-design)
    - [Class: Restaurant System](#class-restaurant-system)
    - [Class: Dish List](#class-dish-list)
    - [Class: Cart](#class-cart)
    - [Class: Messager](#class-messager)
    - [Class: Formatter](#class-formatter)
    - [Class: Dish](#class-dish)
  - [Getting Started](#getting-started)
    - [1. Set up `Twilio` API Key in `.env`](#1-set-up-twilio-api-key-in-env)
    - [2. Install Dependencies](#2-install-dependencies)
    - [3. Run tests](#3-run-tests)
  - [Dependencies](#dependencies)

## User Stories

> As a customer  
> So that I can check if I want to order something  
> I would like to see a list of dishes with prices.
>
> As a customer  
> So that I can order the meal I want  
> I would like to be able to select some number of several available dishes.
>
> As a customer  
> So that I can verify that my order is correct  
> I would like to see an itemised receipt with a grand total.

## System Design Diagram

The diagram shows the entire structure of this system.

![system_diagram](assets/sys_diagram_rev2.png)

## Class Interface Design

Here is the list of class interface designs for this restaurant system.

### Class: Restaurant System

```ruby
# file: lib/restaurant_system.rb

class RestaurantSystem
  def initialize
    # ...
  end

  def show_menu(menu, formatter) # instances of DishList & Formatter
    # prints out the menu of this restaurant
    # => void
  end

  def add_to_cart(id, menu, cart) # instances of DishList & Cart, id is a string
    # selects a dish and adds it to the cart
    # => void
  end

  def show_cart(cart, formatter) # instances of Cart & Formatter
    # prints out all items in the cart
    # => void
  end

  def confirm_order(phone_num, time, cart, messager) # string, DateTime, instances of Cart & Messager
    # confirms an order by sending a message to customer
    # => void
  end
end

```

### Class: Dish List

```ruby
# file: lib/dish_list.rb

class DishList
  def initialize
    # ...
  end

  def list
    # shows all available dishes in this list
    # => returns a list of Dish objects
  end

  def add(dish) # dish is an instance of Dish
    # adds a dish to this list
    # => void
  end

  def delete(id) # id is a string
    # removes a dish from this list
    # => void
  end

  def select(id) # id is a string
    # selects a dish from this list
    # => returns a Dish object
  end
end

```

### Class: Cart

```ruby
# file: lib/cart.rb

class Cart
  def initialize
    # ...
  end

  def list
    # shows all items in the cart
    # => returns a list of Dish objects
  end

  def add(dish)
    # adds a dish to the cart
    # => void
  end

  def price_total
    # calculates the grand amount of all items in the cart
    # => returns an integer
  end

  def remove_dish(id) # id is a string
    # removes a dish from the cart
    # => void
  end

  def clear
    # removes all items in the cart
    # => void
  end
end

```

### Class: Messager

```ruby
# file: lib/messager.rb

class Messager
  def initialize
    # ...
  end

  def send(list, time, phone_num) # array of Dish, datetime, string
    # sends a message to a mobile phone number
    # => returns a string of message body
  end
end

```

### Class: Formatter

```ruby
# file: lib/formatter.rb

class Formatter
  def initialize
    # ...
  end

  def format(dish) # dish is a instance of Dish
    # prints out the dish in a certain format
    # => string
  end
end

```

### Class: Dish

```ruby
# file: lib/dish.rb

class Dish
  def initialize(name, price) # name is a string, price is an integer
  end

  def id
    # returns the ID of this dish
    # => string
  end

  def name
    # returns the name of this dish
    # => string
  end

  def price
    # returns the price of this dish
    # => integer
  end

  def available?
    # returns if this dish is available
    # => boolean
  end

  def on_list
    # make this dish available on the list
    # => void
  end

  def off_list
    # make this dish unavailable on the list
    # => void
  end
end

```

## Getting Started

### 1. Set up `Twilio` API Key in `.env`

You must have an acoount in [Twilio](https://www.twilio.com/login) in order to run this project. Please create a `.env` inside this folder and replace the below temaplate with your own tokens.

```sh
TWILIO_ACCOUNT_SID="your_test_account_sid" # please visit www.twilio.com/console/settings
TWILIO_AUTH_TOKEN="your_auth_token"
TWILIO_MESSAGING_SERVICE_SID="your_messageing_service_sid"
TEST_PHONE_NUM="your_phone_num"
```

### 2. Install Dependencies

By running `bundle`, all dependencies you need for this project will be installed locally.

### 3. Run tests

You can start tests by running `rspec`

## Dependencies

- Ruby 3.0.0 ([website](https://www.ruby-lang.org/en/))
- RSpec 3.12 ([website](https://rspec.info/))
- twilio-ruby 5.74.1 ([Github](https://github.com/twilio/twilio-ruby))
- dotenv 2.8 ([Github](https://github.com/bkeepers/dotenv))
