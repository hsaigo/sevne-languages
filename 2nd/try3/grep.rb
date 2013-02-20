raise "ruby grep.rb [pattern] [file] " unless ARGV.size == 2

pattern = Regexp.new(ARGV[0])
filepath = ARGV[1]

File.open(filepath) do |file|
  while file.gets
    puts $_ if pattern =~ $_
  end
end

