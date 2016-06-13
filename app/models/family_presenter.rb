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


    #
    # template.content_tag(:h4, "Arrival Date: #{template.format_date family.arrival_date}    Donate by: #{template.format_date family.donation_deadline}", class: "col-sm-12 details")
    #
    # template.content_tag(:h4, "Arrival Date: #{template.format_date family.arrival_date}")
    # template.content_tag(:h4, "Donate by: #{template.format_date family.donation_deadline}")

#



end
