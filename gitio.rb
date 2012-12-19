url = ARGV[0]

unless url.match(/^(https?:\/\/)?(gist2?\.)?github.com/)
  print 'URL must be from github.com'
  abort
end

res = `curl --silent -i http://git.io -F url=#{url}`
location = res.match(/Location: (.+)\n?/)[1]
`echo #{location} | pbcopy`
print <<-OUTPUT
Copied to clipboard
#{location}
OUTPUT
