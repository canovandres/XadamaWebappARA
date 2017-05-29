# XadamaWebapp
## Webapp Project: Project for Herramientas Avanzadas para el Diseño de Aplicaciones
### :sparkles:Xadama Amusement Park:sparkles:

* ##### Description:  
We’ve decided to create a Wep Application based on an amusement park. It will offer different festivals and events depending on the season of the year.

* ##### Public part:  

Actions | Description
:-------:|------------
Consult Rides | List of the rides with picture, descriptions, minimum height...
See Restaurants | List of restaurants, menus of each restaurant and location in the park
See Merchandising | List of the shops and products, with information of the location and prices
Consult Accommodation | List of hotels, type of board (full board, half board...) and prices for each one, and types of room (suite, double, individual, familiar)
See Shows | Type of events (concerts, shows, parades) and its dates and prices
Consult Themes | There will be different themes depending on popular festive days (Halloween, Christmas, Valentine’s day, carnival)  
See Zones | The park will be divided into different zones, each zone will represent a different continent (Oceania, America etc.)

* Public EN List: Ride, Menu, Product, Room, Show

* ##### Private part:  

Actions | Entities | Description
:-------:|:-------:|------------
Buy | Client, Ticket, Order, Promo | The user will be able to buy products and tickets
Book | Client, Booking | The user will be able to book rooms in the hotel
Reserve | Client, Reservation | The user will be able to reserve tables in restaurants
Consult timetable | Worker | The worker will be able to consult its timetable
Modify | | The administrator will be able to modify information about the webpage and the database  

* Private EN List: Ticket, Client, Worker, Booking, Order, Promo, Reservation

* ##### Possible improvements  
  - [ ] Social networks
  - [ ] Park map
  - [ ] Internationalization
  - [ ] Virtual assistant
  - [ ] Adapted to different screen sizes
  
 * ### Problems
We have had some problems when doing the Project:
  
- Most of them have been related with Github, some members of the group (Andrea and Mar) had to create a new branch and others (José     and Diego) had several problems but had continued with theirs. 

- We had problems with the data base and sql, at the oral presentation we weren’t able to show most of our pages because of sql           server, it wasn’t installed at the lab computer and we didn’t think about that. We also had several problems when connecting the db     with the different pages.

- Also, we have had some organitzation difficulties. We first divided the project, but with the pass of the weeks we had to change      the distribution, because we’ve been doing our respective parts, while those parts needed to be done. So, many pages have been          realized by two or more people or we haven’t done the same CAD/EN of our pages.

* ### Instructions

- Use sqlexpress (if not, change it in Web.Config)

- Execute it in Chrome

- Users:
  - Worker:  user: worker@dummy.com password:test
  - Client:  user: client@dummy.com password:test
  - Admin: user: admin: password: admin
  
 * ### Corrections
  - Reviews can be modified now and the colorof the review menu item changes properly
  - Rides height and speed changed from Convert.ToInt32() to float.Parse()
  - Client / Worker
    - Redirects to the register page in case someone tries to access the client or worker page while not being logged.
    - Redirects to the main page in case of being logged and trying to access to the register page
    - When changing the password the user can’t insert the current password
    - On page_load, !page.ispostback let account save changes work properly
  - Orders are saved in the table orderin of the database
  - Fixed product’s promos
  - Carousel link buttons
  - Products can be read, created, deleted,and updated now properly and promos can be read, deleted and updated properly now.
  - Editing in grid views from other pages of the grid view when there is pagination.
  - Products can’t be added to the shopping cart more than once.
  - Minor errors in Booking and Tickets. 
  - Promotions code usage errors fixed

  
* Participants:  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;José Aldeguer Sastre (@JoseAlde)  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mar Bonora Ortega (@marbonora)  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Andrés Cánovas Cutillas (@canovandres)  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Andrea Díaz Contra (@andreadiaaz)  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Diego García Cutillas (@diegacu)  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Alvaro Martín Resel (@alvmrs)  
