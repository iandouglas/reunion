require 'erb'
require './lib/reunion'
require './lib/activity'

reunion = Reunion.new('here')

activity = Activity.new('hiking', 20)
activity.add_participiant('ian', 10)
activity.add_participiant('brian', 8)
reunion.add_activity(activity)

activity = Activity.new('deep sea fishing', 30)
activity.add_participiant('ian', 14)
activity.add_participiant('brian', 18)
reunion.add_activity(activity)

fair_share = reunion.divvy

e = ERB.new("<html><body>
<% fair_share.each_pair do |name, money| %>
  <p>

  <% if money < 0 %>
    <%= name %> is owed $<%= money * -1 %>
  <% elsif money > 0 %>
    <%= name %> owes $<%= money %>
  <% else %>
    <%= name %> owes nothing
  <% end %>

  </p>
  
  <% end %></body></html>
    ")
puts e.result
