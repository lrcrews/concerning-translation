module Translatable
  extend ActiveSupport::Concern


  # Any model that includes this module will be
  # assumed to have an attribute or method "code".
  #
  # If it doesn't, that's fine, you'll just get
  # empty strings from this, no crashing.
  #
  # But if it does respond to :code, well then
  # you're in for a treat.  You have the ability
  # to search your I18n files for an internatio-
  # nalized version of your display text!  That's
  # ... cool, right?  A little bit?  It is.


  # Attempts to find a key in the I18n files that
  # matches (our defined path plus) :code.  
  #
  # If a translation is not found we will fall back  
  # to either the provided fall_back string or "".
  #
  # If a variable is provided it will be sent to the
  # yml.  For instance, you may have a sentence that
  # contains the user's name, the yml might look like:
  #
  #   welcome: "Welcome to %{user_name}'s World"
  #   party: "%{user_name}'s World, party time, excellent"
  #
  # And you may have another that contains a user's
  # psuedonym:
  #
  #   hello: "Howdy, %{screen_name}!"
  #
  # We'll instead replace all variables in our
  # values with %{variable} to allow for a standard
  # interface:
  #
  #   welcome: "Welcome to %{variable}'s World"
  #   party: "%{variable}'s World, party time, excellent"
  #   hello: "Howdy, %{variable}!"
  #   this_is_fine: "I'm not referencing it at all!"
  #
  def display_text(fall_back="", variable="")
    # Do we have an attribute or method called "code"?
    # (... and were we not passed nil values?)
  	return "" if !self.respond_to?(:code) || fall_back.nil? || variable.nil?
    # Let's get the string version, adding an "_" if
    # it starts with a number as I18n ymls and rails
    # seem to have a problem with keys starting with
    # numbers.
  	code = (self.code.to_s =~ /^[0-9].*/) ? "_#{self.code.to_s}" : self.code.to_s
    # Make it so.
    I18n.t("translatable.models.#{self.class.name.downcase}.#{code}", default: fall_back, variable: variable)
  end

end
