# Gilim - Backend

Backend developed for Gilim, an Android application part of a university project that helps local music fans discover local musicians and follow their activities. The application has Tinder-like presentation cards for the user to swipe left or right. Each presentation card has the logo, name and genre of the artist, as well as one song users will hear when deciding in which direction to swap.

Some of the features supported by this backend are:

- Artists can create events on the platform and add achievements to them to attract more fans. 
- Artists can have several songs, and have a profile separate from their presentation card. Fans can discover artists and events, as well as follow them. 

It encapsulates logic like the artist recommendation algorithm and persistence management through an API.

<br>

## 1. Brief description

The backend can be ran as a regular [Rails application](http://guides.rubyonrails.org/getting_started.html). It has the following routes: <br><br>

Fans CRUD:
```
                         fans GET    /fans(.:format)                                              fans#index
                              POST   /fans(.:format)                                              fans#create
                      new_fan GET    /fans/new(.:format)                                          fans#new
                     edit_fan GET    /fans/:email/edit(.:format)                                  fans#edit
                          fan GET    /fans/:email(.:format)                                       fans#show
                              PATCH  /fans/:email(.:format)                                       fans#update
                              PUT    /fans/:email(.:format)                                       fans#update
                              DELETE /fans/:email(.:format)                                       fans#destroy
```<br>

Artists CRUD:
```
                      artists GET    /artists(.:format)                                           artists#index
                              POST   /artists(.:format)                                           artists#create
                   new_artist GET    /artists/new(.:format)                                       artists#new
                  edit_artist GET    /artists/:email/edit(.:format)                               artists#edit
                       artist GET    /artists/:email(.:format)                                    artists#show
                              PATCH  /artists/:email(.:format)                                    artists#update
                              PUT    /artists/:email(.:format)                                    artists#update
                              DELETE /artists/:email(.:format)                                    artists#destroy
 ```
 <br>
Achievements CRUD:
```
                achievements  GET    /achievements(.:format)                                      achievements#index
                              POST   /achievements(.:format)                                      achievements#create
              new_achievement GET    /achievements/new(.:format)                                  achievements#new
             edit_achievement GET    /achievements/:id/edit(.:format)                             achievements#edit
                  achievement GET    /achievements/:id(.:format)                                  achievements#show
                              PATCH  /achievements/:id(.:format)                                  achievements#update
                              PUT    /achievements/:id(.:format)                                  achievements#update
                              DELETE /achievements/:id(.:format)                                  achievements#destroy
```<br>
Event CRUD:
```
                       events GET    /events(.:format)                                            events#index
                              POST   /events(.:format)                                            events#create
                    new_event GET    /events/new(.:format)                                        events#new
                   edit_event GET    /events/:id/edit(.:format)                                   events#edit
                        event GET    /events/:id(.:format)                                        events#show
                              PATCH  /events/:id(.:format)                                        events#update
                              PUT    /events/:id(.:format)                                        events#update
                              DELETE /events/:id(.:format)                                        events#destroy
                              
```<br>

Artist profiles CRUD. Every profile must be associated to exactly one artist:
```
              artist_profiles GET    /artist_profiles(.:format)                                   artist_profiles#index
                              POST   /artist_profiles(.:format)                                   artist_profiles#create
           new_artist_profile GET    /artist_profiles/new(.:format)                               artist_profiles#new
          edit_artist_profile GET    /artist_profiles/:id/edit(.:format)                          artist_profiles#edit
               artist_profile GET    /artist_profiles/:id(.:format)                               artist_profiles#show
                              PATCH  /artist_profiles/:id(.:format)                               artist_profiles#update
                              PUT    /artist_profiles/:id(.:format)                               artist_profiles#update
                              DELETE /artist_profiles/:id(.:format)                               artist_profiles#destroy
```      <br>                       
Songs CRUD. Songs are associated with at least one artist:
```
                              GET    /songs(.:format)                                             songs#index
                              POST   /songs(.:format)                                             songs#create
                              GET    /songs/new(.:format)                                         songs#new
                              GET    /songs/:id/edit(.:format)                                    songs#edit
                              GET    /songs/:id(.:format)                                         songs#show
                              PATCH  /songs/:id(.:format)                                         songs#update
                              PUT    /songs/:id(.:format)                                         songs#update
                              DELETE /songs/:id(.:format)                                         songs#destroy
``` <br>             
Retrieve achievements by event:
```
           event_achievements GET    /events/:event_id/achievements(.:format)                     achievements#index
                              POST   /events/:event_id/achievements(.:format)                     achievements#create
        new_event_achievement GET    /events/:event_id/achievements/new(.:format)                 achievements#new
       edit_event_achievement GET    /events/:event_id/achievements/:id/edit(.:format)            achievements#edit
            event_achievement GET    /events/:event_id/achievements/:id(.:format)                 achievements#show
                              PATCH  /events/:event_id/achievements/:id(.:format)                 achievements#update
                              PUT    /events/:event_id/achievements/:id(.:format)                 achievements#update
                              DELETE /events/:event_id/achievements/:id(.:format)                 achievements#destroy
```<br>
Presentation cards CRUD: 
```
           presentation_cards GET    /presentation_cards(.:format)                                presentation_cards#index
                              POST   /presentation_cards(.:format)                                presentation_cards#create
        new_presentation_card GET    /presentation_cards/new(.:format)                            presentation_cards#new
       edit_presentation_card GET    /presentation_cards/:id/edit(.:format)                       presentation_cards#edit
            presentation_card GET    /presentation_cards/:id(.:format)                            presentation_cards#show
                              PATCH  /presentation_cards/:id(.:format)                            presentation_cards#update
                              PUT    /presentation_cards/:id(.:format)                            presentation_cards#update
                              DELETE /presentation_cards/:id(.:format)                            presentation_cards#destroy
```<br>                              
Genres CRUD:
```
                       genres GET    /genres(.:format)                                            genres#index
                              POST   /genres(.:format)                                            genres#create
                    new_genre GET    /genres/new(.:format)                                        genres#new
                   edit_genre GET    /genres/:id/edit(.:format)                                   genres#edit
                        genre GET    /genres/:id(.:format)                                        genres#show
                              PATCH  /genres/:id(.:format)                                        genres#update
                              PUT    /genres/:id(.:format)                                        genres#update
                              DELETE /genres/:id(.:format)                                        genres#destroy
```<br>

Retrieve events by organizing artist:
```

                artist_events GET    /artists/:artist_email/events(.:format)                      events#index
                              POST   /artists/:artist_email/events(.:format)                      events#create
             new_artist_event GET    /artists/:artist_email/events/new(.:format)                  events#new
            edit_artist_event GET    /artists/:artist_email/events/:id/edit(.:format)             events#edit
                 artist_event GET    /artists/:artist_email/events/:id(.:format)                  events#show
                              PATCH  /artists/:artist_email/events/:id(.:format)                  events#update
                              PUT    /artists/:artist_email/events/:id(.:format)                  events#update
                              DELETE /artists/:artist_email/events/:id(.:format)                  events#destroy
```<br>

Retrieve artist profile by artist email:
```
       artist_artist_profiles GET    /artists/:artist_email/artist_profiles(.:format)             artist_profiles#index
                              POST   /artists/:artist_email/artist_profiles(.:format)             artist_profiles#create
    new_artist_artist_profile GET    /artists/:artist_email/artist_profiles/new(.:format)         artist_profiles#new
   edit_artist_artist_profile GET    /artists/:artist_email/artist_profiles/:id/edit(.:format)    artist_profiles#edit
        artist_artist_profile GET    /artists/:artist_email/artist_profiles/:id(.:format)         artist_profiles#show
                              PATCH  /artists/:artist_email/artist_profiles/:id(.:format)         artist_profiles#update
                              PUT    /artists/:artist_email/artist_profiles/:id(.:format)         artist_profiles#update
                              DELETE /artists/:artist_email/artist_profiles/:id(.:format)         artist_profiles#destroy
```<br>                        

Retrieve presentation card by artist email:
```
    artist_presentation_cards GET    /artists/:artist_email/presentation_cards(.:format)          presentation_cards#index
                              POST   /artists/:artist_email/presentation_cards(.:format)          presentation_cards#create
 new_artist_presentation_card GET    /artists/:artist_email/presentation_cards/new(.:format)      presentation_cards#new
edit_artist_presentation_card GET    /artists/:artist_email/presentation_cards/:id/edit(.:format) presentation_cards#edit
     artist_presentation_card GET    /artists/:artist_email/presentation_cards/:id(.:format)      presentation_cards#show
                              PATCH  /artists/:artist_email/presentation_cards/:id(.:format)      presentation_cards#update
                              PUT    /artists/:artist_email/presentation_cards/:id(.:format)      presentation_cards#update
                              DELETE /artists/:artist_email/presentation_cards/:id(.:format)      presentation_cards#destroy
```<br>                              

Retrieve songs by artist email:
```
                 artist_songs GET    /artists/:artist_email/songs(.:format)                       songs#index
                              POST   /artists/:artist_email/songs(.:format)                       songs#create
              new_artist_song GET    /artists/:artist_email/songs/new(.:format)                   songs#new
             edit_artist_song GET    /artists/:artist_email/songs/:id/edit(.:format)              songs#edit
                  artist_song GET    /artists/:artist_email/songs/:id(.:format)                   songs#show
                              PATCH  /artists/:artist_email/songs/:id(.:format)                   songs#update
                              PUT    /artists/:artist_email/songs/:id(.:format)                   songs#update
                              DELETE /artists/:artist_email/songs/:id(.:format)                   songs#destroy
```<br>
Register artist or event followal with the fan's email:
```
                              POST   /fans/:email/followevent(.:format)                           fans#followevent
                              POST   /fans/:email/followartist(.:format)                          fans#followartist
```<br>
Get recommended artists and events for fan with their email:
```
                              GET    /fans/:email/recommendedartists(.:format)                    fans#recommendedartists
                              GET    /fans/:email/recommendedevents(.:format)                     fans#recommendedevents
```<br>
<br>


## 2. Detailed description (in spanish)

The detailed description was written in spanish, as it was meant to be used by the native spanish team I developed Gilim with. It describes the expected input and the output of each of routes described above.

https://drive.google.com/file/d/0B2tibzXhXQB1YTd1Qk1ONlpoUlk/view?usp=sharing