module AddressHelper
  def address(f, container = :div)
    address = f.object.build_address unless f.object.address
    html = ""
    f.fields_for :address do |a|    
    html += content_tag container, a.label(:street) + a.text_field(:street), :class => 'field'
    html += content_tag container, a.label(:town_or_city) + a.text_field(:town_or_city), :class => 'field'
    html += content_tag container, a.label(:postcode) + a.text_field(:postcode), :class => 'field'
    html += content_tag container, a.label(:additional) + a.text_field(:additional), :class => 'field'
    end
    html.html_safe             
  end
end
