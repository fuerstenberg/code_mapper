module CodeMapper
  module Filter
    class ProjectRoot
      def initialize(root)
        @root = root.to_s
      end

      def keep?(tp, normalized_class_name)
        tp.path.include? @root
      end
    end
  end
end
