# README

Unscr!pted is a marketplace app developed with Ruby On Rails, allowing for streetwear enthusiasts in Australia to connect and buy or sell clothing. 

INDEX

* Tech Stack

	Ruby on Rails 6.1.4
	Postgresql
	HTML 5
	SCSS
	Javascript
	

* Third Party Tech

	Github	
		https://github.com/snehabhamra/streetwear
	Trello
		https://trello.com/b/v4N2zKs5/marketplace-rails-app
	AWS S3 for active storage and image uploading
	Stripe payment gateway 
	Heroku for deployment
		https://dashboard.heroku.com/apps/streetwear-app

* Custom Gems

	gem 'bootstrap', '~> 4.5.2'
	gem 'sprockets-rails', :require => 'sprockets/railtie'
	gem 'jquery-rails'
	gem 'jquery-ui-rails'
	gem 'jquery-turbolinks'
	gem 'simple_form' 
	gem 'devise'
	gem 'rolify'
	gem "aws-sdk-s3", require: false
	gem 'stripe'
	gem "paperclip", "~> 6.0.0"

* Local Installation

	Download and fork the Github repository into your local system. 

	Bundle install 'gems'. 

	rails db: setup

	rails db:schema:load

	rails db:seed

	rails s to run localhost:3000 server

* Application Purpose

	Most streetwear and clothing marketplaces charge numerous additional fees just for consumers and sellers to host their items for sale or make a purchase. Unscr!pted was designed with mitigating these costs in mind, hence is an online Australian marketplace that is free to use, with the only costs involved being a small fee from Stripe payments for when their platform is utilised.

* Functionality and Features

	The main purpose of Unscr!pted is to allow for users to list products for sale or to purchase products listed by other users. When visiting the site the user is first greeted with a home page from which they can navigate to log in or register. Once logged in, users can go to the main 'index' page which allows them to view items for sale or to upload items of their own to be sold. Items that have been listed will display their name, description, price and category. A picture may also be uploaded to accompany the aforementioned product details. Users would also have the ability to view other items listed by the same user profile. Due to time crunch and errors I was unable to resolve I was unable to complete the app and have only submitted a partially worked app. 

* User Stories

	Users can log in and out or register to have an account.

	Users can upload products including an accompanying image.

	Users can view products to see further details.

	Users can purchase products after viewing them.

	Users can search for products.

*  Describe your project’s models in terms of the relationships (active record associations) they have with each other

	User: has_many associations with both image_urls and products

	Product: belongs to buyer, seller and user models all made optional as errors were otherwise being thrown. Also 		has_many_attached :image_urls

* Discuss the database relations to be implemented

	A user is required to log into the website itself, prior to which the database relations cannot be viewed or utilised. From there a user can create a product to be sold on the website for which they may also upload an image to be attached.There are several form fields to be inputted into for a product to be successfully listed, include title, price, description and category - if not inputted the product will not post. 
	
	Users can also browse and purchase products available to be sold by other users on the website. 

* Provide your database schema design

*Sitemap
[](sitemap.jpeg)

* Screenshots

Please see screenshots in docs folder

* Mockups

Please see mockups in ppt folder in the presentation file.

* Describe the way tasks are planned and tracked in your project

I handled the planning and tracking of this project very poorly from start to finish. Being stuck in development hell entailed a lot of tutorial watching originally, where I sent a lot of time watching and rewatching the videos on Canvas along with videos on youtube to get an idea of how to structure my app. I then attempted to remake several iterations of an app utilising the methods found online to no avail. From here I decided to simply go ahead and start my app process, which itself was marred and laden with errors that I was unable to debug on time for app submission. Initially I planned the tasks for my app around 

* Features

Unscr!pted allows users to create secure accounts through the 'Devise' gem.

Only once authorised and logged in can users view products or list their own products for sale. Had development gone according to plan users would only be available to edit their own products and nothing listed by others.

CRUD convention is integral and hence users would be able to create new products, edit old product listings or even delete any products they listed for sale.

Products could be purchased by Stripe payment conventions.

Users could utilise the navbar search function to look for particular items based on name or category. 

One photo per product may be uploaded. 



