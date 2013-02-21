class ActsAsCsv

  class CsvRow
    def method_missing(name, *args)
      @cols[@index_of[name.to_s]]
    end

    def initialize(index_of, cols)
      @index_of = index_of
      @cols = cols
    end
  end

  attr_accessor :headers, :csv_contents

  def each
    @csv_contents.each do |row|
      yield row
    end
  end

  def read
    file = File.new(self.class.to_s.downcase + '.txt')
    @headers = file.gets.chomp.split(/\s*,\s*/)

    index_of = {}
    @headers.each_with_index{|title, index| index_of[title] = index}

    file.each do |row|
      @csv_contents << CsvRow.new(index_of, row.chomp.split(/\s*,\s*/))
    end
  end

  def initialize
    @csv_contents = []
    read
  end

end

class RubyCsv < ActsAsCsv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

m.each do |row|
  puts row.bb
end
