url.links_array.each do | link |
  pdf.text "#{link.to_s.encode("Windows-1252", "UTF-8", invalid: :replace, undef: :replace)}"
end