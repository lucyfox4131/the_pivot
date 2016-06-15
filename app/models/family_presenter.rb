class FamilyPresenter < BasePresenter
  presents :family

  def retired_or_active_header
    # if family.retired?
    #   template.content_tag(:h4, "Family Arrived", class: "col-sm-12 details")
    # else
    #   template.content_tag(:h4, "Arrival Date: #{template.format_date family.arrival_date}" + template.content_tag(:h4, "Donate by: #{template.format_date family.donation_deadline}", class: "col-sm-6 details").html_safe, class: "col-sm-6 details")
    #
    # end
  end

  def retired_or_active_progress_bar
    if !family.retired?
      template.content_tag(:h4, "Welcome them to the United States.  Donate these items to help them set up their new home.") +
      template.content_tag(:h5, "This family needs a total of #{ template.currency family.value_of_supplies_needed} in donations.")
    else
      template.content_tag(:h4, "Thank you for welcoming them to the United States.") +
      template.content_tag(:h5, "This family received #{ template.currency family.value_of_supplies_purchased} in donations.")
    end

  end

  def retired_donation_cart
    # if family_retired?



      # <h4>This family was welcomed with the following donations:</h4>
      #   <table class="table">
      #     <tr>
      #       <th>Donated Item</th>
      #       <th>Donated Quantity</th>
      #       <th>Donation Date</th>
      #     </tr>
      #     <% @family.donations_received.map do |donation_item| %>
      #       <tr>
      #         <td><%= donation_item.name %></td>
      #         <td><%= donation_item.quantity %></td>
      #         <td><%= format_date donation_item.created_at %></td>
      #       </tr>
      #     <% end %>
      #   </table>
   end




    #
    # template.content_tag(:h4, "Arrival Date: #{template.format_date family.arrival_date}    Donate by: #{template.format_date family.donation_deadline}", class: "col-sm-12 details")
    #
    # template.content_tag(:h4, "Arrival Date: #{template.format_date family.arrival_date}")
    # template.content_tag(:h4, "Donate by: #{template.format_date family.donation_deadline}")

#



end
