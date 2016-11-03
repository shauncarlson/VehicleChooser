class CustomerProfile

  def initialize
    @preferences = Hash.new()
  end

  def set_preference(preference, value)
    @preferences[preference] = value
  end

  def get_preference(preference)
    @preferences[preference]
  end

  def get_preferences
    @preferences
  end
end