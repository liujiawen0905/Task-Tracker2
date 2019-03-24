# TaskTracker

## Design Choices

In general, the website contains three main pages including Home, Tasks and Users page.

Home Page:

  * There are three separate page button which directs to each main page
  * There is a green registration button which directs to users page
  * New user is able to register when no account has been logged in

Users Page:

  * When registering a new user, a manager of this usesr must be selected from one of existing users 
  * A user can only be managed by himself/herself
  * Detailed relationship corresponds to a user are listed in the 'Show' page of a user
  

Tasks Page:

  * After a user logged in, the user will be able to see two tables which demonstrate tasks belonged to this user and all tasks created by all users
  * a user could be able to manage his/her own task when logged in
  * all management buttons will be hidden (Edit, Delete, Start, End) once the user logged out, but all information about tasks could be accessed via "Show" button
  * Each time blocks are listed in the 'Show' page of corresponding task


To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
