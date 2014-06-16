##Boris Bikes

A [Makers Academy](https://github.com/makersacademy) Week Three assignment, set by [@shadchnev](https://github.com/shadchnev), to replicate the functionality of London's Boris Bikes initiative. The project's goal was introduce students to Object-Oriented Programming and Design.

###Specification:

Build a system in which **bikes** can be docked at a **docking station**. If bikes are broken they can be collected by a **van** and taken to a **garage** where they can be fixed. Once fixed, the van will return the bikes to the docking station.

###Technologies:
* Ruby
* Object-oriented programming
* Object-oriented design
* Test-driven-development with Rspec
* CRC (class-responsibility-collaboration) cards

###Demonstration:

The following is a demonstration in ````irb```` of the mock Boris Bikes system.

Dock bikes in the station:

````
station.dock(bike)
=> [#<Bike:0x007f968098a490 @broken=false>]
station.dock(broken_bike)
=> [#<Bike:0x007f968098a490 @broken=false>, #<Bike:0x007f96809525e0 @broken=true>]
station.available_bikes
=> [#<Bike:0x007f968098a490 @broken=false>]
````

Repair bikes at the garage:

````
van.collect_broken_bikes_from(station)
=> [#<Bike:0x007f96809525e0 @broken=true>]
garage.collect_broken_bikes_from(van)
=> [#<Bike:0x007f96809525e0 @broken=true>]
garage.fix_broken_bikes
=> [#<Bike:0x007f96809525e0 @broken=false>]
````

Return fixed bikes to the station:

````
van.collect_working_bikes_from(garage)
=> [#<Bike:0x007f96809525e0 @broken=false>]
van.deliver_working_bikes_to(station)
=> [#<Bike:0x007f96809525e0 @broken=false>]
station.available_bikes
=> [#<Bike:0x007f96809525e0 @broken=false>]
````

![alt text](https://raw.githubusercontent.com/sarahseewhy/boris-bikes/master/borisbikes.png "Boris Bikes")