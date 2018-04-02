class PrivateData
  attr_writer :ssn

  def initialize(ssn)
    @ssn = ssn
  end

  def ssn
    'xxx-xx-' + @ssn.split('-').last
  end

  def print_data
    "Your filed SSN: #{ssn}"
  end
end
