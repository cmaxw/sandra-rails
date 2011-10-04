class <%= class_name %>
  include Sandra

  key_attribute :<%= model_key.split(":").first %>, :<%= model_key.split(":").last %>
<% columns.each do |column, type| %>
  column :<%= column %>, :<%= type %>
<% end %>
end
