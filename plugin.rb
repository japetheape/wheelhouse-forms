class FormsPlugin < Wheelhouse::Plugin
  description do
    name    "Forms Plugin"
    summary "<SUMMARY>"
    author  "<AUTHOR>"
    email   "<EMAIL>"
    url     "<URL>"
  end
  
  resource FormsPlugin::Form
end

i18n_file = File.dirname(__FILE__) + '/locale/en.yml'
I18n.load_path << i18n_file if File.exist?(i18n_file)
