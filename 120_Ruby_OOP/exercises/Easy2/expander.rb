class Expander
  # Define an attr_reader in order to acsess
  attr_reader :string
  def initialize(string)
    @string = string
  end

  def to_s
    # remove the self call
    expand(3)
  end

  private

  def expand(n)
    string * n
  end
end

expanded = Expander.new('xyz')
puts expanded
