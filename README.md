$ rails new wildlife_tracker -d postgresql -T
$ cd myapp
$ rails db:create
$ bundle add rspec-rails
$ rails generate rspec:install
$ rails server



#The API Stories
#The Forest Service is considering a proposal to place in conservancy a forest of virgin Douglas fir just outside of Portland, Oregon. Before they give the go-ahead, they need to do an environmental impact study. They've asked you to build an app so that the rangers can use to report wildlife sightings.

#1) Story: As the consumer of the API I can create an animal and save it in the database. An animal has the following information: common name, latin name, kingdom (mammal, insect, etc.).


$ rails generate resource Animal common_name:string latin_name:string kingdom:string

#to see routes included in resources :animals
$ rails routes
$ rails db:migrate

#2) Story: As the consumer of the API I can list all the animals in a database.
#Hint: Make a few animals using Rails Console

$ rails c
Animal.create common_name:'Dog', latin_name:'Canis familiaris', kingdom:'Animalia'
Animal.create common_name:'Cat', latin_name:'Felis catus', kingdom:'Animalia'
Animal.create common_name:'Canary', latin_name:'Crithagra flaviventris', kingdom:'Animalia'


#3) Story: As the consumer of the API I can update an animal in the database.

update method working!

{
        "animal":{
             "common_name": "Bird",
             "latin_name": "Pappagallo frosty",
             "kingdom": "Animalia"
        }
}

#4) Story: As the consumer of the API I can destroy a animal in the database.

DELETE localhost:3000/animals/4  Send (done)

# Amanda Code review:

#5) Story: As the consumer of the API I can create a sighting of an animal with date (use the datetime datatype), latitude and longitude.
#Hint: An animal has_many sightings. (rails g resource Sighting animal_id:integer ...)

$ rails generate resource Sighting animal_id:integer date:datetime latitude:string longitude:string

Models updated with the lines below:

has_many :sightings
belongs_to :animal


$ rails c

lea = Animal.first

Sighting.create animal_id:integer date:datetime latitude:string longitude:string

lea.sightings.create date:'2016-05-01 23:12:00', latitude:'Texas', longitude:'Equator'

Additional sighthings created using Postman to verify that the animal_id is working:

[
    {
        "id": 3,
        "animal_id": 2,
        "date": "2021-01-01T23:12:00.000Z",
        "latitude": "Capperosa",
        "longitude": "Alibut",
        "created_at": "2020-12-30T04:10:40.680Z",
        "updated_at": "2020-12-30T04:10:40.680Z"
    },
    {
        "id": 4,
        "animal_id": 2,
        "date": "2001-01-01T23:12:00.000Z",
        "latitude": "Macista",
        "longitude": "Alibut",
        "created_at": "2020-12-30T04:11:08.285Z",
        "updated_at": "2020-12-30T04:11:08.285Z"
    },
    {
        "id": 5,
        "animal_id": 2,
        "date": "2001-01-01T15:12:00.000Z",
        "latitude": "Macista",
        "longitude": "Fruskiat",
        "created_at": "2020-12-30T04:11:26.088Z",
        "updated_at": "2020-12-30T04:11:26.088Z"
    },
    {
        "id": 1,
        "animal_id": 1,
        "date": "2021-01-01T23:12:00.000Z",
        "latitude": "Meridionale",
        "longitude": "Equator",
        "created_at": "2020-12-30T03:40:59.582Z",
        "updated_at": "2021-01-02T02:15:31.619Z"
    },
    {
        "id": 6,
        "animal_id": 1,
        "date": "2016-05-01T23:12:00.000Z",
        "latitude": "Texas",
        "longitude": "Equator",
        "created_at": "2021-01-02T02:16:46.161Z",
        "updated_at": "2021-01-02T02:16:46.161Z"
    },
    {
        "id": 7,
        "animal_id": 1,
        "date": "2018-12-01T23:12:00.000Z",
        "latitude": "Texas",
        "longitude": "Equator",
        "created_at": "2021-01-02T02:17:10.633Z",
        "updated_at": "2021-01-02T02:17:10.633Z"
    },
    {
        "id": 8,
        "animal_id": 1,
        "date": "1998-12-01T23:12:00.000Z",
        "latitude": "Texas",
        "longitude": "Equator",
        "created_at": "2021-01-02T02:18:25.869Z",
        "updated_at": "2021-01-02T02:18:25.869Z"
    },
    {
        "id": 9,
        "animal_id": 1,
        "date": "1995-12-01T23:12:00.000Z",
        "latitude": "Texas",
        "longitude": "Equator",
        "created_at": "2021-01-02T02:18:38.109Z",
        "updated_at": "2021-01-02T02:18:38.109Z"
    },
    {
        "id": 10,
        "animal_id": 1,
        "date": "1991-12-01T23:12:00.000Z",
        "latitude": "Texas",
        "longitude": "Equator",
        "created_at": "2021-01-02T02:19:05.339Z",
        "updated_at": "2021-01-02T02:19:05.339Z"
    },
    {
        "id": 11,
        "animal_id": 1,
        "date": "1991-12-01T23:12:00.000Z",
        "latitude": "California",
        "longitude": "Equator",
        "created_at": "2021-01-02T02:19:14.739Z",
        "updated_at": "2021-01-02T02:19:14.739Z"
    },
    {
        "id": 12,
        "animal_id": 1,
        "date": "1991-12-17T23:12:00.000Z",
        "latitude": "California",
        "longitude": "Equator",
        "created_at": "2021-01-02T02:19:36.394Z",
        "updated_at": "2021-01-02T02:19:36.394Z"
    },
    {
        "id": 13,
        "animal_id": 1,
        "date": "1991-12-17T23:12:00.000Z",
        "latitude": "Baja California",
        "longitude": "Equator",
        "created_at": "2021-01-02T02:19:56.690Z",
        "updated_at": "2021-01-02T02:19:56.690Z"
    }
]


#6) Story: As the consumer of the API I can update an animal sighting in the database.

  def update
          sighting = Sighting.find(params[:id])
          sighting.update(sighting_params)
          if sighting.valid?
            render json: sighting
          else
            render json: sighting.errors
          end
      end

PATCH localhost:3000/sightings/1

{
        "sighting":{
        "date": "2021-01-01T23:12:00.000Z",
        "latitude": "California",
        "longitude": "Equator"
        }

}



#7) Story: As the consumer of the API I can destroy an animal sighting in the database.

delete method working added, ID2 not present



#8) Story: As the consumer of the API, when I view a specific animal, I can also see a list sightings of that animal.

  def show
      animal = Animal.find_by(id: params[:id]).sightings
      render json: animal
    end




#9)Story: As the consumer of the API, I can run a report to list all sightings during a given time period.


#Controller updated: 

class SightingsController < ApplicationController
  def index
    sightings = Sighting.where(start_date: params[:start_date]..params[:end_date])
    render json: sightings
  end
end


#Strong parameters added: 

 def sighting_params
          params.require(:sighting).permit(:datetime, :latitude, :longitude, :start_date , :end_date )
      end


Postman request 

GET localhost:3000/sightings/1990-01-01/1999-01-01

Comments:

I have been trying to add different lines of code to make story 9 works with no success, there's probably several issues in my code that I'm not catching so I'm currently trying to obtain the same results through the rails console, I have been looking at the documentation and the syntax should be:

pp sightings = Sighting.where(start_date: :start_date , :end_date)

but it's not working, 

