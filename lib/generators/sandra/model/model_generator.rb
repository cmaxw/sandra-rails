require "generators/sandra"

module Sandra
  module Generators

    class ModelGenerator < Base
      argument :model_key, :type => :string, :default => "key"
      argument :columns, :type => :hash, :default => [], :banner => "field:type field:type"

      check_class_collision

      def create_model_file
        template 'model.rb', File.join('app/models', class_path, "#{file_name}.rb")
      end

      hook_for :test_framework
    end
  end
end
