local function reverse_elements(original_table)
  local reversed_table = {}

  while #original_table >= 1 do
    table.insert(reversed_table, table.remove(original_table))
  end

  return reversed_table
end

return {
  reverse_elements = reverse_elements
}
