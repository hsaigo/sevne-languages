class Tree
  attr_accessor :children, :node_name

  def initialize(config)
    @children = []

    if !config.kind_of?(Enumerable)
      @node_name = config.to_s
    elsif config.kind_of?(Hash) && config.count == 1
      config.each do |name, children|
        @node_name = name.to_s
        if children.kind_of?(Hash)
          children.each{|child_name, grandchildren| @children << Tree.new({child_name => grandchildren})}
        elsif children.kind_of?(Array)
          children.each{|child| @children << Tree.new(child)}
        end
      end
    end
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end

end

ruby_tree = Tree.new({
  'grandpa' => { 
    'dad' => {
      'child 1' => ['child 1-1', 'child 1-2'], 
      'child 2' => [{'child 2-1' => ['child 2-1-1', 'child 2-1-2']}, 'child 2-2'] 
    },
    'uncle' => {
      'child 3' => [],
      'child 4' => ['child 4-1', 'child 4-2']
    }
  }
})


puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}

puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}


