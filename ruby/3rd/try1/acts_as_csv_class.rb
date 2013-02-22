class ActsAsCsv

  class CsvRow

    include Enumerable

    def method_missing(name, *args)
      @header_map[name.to_s]
    end

    def initialize(cols, header_map = {})
      @cols = cols
      @header_map = header_map
    end

    def each
      @cols.each{|col| yield col}
    end

    def inspect
      @cols.inspect
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

    file.each do |row|
      cols = row.chomp.split(/\s*,\s*/)
      header_map = {}
      @headers.each_with_index do |title, index|
        header_map[title] = cols[index] if index < cols.count
      end
      @csv_contents << CsvRow.new(cols, header_map)
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
  row.each{|col| p col}
  puts row.bb
end
