class Rails::MyHelperGenerator < Rails::Generators::NamedBase
  # source_root File.expand_path("templates", __dir__)
  def create_helper_file
    create_file "app/helpers/#{file_name}_helper.rb", <<~RUBY
      module #{class_name}Helper
        # I'm helping!
      end
    RUBY
  end
end
