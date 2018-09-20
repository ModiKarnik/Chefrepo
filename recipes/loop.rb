for xyz in [ "file1", "file2" ] do
  file "/tmp/#{xyz}" do
    action :create
  end
end
