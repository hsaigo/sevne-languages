class Tree
  attr_accessor :children, :node_name

  def initialize(node_name, children = nil)
    @node_name = node_name
    @children = []

    children.each do |child_name, grandchildren|
      @children << Tree.new(child_name, grandchildren)
    end if children.kind_of?(Hash)

    children.each do |child_name|
      @children << Tree.new(child_name)
    end if children.kind_of?(Array)

  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end

end

ruby_tree = Tree.new("root", {
  'grandpa' => { 
    'dad' => {
      'child 1' => ['child 1-1', 'child 1-2'], 
      'child 2' => [] 
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


