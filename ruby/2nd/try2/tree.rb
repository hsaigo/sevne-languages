class Tree
  attr_accessor :children, :node_name

  def add_children(children)
    if children.kind_of?(Hash)
      children.each do |child_name, grandchildren| 
        @children << Tree.new({child_name => grandchildren})
      end
    elsif children.kind_of?(Array)
      children.each do |child|
        @children << Tree.new(child)
      end
    else
      @children << Tree.new(children)
    end
  end

  def initialize(config)
    @children = []

    unless config.kind_of?(Hash) || config.kind_of?(Array)
      @node_name = config.to_s
      return
    end

    if config.kind_of?(Hash) && config.count == 1
      config.each do |name, children|
        @node_name = name.to_s
        config = children
      end
    end

    add_children(config)
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
      'child 3' => [['child 3-0-1', 'child 3-0-2']],
      'child 4' => ['child 4-1', 'child 4-2']
    }
  }
})


puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}

puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}


