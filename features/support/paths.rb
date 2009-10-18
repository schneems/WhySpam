module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #
  # step definition in webrat_steps.rb
  #
  
  
  def path_to(page_name)
    case page_name
    
    when /the homepage/
      '/'
  
    when /manage users/
      manage_path
  
    when /home/
      '/index'
      
    when /forms/
      new_form_path
      
    when /websites/
        websites_path
      
    when /slop_box/
      slop_box_path
    # Add more mappings here.
    # Here is a more fancy example:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
