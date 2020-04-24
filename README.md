# Oyster-Card

```
                 _-====-__-======-__-========-_____-============-__
               _(                                                 _)
            OO(                                                     )_
           0  (_                                                   _)
         o0     (_                                                _)
        o         '=-___-===-_____-========-___________-===-----='
      .o                                _________
     . ______          ______________  |         |      _____
   _()_||__|| ________ |            |  |_________|   __||___||__
  (LDN 2020| |      | |            | __Y______00_| |_         _|
 /-OO----OO""="OO--OO"="OO--------OO"="OO-------OO"="OO-------OO"=P
#####################################################################

```
##### [*OVERVIEW*](#Overview) | [*HOW TO USE*](#How-to-use) | [*SCOPE*](#scope) | [*USER REQUIREMENTS*](#User-Requirements )
___

## Overview

Pairing challenge at Makers Academy to build a command line application that emulates the functionality of an oyster-card. This application was built using specific user requirements with Ruby and implements a TDD approach whilst covering multiple edge cases.

A user is able to create a new oyster-card, and initiate stations with zones to travel between. Before a user can travel, they must top up their new oyster first. A user can then touch in and out of stations. When a journey is completed the user is charged accordingly by the zones they have travelled between and the journey is stored in a log for the user to view.  

## How to use

Oyster-card runs directly from the command line, install either by cloning or forking the repository. Change directory to the root folder and run bundle install.

```
$ bundle install
```
Open irb, and enter the following to run the application.

```
$ require './lib/dockingstation.rb'
 => true
```
To run the tests for the application, run RSpec.

```
$ rspec
```

## Scope

**Oyster-card** (*Oystercard.new*)
- Oyster can be topped up to the maximum value
- Oyster can be used to touch in and out of stations.
- Can not touch in without having a minimum balance.  
- Calculates the fare for a journey taken.
- Charges a fixed penalty fee for incomplete journeys

**Station** (*Station.new("kings_cross", 2)*)
- A new station must be created with a name and a zone.

**Journey**
- Stores a hash with the entry station(touch in) and exit station(touch out).

**JourneyLog**
- Creates a new Journey instance.
- Logs the taken journey.

## User Requirements

```
In order to use public transport
As a customer
I want money on my card
```
```
In order to keep using public transport
As a customer
I want to add money to my card
```
```
In order to protect my money
As a customer
I don't want to put too much money on my card
```
```
In order to pay for my journey
As a customer
I need my fare deducted from my card
```
```
In order to get through the barriers
As a customer
I need to touch in and out
```
```
In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey
```
```
In order to pay for my journey
As a customer
I need to pay for my journey when it's complete
```
```
In order to pay for my journey
As a customer
I need to know where I've travelled from
```
```
In order to know where I have been
As a customer
I want to see to all my previous trips
```
```
In order to know how far I have travelled
As a customer
I want to know what zone a station is in
```
```
In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out
```
```
In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```
--------
