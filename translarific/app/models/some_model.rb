class SomeModel
  include Translatable
  
  # I'm doing a method version of code
  # because I'm lazy, and I've convinced
  # myself it will show the idea well 
  # enough that an ActiveRecord model with
  # a column named code will not also be
  # needed.
  #
  # But you may find yourself wanting to
  # do it because...
  #
  #   - It gives you the ability to use a
  #     different attribute, say self.tag.
  #   
  #   - It lets you programatically build
  #     your "code", i.e. "#{foo}_#{bar}".
  #
  def code
    # Just getting a random code so the
    # console statements I plan to copy
    # into the readme are less... boring?
    case [ 0, 1, 2, 3, 4 ].sample
    when 0
      "AN"
    when 1
      "BE"
    when 2
      "CY"
    when 3
      "IC"
    when 4
      "JE"
    else
      "PR"
    end
  end
  
  
end
