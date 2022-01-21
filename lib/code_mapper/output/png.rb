require 'ruby-graphviz'

module CodeMapper
  module Output
    class Png
      def initialize(file)
        @file = file
        @stack = []

        @graph = GraphViz.new(:G, type: :digraph, rankdir: "LR")
      end

      def push(tp, normalized_class_name)
        node = @graph.add_nodes("#{normalized_class_name}.#{tp.method_id.to_s}", shape: :box)

        if @stack != []
          @graph.add_edges( @stack.last, node )
        end

        @stack << node
      end

      def pop(tp, normalized_class_name)
        @stack.pop
      end

      def done
        @graph.output( png: @file )
      end
    end
  end
end
