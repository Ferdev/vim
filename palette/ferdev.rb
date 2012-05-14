vim_colors "ferdev" do
  author "Fernando Espinosa"
  notes  "Dark scheme"

  reset      true
  background :dark

  Normal "aa92ed", "202020"

  Folded "808080", "ECECEC", :gui => "bold"
  link :vimFold, :FoldColumn, :to => :Folded
end
