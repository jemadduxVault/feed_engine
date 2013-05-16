@RunLine.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Header extends Backbone.Model

  class Entities.HeaderCollection extends Backbone.Collection
    model: Entities.Header

  API =
    getHeaders: ->
      new Entities.HeaderCollection([
        {
          name: @getCurrentUser()
          url: '/#dashboard'
          id: "blah"
        }
        {
          name: "Logout"
          url: '/signout'
        }
      ])

    getCurrentUser: ->
      name = "test"
      $.get '/user',
        (userInfo) ->
          name = userInfo['name']
          $('#blah').html(name)
      name


  App.reqres.setHandler "header:entities", ->
    API.getHeaders()
