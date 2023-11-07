require 'csv'

# TOOD: de base_html_file moet gegenereert worden met svelte om menu bar, etc te hebben
# TODO: andere foto's voor error messages

Error = Struct.new :code, :description

prefix = "ksadebiekorf.be-dist"

base_html_file = File.read "./ksadebiekorf.be/src/app.html"

csv = CSV.parse(File.read("http-status-codes-1.csv"), headers: true)
csv = csv.filter do |row|
  row["Description"] != "Unassigned"
end
error_codes = csv.map do |row|
  Error.new(row["Value"], row["Description"])
end
error_codes.each do |error|
  file_name = "#{prefix}/#{error.code}.shtml"

  File.write(
    file_name,
    base_html_file
      .sub("%sveltekit.head%", "<title>#{error.description} (error #{error.code})</title>")
      .sub("%sveltekit.body%", "<img src=\"https://http.cat/#{error.code}\"></img><a href=\"https://ksadebiekorf.be\"><button>terug naar de website</button></a>")
  )
end
