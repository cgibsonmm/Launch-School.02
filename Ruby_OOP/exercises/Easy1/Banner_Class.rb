class Banner
  attr_accessor :message

  def initialize(message)
    @message = message
  end

  def message_length
    message.length
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * message_length}-+"
  end

  def empty_line
    "| #{' ' * message_length} |"
  end

  def message_line
    "| #{@message} |"
  end
end


banner = Banner.new('To boldly go where no one has gone before.')
puts banner


banner = Banner.new('')
puts banner
