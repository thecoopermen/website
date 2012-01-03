Date::DATE_FORMATS.merge!(
  :default => "%m/%d/%Y"
)

Time::DATE_FORMATS.merge!(
  :post       => "%b %-d, %Y",
  :time_input => "%-l:%M%P"
)