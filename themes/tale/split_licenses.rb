require 'json'

licenses = JSON.parse(File.read('licenses.json'))
licenses['licenses'].each do |l|
  File.open("data/licenses/#{l['licenseId']}.json", 'w') do |f|
    # pretty generated so we can more easily see diffs between revisions, when
    # we update this
    pretty_json = JSON.pretty_generate(l)
    f.write(pretty_json)
  end
end
