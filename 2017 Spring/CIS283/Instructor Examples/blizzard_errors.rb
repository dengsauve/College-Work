class Error
  def initialize(id, error_string)
    @id = id
    @error_string = error_string
  end
  attr_reader :id, :error_string
  def to_s
    "#{@id.to_s}: #{@error_string}"
  end
  def to_xml
    "<e id=\"#{@id}\">#{error_string}</e>"
  end
end


# line = '<e id="111">You are attempting to sign in using a locale descriptor for an unsupported language.</e>'
# line =~ /<e\sid="(\d+)">(.+?)<\/e>/

# found_error = Error.new($1, $2)

# puts found_error.to_s



errors = []

blizzard_file = File.open("blizzarderrors.xml.txt")

while !blizzard_file.eof?
  if blizzard_file.gets.chomp =~ /<e\sid="(\d+)">(.+?)<\/e>/
    errors << Error.new($1, $2)
  end
end

blizzard_file.close


errors.each do |i|
  puts i.to_s
end


